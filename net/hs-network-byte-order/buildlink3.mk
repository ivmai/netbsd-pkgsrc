# $NetBSD: buildlink3.mk,v 1.5 2023/02/07 01:41:02 pho Exp $

BUILDLINK_TREE+=	hs-network-byte-order

.if !defined(HS_NETWORK_BYTE_ORDER_BUILDLINK3_MK)
HS_NETWORK_BYTE_ORDER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-network-byte-order+=	hs-network-byte-order>=0.1.6
BUILDLINK_ABI_DEPENDS.hs-network-byte-order+=	hs-network-byte-order>=0.1.6nb4
BUILDLINK_PKGSRCDIR.hs-network-byte-order?=	../../net/hs-network-byte-order
.endif	# HS_NETWORK_BYTE_ORDER_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-network-byte-order
