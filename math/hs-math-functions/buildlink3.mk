# $NetBSD: buildlink3.mk,v 1.8 2023/02/07 01:41:00 pho Exp $

BUILDLINK_TREE+=	hs-math-functions

.if !defined(HS_MATH_FUNCTIONS_BUILDLINK3_MK)
HS_MATH_FUNCTIONS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-math-functions+=	hs-math-functions>=0.3.4
BUILDLINK_ABI_DEPENDS.hs-math-functions+=	hs-math-functions>=0.3.4.2nb6
BUILDLINK_PKGSRCDIR.hs-math-functions?=		../../math/hs-math-functions

.include "../../devel/hs-data-default-class/buildlink3.mk"
.include "../../devel/hs-primitive/buildlink3.mk"
.include "../../devel/hs-vector/buildlink3.mk"
.endif	# HS_MATH_FUNCTIONS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-math-functions
