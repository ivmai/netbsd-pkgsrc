# $NetBSD: buildlink3.mk,v 1.3 2023/01/29 21:14:37 ryoon Exp $

BUILDLINK_TREE+=	cairomm1.16

.if !defined(CAIROMM1.16_BUILDLINK3_MK)
CAIROMM1.16_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.cairomm1.16+=	cairomm1.16>=1.16.0
BUILDLINK_ABI_DEPENDS.cairomm1.16?=	cairomm1.16>=1.16.1nb2
BUILDLINK_PKGSRCDIR.cairomm1.16?=	../../graphics/cairomm1.16

.include "../../devel/libsigc++3/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.endif	# CAIROMM1.16_BUILDLINK3_MK

BUILDLINK_TREE+=	-cairomm1.16
