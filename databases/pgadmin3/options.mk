# $NetBSD: options.mk,v 1.6 2023/06/06 12:40:33 riastradh Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.pgadmin3
PKG_SUPPORTED_OPTIONS=	doc

.include "../../mk/bsd.options.mk"

PLIST_VARS=	doc

.if !empty(PKG_OPTIONS:Mdoc)
PLIST.doc=	yes
PYTHON_FOR_BUILD_ONLY=yes
PYTHON_VERSIONS_INCOMPATIBLE=	27
TOOL_DEPENDS+=	${PYPKGPREFIX}-sphinx-[0-9]*:../../textproc/py-sphinx
.include "../../lang/python/pyversion.mk"
CONFIGURE_ARGS+=	--with-sphinx-build=${PREFIX}/bin/sphinx-build-${PYVERSSUFFIX}
.else
CONFIGURE_ENV+=		ac_cv_path_SPHINX_BUILD=
.endif
