VERSION?=	v1.9.1

all: build-env build apply

build-env:
	@sops decrypt .enc.env > .env

build:
	@cat app.yml.template | sed -Ee 's/%%VERSION%%/${VERSION}/g' > app.yml

apply: build
	@overlord apply -f app.yml

project-info:
	@overlord get-info -f app.yml -t projects --filter-per-project

vm-info:
	@overlord get-info -f app.yml -t vm --filter-per-project

clean: build
	@overlord destroy -Ff app.yml
