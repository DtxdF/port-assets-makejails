VERSION?=	v5.0.4
OUTPUT?=	${PWD}
FRONTEND_ASSET=		tinyauth-${VERSION}.frontend.tar.gz
JAIL?=		tinyauth-assets

.PHONY: build-env build-frontend build-vendor

build-env:
	@sops decrypt .enc.env > .env

build-template:
	@cat frontend.yml.template | sed -Ee 's/%%VERSION%%/${VERSION}/g' > frontend.yml

build-frontend: build-env build-template
	@env JAIL=${JAIL} overlord apply -f frontend.yml

build-vendor:
	@appjail makejail \
		-j "${JAIL}" \
		-f Makejail.vendor \
			-- \
			--version "${VERSION}" \
			--output "${OUTPUT}"

cancel: build-env build-template
	@env JAIL=${JAIL} overlord cancel -f frontend.yml

download-frontend: build-env
	@env ASSET=${FRONTEND_ASSET} OUTPUT=${OUTPUT} ./wait-and-download.sh

project-info: build-env build-template
	@env JAIL=${JAIL} overlord get-info -f frontend.yml -t projects --filter-per-project

vm-info: build-env build-template
	@env JAIL=${JAIL} overlord get-info -f frontend.yml -t vm --filter-per-project

clean-frontend: build-env build-template
	@env JAIL=${JAIL} overlord destroy -Ff frontend.yml

clean-vendor:
	@appjail stop -- "${JAIL}"
