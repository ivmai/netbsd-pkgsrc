# $NetBSD: buildlink3.mk,v 1.27 2023/01/29 21:14:58 ryoon Exp $

BUILDLINK_TREE+=	deforaos-browser

.if !defined(DEFORAOS_BROWSER_BUILDLINK3_MK)
DEFORAOS_BROWSER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.deforaos-browser+=	deforaos-browser>=0.5.0
BUILDLINK_ABI_DEPENDS.deforaos-browser?=	deforaos-browser>=0.5.5nb4
BUILDLINK_PKGSRCDIR.deforaos-browser?=		../../sysutils/deforaos-browser

.include "../../x11/deforaos-libdesktop/buildlink3.mk"
.endif	# DEFORAOS_BROWSER_BUILDLINK3_MK

BUILDLINK_TREE+=	-deforaos-browser
