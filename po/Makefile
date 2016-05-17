DESTDIR =

PROG    = ldap-auth-utils
prefix  = /opt/ldap-auth-utils
datarootdir = ${prefix}/share
langdir = ${datarootdir}/locale

INSTALL = /bin/install -c
RM      = /bin/rm -f
SED     = /bin/sed
MKDIR   = /bin/mkdir -p
MSGFMT  = /bin/msgfmt

all:
	for i in `ls *.po | $(SED) 's/\.po//'` ; do \
		$(MSGFMT) $$i.po -o $$i.mo ; \
	done

install:
	for i in `ls *.po | $(SED) 's/\.po//'` ; do \
		$(MKDIR) $(DESTDIR)$(langdir)/$$i/LC_MESSAGES/ ; \
		$(INSTALL) -m644 $$i.mo $(DESTDIR)$(langdir)/$$i/LC_MESSAGES/$(PROG).mo ; \
	done

clean:
	-$(RM) *.mo
