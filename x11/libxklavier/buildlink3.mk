# $NetBSD: buildlink3.mk,v 1.26 2023/04/19 08:08:55 adam Exp $

BUILDLINK_TREE+=	libxklavier

.if !defined(LIBXKLAVIER_BUILDLINK3_MK)
LIBXKLAVIER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libxklavier+=	libxklavier>=3.0
BUILDLINK_ABI_DEPENDS.libxklavier+=	libxklavier>=5.4nb11
BUILDLINK_PKGSRCDIR.libxklavier?=	../../x11/libxklavier

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/libxkbfile/buildlink3.mk"
.endif # LIBXKLAVIER_BUILDLINK3_MK

BUILDLINK_TREE+=	-libxklavier
