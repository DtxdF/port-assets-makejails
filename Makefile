PORTS=	filebrowser \
		homebox \
		homepage \
		ntfy \
		pocket-id \
		tinyauth \
		filepizza \
		readur \
		backrest \
		github-release-monitor

all: build

build:
.for p in ${PORTS}
	make -C ${p}
.endfor
