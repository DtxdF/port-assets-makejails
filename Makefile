PORTS=	filebrowser \
		homebox \
		homepage \
		ntfy \
		pocket-id \
		tinyauth

all: build

build:
.for p in ${PORTS}
	make -C ${p}
.endfor
