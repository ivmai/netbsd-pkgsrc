# $NetBSD: buildlink3.mk,v 1.8 2023/02/07 01:41:09 pho Exp $

BUILDLINK_TREE+=	hs-commonmark-extensions

.if !defined(HS_COMMONMARK_EXTENSIONS_BUILDLINK3_MK)
HS_COMMONMARK_EXTENSIONS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-commonmark-extensions+=	hs-commonmark-extensions>=0.2.3
BUILDLINK_ABI_DEPENDS.hs-commonmark-extensions+=	hs-commonmark-extensions>=0.2.3.3nb1
BUILDLINK_PKGSRCDIR.hs-commonmark-extensions?=		../../textproc/hs-commonmark-extensions

.include "../../textproc/hs-commonmark/buildlink3.mk"
.include "../../converters/hs-emojis/buildlink3.mk"
.include "../../net/hs-network-uri/buildlink3.mk"
.endif	# HS_COMMONMARK_EXTENSIONS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-commonmark-extensions
