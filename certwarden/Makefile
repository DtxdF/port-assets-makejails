VERSION?=		v0.28.0
JAIL?=			certwarden-assets
OUTPUT?=		${PWD}
FRONTEND_ASSET=	certwarden-${VERSION}.frontend.tar.gz

.PHONY: all
all: build-frontend build-vendor

.PHONY: build-env
build-env:
	@sops decrypt .enc.env > .env

.PHONY: build-templates
build-templates: build-env
	@cat frontend.yml.template | sed -Ee 's/%%VERSION%%/${VERSION}/g' > frontend.yml

.PHONY: build-frontend
build-frontend: build-templates
	@overlord apply -f frontend.yml
	@env ASSET=${FRONTEND_ASSET} OUTPUT=${OUTPUT} ./wait-and-download.sh

.PHONY: build-vendor
build-vendor:
	@appjail makejail \
		-j "${JAIL}" \
		-f Makejail.vendor \
		-- \
			--version "${VERSION}" \
			--output "${OUTPUT}"

.PHONY: cancel
cancel: build-templates
	@overlord cancel -f frontend.yml

.PHONY: frontend-project-info
frontend-project-info: build-templates
	@overlord get-info -f frontend.yml -t projects --filter-per-project

.PHONY: frontend-vm-info
frontend-vm-info: build-templates
	@overlord get-info -f frontend.yml -t vm --filter-per-project

.PHONY: clean
clean: build-templates
	@overlord destroy -Ff frontend.yml
	@appjail stop -- "${JAIL}" > /dev/null 2>&1 || true
