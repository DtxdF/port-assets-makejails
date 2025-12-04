JAIL?=		runme-assets
VERSION?=	v3.16.4
OUTPUT?=	${PWD}

all: build stop

build: build-vendor

build-vendor:
	@appjail makejail \
		-j "${JAIL}" \
		-f Makejail.vendor \
		-- \
			--version "${VERSION}" \
			--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
