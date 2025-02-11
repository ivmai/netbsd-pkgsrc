# $NetBSD: buildlink3.mk,v 1.57 2023/01/29 21:14:32 ryoon Exp $

BUILDLINK_TREE+=	pango

.if !defined(PANGO_BUILDLINK3_MK)
PANGO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.pango+=	pango>=1.6.0
BUILDLINK_ABI_DEPENDS.pango+=	pango>=1.50.12nb1
BUILDLINK_PKGSRCDIR.pango?=	../../devel/pango

.include "../../mk/bsd.fast.prefs.mk"

pkgbase := pango
.include "../../mk/pkg-build-options.mk"

.if ${PKG_BUILD_OPTIONS.pango:Mlibthai}
.include "../../devel/libthai/buildlink3.mk"
.endif

.if ${PKG_BUILD_OPTIONS.pango:Mx11}
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.endif

.include "../../converters/fribidi/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../fonts/harfbuzz/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.endif # PANGO_BUILDLINK3_MK

BUILDLINK_TREE+=	-pango
