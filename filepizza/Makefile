JAIL?=		filepizza-files
VERSION?=	8ea276d2df0f10c6bb4191203e682b96c22a77d8
OUTPUT?=	${PWD}

all: build stop

build:
	@appjail makejail -j "${JAIL}" -- \
		--version "${VERSION}" \
		--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
