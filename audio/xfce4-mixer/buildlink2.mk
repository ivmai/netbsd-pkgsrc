# $NetBSD: buildlink2.mk,v 1.4 2003/12/13 00:45:21 wiz Exp $
#
# This Makefile fragment is included by packages that use xfce4-mixer.
#
# This file was created automatically using createbuildlink 2.7.
#

.if !defined(XFCE4_MIXER_BUILDLINK2_MK)
XFCE4_MIXER_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			xfce4-mixer
BUILDLINK_DEPENDS.xfce4-mixer?=		xfce4-mixer>=4.0.1nb2
BUILDLINK_PKGSRCDIR.xfce4-mixer?=		../../audio/xfce4-mixer

EVAL_PREFIX+=	BUILDLINK_PREFIX.xfce4-mixer=xfce4-mixer
BUILDLINK_PREFIX.xfce4-mixer_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.xfce4-mixer+=	lib/xfce4/panel-plugins/libmixer.*

.include "../../textproc/libxml2/buildlink2.mk"
.include "../../x11/xfce4-panel/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"

BUILDLINK_TARGETS+=	xfce4-mixer-buildlink

xfce4-mixer-buildlink: _BUILDLINK_USE

.endif	# XFCE4_MIXER_BUILDLINK2_MK
