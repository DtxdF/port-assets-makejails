JAIL?=		zen-assets
VERSION?=	c8e14d70de7de631cd9d4cda55daccf227283d92
EXTRA?=		1.5.0.20260429
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
