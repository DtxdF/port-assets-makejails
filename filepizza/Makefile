JAIL?=		filepizza-files
VERSION?=	4db3b94b68f0a7517842a54e590ab72e23293ebc
OUTPUT?=	${PWD}

all: build stop

build:
	@appjail makejail -j "${JAIL}" -- \
		--version "${VERSION}" \
		--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
