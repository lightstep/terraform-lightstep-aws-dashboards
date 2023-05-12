
ready: gen fmt

# generates the root module main.tf, variables.tf, outputs.tf and README.md
gen:
	go run tools/generaterootmod.go

fmt:
	terraform fmt
	gofmt -w -s ./tools

check:
	terraform fmt -check -recursive
	tflint --config .tflint.hcl --recursive

clean:
	rm -rf .terraform*

init:
	terraform init

apply:
	terraform apply \
		-var="lightstep_organization=LightStep" \
		-var="lightstep_env=staging" \
		-var="lightstep_project=dev-integrations" \
		-var="lightstep_api_key_env_var=LIGHTSTEP_API_KEY"

destroy:
	terraform destroy \
		-var="lightstep_organization=LightStep" \
		-var="lightstep_env=staging" \
		-var="lightstep_project=dev-integrations" \
		-var="lightstep_api_key_env_var=LIGHTSTEP_API_KEY"

fresh: clean init apply
