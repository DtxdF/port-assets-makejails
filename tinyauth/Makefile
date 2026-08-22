NAME?=		tinyauth-assets
VERSION?=	v5.1.3
OUTPUT?=	${PWD}
INSTANCE_ID!=	uuidgen -r
ASSET=		tinyauth-${VERSION}.frontend.tar.gz

.PHONY: all
all: build-frontend build-vendor

.PHONY: build-frontend
build-frontend: build-env app.yml
	@env NAME=${NAME} \
	     INSTANCE_ID=${INSTANCE_ID} \
	         overlord apply -f app.yml
	@make ${ASSET}
	@make clean-frontend

.PHONY: cancel-frontend
cancel-frontend: build-env app.yml
	@env NAME=${NAME} \
	     INSTANCE_ID=${INSTANCE_ID} \
	         overlord cancel -f app.yml

.PHONY: app.yml
app.yml:
	@cat build.sh | sed -Ee 's/%%VERSION%%/'${VERSION}'/' | yq '.cloud-init.user-data.write_files[0].content = load_str("/dev/stdin")' ../app.yml.template > app.yml

${ASSET}:
	@env OUTPUT=${OUTPUT} \
	     ASSET=${ASSET} \
	     VM_HOSTNAME=${NAME} \
	         ../wait-and-download.sh

.PHONY: clean-frontend
clean-frontend: build-env app.yml
	@env NAME=${NAME} \
	     INSTANCE_ID=${INSTANCE_ID} \
		     overlord destroy -Ff app.yml

.PHONY: frontend-status
frontend-status: build-env app.yml
	@echo "===> Project information:"
	@env NAME=${NAME} \
	     INSTANCE_ID=${INSTANCE_ID} \
		     overlord get-info -f app.yml -t projects --filter-per-project
	@echo "===> VM information:"
	@env NAME=${NAME} \
	     INSTANCE_ID=${INSTANCE_ID} \
		     overlord get-info -f app.yml -t vm --filter-per-project

.PHONY: build-env
build-env:
	@sops decrypt ../.enc.env > .env

.PHONY: build-vendor
build-vendor:
	@appjail makejail \
	    -j "${NAME}" -f Makejail.vendor -- \
	    --version "${VERSION}" \
	    --output "${OUTPUT}"
	@make clean-vendor

.PHONY: clean-vendor
clean-vendor:
	@appjail stop -- "${NAME}"
