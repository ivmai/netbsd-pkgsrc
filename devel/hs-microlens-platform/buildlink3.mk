# $NetBSD: buildlink3.mk,v 1.5 2023/02/07 01:40:43 pho Exp $

BUILDLINK_TREE+=	hs-microlens-platform

.if !defined(HS_MICROLENS_PLATFORM_BUILDLINK3_MK)
HS_MICROLENS_PLATFORM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-microlens-platform+=	hs-microlens-platform>=0.4.3
BUILDLINK_ABI_DEPENDS.hs-microlens-platform+=	hs-microlens-platform>=0.4.3.3nb1
BUILDLINK_PKGSRCDIR.hs-microlens-platform?=	../../devel/hs-microlens-platform

.include "../../devel/hs-hashable/buildlink3.mk"
.include "../../devel/hs-microlens/buildlink3.mk"
.include "../../devel/hs-microlens-ghc/buildlink3.mk"
.include "../../devel/hs-microlens-mtl/buildlink3.mk"
.include "../../devel/hs-microlens-th/buildlink3.mk"
.include "../../devel/hs-unordered-containers/buildlink3.mk"
.include "../../devel/hs-vector/buildlink3.mk"
.endif	# HS_MICROLENS_PLATFORM_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-microlens-platform
