# $NetBSD: buildlink3.mk,v 1.27 2023/01/29 21:14:32 ryoon Exp $

BUILDLINK_TREE+=	libwnck3

.if !defined(LIBWNCK3_BUILDLINK3_MK)
LIBWNCK3_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libwnck3+=	libwnck3>=3.2.1
BUILDLINK_ABI_DEPENDS.libwnck3?=	libwnck3>=3.36.0nb4
BUILDLINK_PKGSRCDIR.libwnck3?=		../../devel/libwnck3

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../x11/libXres/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"
.endif # LIBWNCK3_BUILDLINK3_MK

BUILDLINK_TREE+=	-libwnck3
