JAIL?=		filebrowser-quantum-assets
VERSION?=	v1.0.1-stable
OUTPUT?=	${PWD}

all: build stop

build: build-frontend build-vendor

build-frontend:
	@appjail makejail \
		-j "${JAIL}" \
		-f Makejail.frontend \
		-- \
			--version "${VERSION}" \
			--output "${OUTPUT}"

build-vendor:
	@appjail makejail \
		-j "${JAIL}" \
		-f Makejail.vendor \
		-- \
			--version "${VERSION}" \
			--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
