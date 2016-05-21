# Process this file with autoconf to produce a configure script.
# Configure template for ldap-auth-utils

AC_PREREQ(2.53)

AC_INIT([ldap-auth-utils], [1.0.0], [http://oops.org])
AC_CONFIG_SRCDIR([README.md])
#AC_CONFIG_HEADERS(config.h)
AC_PREFIX_DEFAULT([/opt/ldap-auth-utils])

AC_ARG_WITH(perl,
[  --with-perl=PATH        perl path (system default)])

AC_ARG_WITH(ldap-bindir,
[  --with-ldap-bindir=PATH path of openldap binary files])

AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_AWK
AC_PROG_GREP
AC_PROG_EGREP
AC_PROG_MKDIR_P
AC_PROG_SED

AC_PATH_PROG(RM, rm)
if test ! -f "$ac_cv_path_RM"; then
	AC_MSG_ERROR(Can not found rm)
fi

AC_PATH_PROG(MV, mv)
if test ! -f "$ac_cv_path_MV"; then
	AC_MSG_ERROR(Can not found mv)
fi

AC_PATH_PROG(CP, cp)
if test ! -f "$ac_cv_path_CP"; then
	AC_MSG_ERROR(Can not found cp)
fi

AC_PATH_PROG(CAT, cat)
if test ! -f "$ac_cv_path_CAT"; then
	AC_MSG_ERROR(Can not found cat)
fi

AC_PATH_PROG(DATE, date)
if test ! -f "$ac_cv_path_DATE"; then
	AC_MSG_ERROR(Can not found date)
fi

AC_PATH_PROG(CHOWN, chown)
if test ! -f "$ac_cv_path_CHOWN"; then
	AC_MSG_ERROR(Can not found chown)
fi

AC_PATH_PROG(CHMOD, chmod)
if test ! -f "$ac_cv_path_CHMOD"; then
	AC_MSG_ERROR(Can not found chmod)
fi

AC_PATH_PROG(GETOPT, getopt)
if test ! -f "$ac_cv_path_GETOPT"; then
	AC_MSG_ERROR(Can not found getopt)
fi

AC_PATH_PROG(BASENAME, basename)
if test ! -f "$ac_cv_path_BASENAME"; then
	AC_MSG_ERROR(Can not found basename)
fi

AC_PATH_PROG(MAKE, make)
if test ! -f "$ac_cv_path_MAKE"; then
	AC_MSG_ERROR(Can not found make)
fi

if test "x$with_perl" != "x"; then
	if test -f $with_perl ; then
		AC_MSG_CHECKING(for perl)
		AC_MSG_RESULT([$with_perl])
		perlpath=$with_perl
	else
		AC_PATH_PROG(PERL, perl)
		if test "x$ac_cv_path_PERL " != "x"; then
			perlpath=$ac_cv_path_PERL
		else
			AC_MSG_ERROR(Can not found perl)
		fi
	fi
else
	AC_PATH_PROG(PERL, perl)
	if test "x$ac_cv_path_PERL " != "x"; then
		perlpath=$ac_cv_path_PERL
	else
		AC_MSG_ERROR(Can not found perl)
	fi
fi

AC_PATH_PROG(MSGFMT, msgfmt)
AC_ARG_WITH(msgfmt,
			[  --with-msgfmt=PATH      path of msgfmt program])
if test "x$with_msgfmt" != "x"; then
	if test -f $with_msgfmt; then
		ac_cv_path_MSGFMT=$with_msgfmt
	fi
else
	if test "x$ac_cv_path_MSGFMT" != "x"; then
		if test -f $ac_cv_path_MSGFMT ; then
			ac_cv_path_MSGFMT=$with_msgfmt
		else
			AC_MSG_ERROR([Can not found msgfmt])
		fi
	else
		AC_MSG_ERROR([Can not found msgfmt])
	fi
fi

ldappath=""
if test "x$with_ldap_bindir" != "x"; then
	if test -d $with_ldap_bindir; then
		ldappath="$with_ldap_bindir:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
	else
		ldappath="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
	fi
else
	ldappath="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
fi

AC_PATH_PROG(LDAPADD, ldapadd,,$ldappath)
if test ! -f "$ac_cv_path_LDAPADD"; then
	AC_MSG_ERROR(Can not found ldapadd)
fi

AC_PATH_PROG(LDAPMODIFY, ldapmodify,,$ldappath)
if test ! -f "$ac_cv_path_LDAPMODIFY"; then
	AC_MSG_ERROR(Can not found ldapmodify)
fi

AC_PATH_PROG(LDAPDELETE, ldapdelete,,$ldappath)
if test ! -f "$ac_cv_path_LDAPDELETE"; then
	AC_MSG_ERROR(Can not found ldapdelete)
fi

AC_PATH_PROG(LDAPSEARCH, ldapsearch,,$ldappath)
if test ! -f "$ac_cv_path_LDAPSEARCH"; then
	AC_MSG_ERROR(Can not found ldapsearch)
fi

AC_PATH_PROG(SLAPTEST, slaptest,,$ldappath)
if test ! -f "$ac_cv_path_SLAPTEST"; then
	AC_MSG_ERROR(Can not found slaptest)
fi

AC_PATH_PROG(SLAPPASSWD, slappasswd,,$ldappath)
if test ! -f "$ac_cv_path_SLAPPASSWD"; then
	AC_MSG_ERROR(Can not found slappasswd)
fi

AC_PATH_PROG(GENPASSWD, genpasswd,,"/usr/bin:/bin:/usr/local/bin:/usr/sbin:/sbin:/opt/bin:/opt/sbin")
if test ! -f "$ac_cv_path_GENPASSWD"; then
	AC_MSG_ERROR(Can not found genpasswd)
fi

AC_PATH_PROG(OPENSSL, openssl,,"/usr/bin:/bin:/usr/local/bin:/usr/sbin:/sbin:/opt/bin:/opt/sbin")
if test ! -f "$ac_cv_path_OPENSSL"; then
	AC_MSG_ERROR(Can not found openssl)
fi

AC_SUBST(langdir)
langdir="${datadir}/locale"

AC_CONFIG_FILES([Makefile functions ldap_passwd man/Makefile po/Makefile])
AC_OUTPUT
