JAIL?=		opkssh-assets
VERSION?=	v0.10.0
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
