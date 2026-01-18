VERSION?=	v1.11.1
OUTPUT?=	${PWD}
ASSET=		backrest-${VERSION}.frontend.tar.gz

.PHONY: all build-env build apply download

all: build-env build apply ${ASSET}

build-env:
	@sops decrypt .enc.env > .env

build:
	@cat app.yml.template | sed -Ee 's/%%VERSION%%/${VERSION}/g' > app.yml

apply: build
	@overlord apply -f app.yml

cancel: build
	@overlord cancel -f app.yml

${ASSET}: build-env
	@env ASSET=${ASSET} OUTPUT=${OUTPUT} ./wait-and-download.sh

project-info:
	@overlord get-info -f app.yml -t projects --filter-per-project

vm-info:
	@overlord get-info -f app.yml -t vm --filter-per-project

clean: build
	@overlord destroy -Ff app.yml
