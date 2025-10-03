JAIL?=		filebrowser-frontend
VERSION?=	v2.44.0
OUTPUT?=	${PWD}

all: build stop

build:
	@appjail makejail -j "${JAIL}" -- \
		--version "${VERSION}" \
		--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
