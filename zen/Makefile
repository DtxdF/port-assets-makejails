JAIL?=		zen-assets
VERSION?=	6c716f7b17c5757ff282917963400ee679e2dfe4
EXTRA?=		1.5.0.20261008
OUTPUT?=	${PWD}

all: build stop

build: build-frontend build-vendor

build-frontend:
	@appjail makejail \
		-j "${JAIL}" \
		-f Makejail.frontend \
		-- \
			--version "${VERSION}" \
			--extra "${EXTRA}" \
			--output "${OUTPUT}"

build-vendor:
	@appjail makejail \
		-j "${JAIL}" \
		-f Makejail.vendor \
		-- \
			--version "${VERSION}" \
			--extra "${EXTRA}" \
			--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
