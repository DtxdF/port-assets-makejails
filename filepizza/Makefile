JAIL?=		filepizza-files
VERSION?=	60704b45e6e4ed0fbcc43931b759d0cb9536c146
OUTPUT?=	${PWD}

all: build stop

build:
	@appjail makejail -j "${JAIL}" -- \
		--version "${VERSION}" \
		--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
