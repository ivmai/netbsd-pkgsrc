# $NetBSD: buildlink3.mk,v 1.1 2004/05/08 05:25:12 snj Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_PSYCOPG_BUILDLINK3_MK:=	${PY_PSYCOPG_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	psycopg
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npsycopg}
BUILDLINK_PACKAGES+=	psycopg

.if !empty(PY_PSYCOPG_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.psycopg+=	${PYPKGPREFIX}-psycopg>=1.0.14nb1
BUILDLINK_RECOMMENDED.psycopg?=	${PYPKGPREFIX}-psycopg>=1.0.14nb2
BUILDLINK_PKGSRCDIR.psycopg?=	../../databases/py-psycopg
.endif	# PY_PSYCOPG_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
