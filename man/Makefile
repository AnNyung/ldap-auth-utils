INSTALL         = /usr/bin/install -c
MKDIR           = /bin/mkdir -p

prefix          = /opt/ldap-auth-utils
datarootdir     = ${prefix}/share
exec_prefix     = ${prefix}
datadir         = ${datarootdir}
mandir          = ${datarootdir}/man

install:
	$(MKDIR) $(DESTDIR)$(mandir)/{man1,man5}

	for i in `ls *.1` ; do \
		$(INSTALL) -m 755 $$i $(DESTDIR)$(mandir)/man1/ ; \
	done

	for i in `ls *.5` ; do \
		$(INSTALL) -m 755 $$i $(DESTDIR)$(mandir)/man5/ ; \
	done
