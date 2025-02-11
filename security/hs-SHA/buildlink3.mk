# $NetBSD: buildlink3.mk,v 1.6 2023/02/07 01:41:03 pho Exp $

BUILDLINK_TREE+=	hs-SHA

.if !defined(HS_SHA_BUILDLINK3_MK)
HS_SHA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-SHA+=	hs-SHA>=1.6.4
BUILDLINK_ABI_DEPENDS.hs-SHA+=	hs-SHA>=1.6.4.4nb5
BUILDLINK_PKGSRCDIR.hs-SHA?=	../../security/hs-SHA
.endif	# HS_SHA_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-SHA
