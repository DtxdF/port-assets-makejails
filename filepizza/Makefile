JAIL?=		filepizza-files
VERSION?=	3258673e790145ba86637114a35388165a651ff3
OUTPUT?=	${PWD}

all: build stop

build:
	@appjail makejail -j "${JAIL}" -- \
		--version "${VERSION}" \
		--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
