package main

import (
	"bufio"
	"bytes"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

func writeMainHead(w io.Writer) {
	fmt.Fprint(w, `terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.84.2"
    }
  }
  required_version = ">= v1.0.11"
}

provider "lightstep" {
  api_key_env_var = var.cloud_observability_api_key_env_var
  organization    = var.cloud_observability_organization
  environment     = var.cloud_observability_env
}
`)
}

func writeMainModuleBlocks(w io.Writer, dirPath string) error {
	files, err := os.ReadDir(dirPath)
	if err != nil {
		return err
	}

	for _, file := range files {
		if file.IsDir() {
			dirSnake := strings.ReplaceAll(file.Name(), "-", "_")
			fmt.Fprintf(w, "\nmodule \"cloud_observability_%s\" {\n", dirSnake)
			fmt.Fprintf(w, "  source            = \"./modules/%s\"\n", file.Name())
			fmt.Fprint(w, "  cloud_observability_project = var.cloud_observability_project\n")
			fmt.Fprint(w, "}\n")
		}
	}
	return nil
}

func extractAppName(filename string) (string, error) {
	file, err := os.Open(filename)
	if err != nil {
		return "", err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		match, err := regexp.MatchString(`^\s*dashboard_name\s*=\s*"AWS `, line)
		if err != nil {
			return "", err
		}
		if match {
			result := strings.SplitN(line, `= "AWS `, 2)
			if len(result) > 1 {
				return strings.TrimSuffix(result[1], `"`), nil
			}
		}
	}

	if err := scanner.Err(); err != nil {
		return "", err
	}

	return "", nil
}

func writeOutputsBlocks(w io.Writer, dirPath string) error {
	files, err := os.ReadDir(dirPath)
	if err != nil {
		return err
	}

	for _, file := range files {
		if file.IsDir() {
			dirSnake := strings.ReplaceAll(file.Name(), "-", "_")
			appName, err := extractAppName(filepath.Join(dirPath, file.Name(), "main.tf"))
			if err != nil {
				return err
			}
			fmt.Fprintf(w, "\noutput \"cloud_observability_%s_url\" {\n", dirSnake)
			fmt.Fprintf(w, "  value       = module.cloud_observability_%s.dashboard_url\n", dirSnake)
			fmt.Fprintf(w, "  description = \"Cloud Observability AWS %s Dashboard\"\n", appName)
			fmt.Fprint(w, "}\n")
		}
	}
	return nil
}

func writeReadmeServices(w io.Writer, dirPath string) error {
	files, err := os.ReadDir(dirPath)
	if err != nil {
		return err
	}

	for _, file := range files {
		if file.IsDir() {
			// dirSnake := strings.ReplaceAll(file.Name(), "-", "_")
			appName, err := extractAppName(filepath.Join(dirPath, file.Name(), "main.tf"))
			if err != nil {
				return err
			}
			fmt.Fprintf(w, "* __%s__ (module: [`%s`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/main/modules/%s))\n", appName, file.Name(), file.Name())
		}
	}
	return nil
}

func updateReadme(path, startMarker, endMarker, replacementText string) error {
	in, err := os.Open(path)
	if err != nil {
		return fmt.Errorf("failed ot open input file: %w", err)
	}
	defer in.Close()

	tmpOutPath := path + ".tmp"
	tmpOut, err := os.Create(tmpOutPath)
	if err != nil {
		return fmt.Errorf("failed to create temp file: %w", err)
	}
	defer tmpOut.Close()

	scanner := bufio.NewScanner(in)
	writer := bufio.NewWriter(tmpOut)

	isReplacing := false
	for scanner.Scan() {
		line := scanner.Text()
		if isReplacing {
			if strings.Contains(line, endMarker) {
				isReplacing = false
				if _, err := writer.WriteString(line + "\n"); err != nil {
					return fmt.Errorf("failed to write to temp file: %w", err)
				}
			}
		} else {
			if strings.Contains(line, startMarker) {
				line = line + "\n" + replacementText
				isReplacing = true
			}
			if _, err := writer.WriteString(line + "\n"); err != nil {
				return fmt.Errorf("failed to write to temp file: %w", err)
			}
		}
	}

	if err := scanner.Err(); err != nil {
		return fmt.Errorf("error reading input file: %w", err)
	}

	if err := writer.Flush(); err != nil {
		return fmt.Errorf("error writing to temp file: %w", err)
	}

	if err := os.Rename(tmpOutPath, path); err != nil {
		return fmt.Errorf("error replacing original file: %w", err)
	}

	return nil
}

func main() {
	rootMain, err := os.Create("main.tf")
	if err != nil {
		log.Fatal(err)
	}
	defer rootMain.Close()

	writeMainHead(rootMain)
	if err := writeMainModuleBlocks(rootMain, "modules"); err != nil {
		log.Fatal(err)
	}

	rootOutputs, err := os.Create("outputs.tf")
	if err != nil {
		log.Fatal(err)
	}
	defer rootOutputs.Close()

	if err := writeOutputsBlocks(rootOutputs, "modules"); err != nil {
		log.Fatal(err)
	}

	buf := bytes.NewBuffer(nil)
	if err := writeReadmeServices(buf, "modules"); err != nil {
		log.Fatal(err)
	}

	if err := updateReadme("README.md", "<!-- modules autogenerated section -->", "<!-- end autogenerated section -->", buf.String()); err != nil {
		log.Fatal(err)
	}
}
