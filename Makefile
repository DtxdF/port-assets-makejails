PORTS=	filebrowser \
		homebox \
		homepage \
		ntfy \
		pocket-id \
		tinyauth \
		filepizza

all: build

build:
.for p in ${PORTS}
	make -C ${p}
.endfor
