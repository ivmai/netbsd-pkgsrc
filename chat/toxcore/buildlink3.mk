# $NetBSD: buildlink3.mk,v 1.4 2023/05/06 19:08:48 ryoon Exp $

BUILDLINK_TREE+=	toxcore

.if !defined(TOXCORE_BUILDLINK3_MK)
TOXCORE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.toxcore+=	toxcore>=0.2.4
BUILDLINK_ABI_DEPENDS.toxcore+=	toxcore>=0.2.18nb1
BUILDLINK_PKGSRCDIR.toxcore?=	../../chat/toxcore

.include "../../audio/libopus/buildlink3.mk"
.include "../../multimedia/libvpx/buildlink3.mk"
.include "../../security/libsodium/buildlink3.mk"
.endif	# TOXCORE_BUILDLINK3_MK

BUILDLINK_TREE+=	-toxcore
