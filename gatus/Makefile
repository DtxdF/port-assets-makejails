JAIL?=		gatus-assets
VERSION?=	v5.33.0
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
