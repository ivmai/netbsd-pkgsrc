# $NetBSD: buildlink3.mk,v 1.28 2023/05/22 21:00:11 wiz Exp $

BUILDLINK_TREE+=	kwindowsystem

.if !defined(KWINDOWSYSTEM_BUILDLINK3_MK)
KWINDOWSYSTEM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kwindowsystem+=	kwindowsystem>=5.18.0
BUILDLINK_ABI_DEPENDS.kwindowsystem?=	kwindowsystem>=5.98.0nb6
BUILDLINK_PKGSRCDIR.kwindowsystem?=	../../x11/kwindowsystem


.include "../../mk/bsd.fast.prefs.mk"

.include "../../x11/qt5-qtbase/buildlink3.mk"
.if ${OPSYS} == "Darwin"
.  include "../../x11/qt5-qtmacextras/buildlink3.mk"
.else
.  include "../../x11/qt5-qtx11extras/buildlink3.mk"
.endif
.endif	# KWINDOWSYSTEM_BUILDLINK3_MK

BUILDLINK_TREE+=	-kwindowsystem
