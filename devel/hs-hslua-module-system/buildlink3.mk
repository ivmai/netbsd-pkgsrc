# $NetBSD: buildlink3.mk,v 1.9 2023/02/07 01:40:40 pho Exp $

BUILDLINK_TREE+=	hs-hslua-module-system

.if !defined(HS_HSLUA_MODULE_SYSTEM_BUILDLINK3_MK)
HS_HSLUA_MODULE_SYSTEM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-hslua-module-system+=	hs-hslua-module-system>=1.0.2
BUILDLINK_ABI_DEPENDS.hs-hslua-module-system+=	hs-hslua-module-system>=1.0.2nb1
BUILDLINK_PKGSRCDIR.hs-hslua-module-system?=	../../devel/hs-hslua-module-system

.include "../../lang/hs-hslua-core/buildlink3.mk"
.include "../../lang/hs-hslua-marshalling/buildlink3.mk"
.include "../../lang/hs-hslua-packaging/buildlink3.mk"
.include "../../sysutils/hs-temporary/buildlink3.mk"
.endif	# HS_HSLUA_MODULE_SYSTEM_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-hslua-module-system
