# $NetBSD: buildlink3.mk,v 1.5 2023/02/07 01:41:00 pho Exp $

BUILDLINK_TREE+=	hs-monoid-subclasses

.if !defined(HS_MONOID_SUBCLASSES_BUILDLINK3_MK)
HS_MONOID_SUBCLASSES_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-monoid-subclasses+=	hs-monoid-subclasses>=1.2.1
BUILDLINK_ABI_DEPENDS.hs-monoid-subclasses+=	hs-monoid-subclasses>=1.2.1nb1
BUILDLINK_PKGSRCDIR.hs-monoid-subclasses?=	../../math/hs-monoid-subclasses

.include "../../math/hs-commutative-semigroups/buildlink3.mk"
.include "../../math/hs-primes/buildlink3.mk"
.include "../../devel/hs-vector/buildlink3.mk"
.endif	# HS_MONOID_SUBCLASSES_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-monoid-subclasses
