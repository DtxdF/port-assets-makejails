PORTNAME=	certwarden
DISTVERSIONPREFIX=	v
DISTVERSION=	0.28.0
CATEGORIES=	security
MASTER_SITES=	LOCAL/dtxdf/${PORTNAME}/:assets
DISTFILES=	${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION}.frontend${EXTRACT_SUFX}:assets \
		${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION}.vendor${EXTRACT_SUFX}:assets

MAINTAINER=	dtxdf@FreeBSD.org
COMMENT=	Centralized ACME Client
WWW=		https://www.certwarden.com

LICENSE=	UNKNOWN
LICENSE_NAME=	unknown
LICENSE_FILE=	${WRKSRC_certwarden}/LICENSE.md
LICENSE_PERMS=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

USES=		go:1.25,modules
USE_GITHUB=	yes
GH_ACCOUNT=	gregtwallace
GH_PROJECT=	certwarden-backend
GH_TUPLE=	gregtwallace:certwarden:${DISTVERSIONPREFIX}${DISTVERSION}:certwarden
USE_RC_SUBR=	${PORTNAME}

GO_MOD_DIST=	github
GO_TARGET=	./cmd/api-server:${PORTNAME}

CGO_CFLAGS=	-D_LARGEFILE64_SOURCE

SUB_LIST=	USER=${CERTWARDEN_USER}

USERS=		${CERTWARDEN_USER}
GROUPS=		${CERTWARDEN_GROUP}

PLIST_SUB=	GROUP=${CERTWARDEN_GROUP} \
		USER=${CERTWARDEN_USER}

CERTWARDEN_USER=	www
CERTWARDEN_GROUP=	${CERTWARDEN_USER}

post-extract:
	@${MKDIR} ${WRKSRC}/vendor
	@cd ${WRKDIR}/${PORTNAME}-vendor && ${COPYTREE_SHARE} . ${WRKSRC}/vendor

post-patch:
	@${REINPLACE_CMD} -e 's#%%WWWDIR%%#${WWWDIR}#' ${WRKSRC}/pkg/domain/app/frontend.go

post-install:
	@${MKDIR} ${STAGEDIR}${WWWDIR}
	@cd ${WRKDIR}/${PORTNAME}-frontend && \
	    ${COPYTREE_SHARE} . ${STAGEDIR}${WWWDIR}
	@${MKDIR} ${STAGEDIR}${WWWDIR}/data/app
	${INSTALL_DATA} ${WRKSRC}/config.default.yaml ${STAGEDIR}${WWWDIR}/config.default.yaml
	@${REINPLACE_CMD} -e "s/'auto_check': true/'auto_check': false/" ${STAGEDIR}${WWWDIR}/config.default.yaml
	@${MV} ${STAGEDIR}${WWWDIR}/env.js ${STAGEDIR}${WWWDIR}/env.js.sample

.include <bsd.port.mk>
