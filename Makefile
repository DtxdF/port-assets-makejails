PORTS=	filebrowser \
		homebox \
		homepage \
		ntfy \
		pocket-id \
		tinyauth \
		filepizza \
		readur \
		backrest \
		github-release-monitor \
		navidrome \
		filebrowser-quantum \
		nginx-ui \
		gatus \
		gol \
		opkssh \
		certwarden \
		runme

all: build

build:
.for p in ${PORTS}
	make -C ${p}
.endfor

show-version:
.for p in ${PORTS}
	@echo "${p}: `make -C ${p} -V VERSION`"
.endfor
