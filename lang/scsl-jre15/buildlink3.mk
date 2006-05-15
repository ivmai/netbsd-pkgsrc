# $NetBSD: buildlink3.mk,v 1.2 2006/05/15 19:51:53 tv Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SCSL_JRE15_BUILDLINK3_MK:=	${SCSL_JRE15_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	scsl-jre15
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nscsl-jre15}
BUILDLINK_PACKAGES+=	scsl-jre15

.if !empty(SCSL_JRE15_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.scsl-jre15+=		scsl-jre15-[0-9]*
BUILDLINK_ABI_DEPENDS.scsl-jre15?=		scsl-jre15>=1.5.0
BUILDLINK_PKGSRCDIR.scsl-jre15?=		../../lang/scsl-jre15
BUILDLINK_JAVA_PREFIX.scsl-jre15=	${PREFIX}/java/scsl-1.5
.endif	# SCSL_JRE15_BUILDLINK3_MK

UNLIMIT_RESOURCES+=	datasize	# Must be at least 131204

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
