# $NetBSD: buildlink3.mk,v 1.9 2023/02/07 01:41:10 pho Exp $

BUILDLINK_TREE+=	hs-hslua-module-text

.if !defined(HS_HSLUA_MODULE_TEXT_BUILDLINK3_MK)
HS_HSLUA_MODULE_TEXT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-hslua-module-text+=	hs-hslua-module-text>=1.0.3
BUILDLINK_ABI_DEPENDS.hs-hslua-module-text+=	hs-hslua-module-text>=1.0.3nb1
BUILDLINK_PKGSRCDIR.hs-hslua-module-text?=	../../textproc/hs-hslua-module-text

.include "../../lang/hs-hslua-core/buildlink3.mk"
.include "../../lang/hs-hslua-marshalling/buildlink3.mk"
.include "../../lang/hs-hslua-packaging/buildlink3.mk"
.endif	# HS_HSLUA_MODULE_TEXT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-hslua-module-text
