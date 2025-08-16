JAIL?=		filepizza-files
VERSION?=	3bd340d24bb86938450c1eb9e66ae601167b1bba
OUTPUT?=	${PWD}

all: build stop

build:
	@appjail makejail -j "${JAIL}" -- \
		--version "${VERSION}" \
		--output "${OUTPUT}"

stop:
	@appjail stop -- "${JAIL}"
