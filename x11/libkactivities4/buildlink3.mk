# $NetBSD: buildlink3.mk,v 1.31 2023/04/23 14:26:10 adam Exp $

BUILDLINK_TREE+=	libkactivities4

.if !defined(LIBKACTIVITIES4_BUILDLINK3_MK)
LIBKACTIVITIES4_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libkactivities4+=	libkactivities4>=4.7.95
BUILDLINK_ABI_DEPENDS.libkactivities4+=	libkactivities4>=4.13.3nb32
BUILDLINK_PKGSRCDIR.libkactivities4?=	../../x11/libkactivities4

.include "../../x11/kdelibs4/buildlink3.mk"
.endif # LIBKACTIVITIES4_BUILDLINK3_MK

BUILDLINK_TREE+=	-libkactivities4
