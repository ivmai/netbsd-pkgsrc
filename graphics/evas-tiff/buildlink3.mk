# $NetBSD: buildlink3.mk,v 1.9 2023/01/29 21:14:39 ryoon Exp $

BUILDLINK_TREE+=	evas-tiff

.if !defined(EVAS_TIFF_BUILDLINK3_MK)
EVAS_TIFF_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.evas-tiff+=	evas-tiff>=1.7.7
BUILDLINK_ABI_DEPENDS.evas-tiff?=	evas-tiff>=1.7.10nb3
BUILDLINK_PKGSRCDIR.evas-tiff?=		../../graphics/evas-tiff

.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/evas/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"

.endif # EVAS_TIFF_BUILDLINK3_MK

BUILDLINK_TREE+=	-evas-tiff
