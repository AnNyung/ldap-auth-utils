ldap-auth-utils
====

## License

Copyright (c) 2016 JoungKyun.Kim <http://oops.org>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

## Compatibility
 * RHEL >= 6
 * CentOS >= 6
 * AnNyung LInux >= 2

## Description

ldap-auth-utils is authentification integration tool with ldap
on RHEL or CentOS or AnNyung distribution

This package is composed with follows:

   ldap_auth_init     - initionalize ldap auth database
   ldap_auth          - managed ldap user or group
   ldap_useradd       - add ldap user
   ldap_userdel       - remove ldap user
   ldap_grpadd        - add ldap group
   ldap_grpdel        - remove ldap group
   ldap_host_manage   - managed host access privileges
   ldap_passwd        - change password for general account
   ldap_replica       - managed 2way multi master replication

## Installation

  * dependency
    * openldap-clients (ldapadd, ldapdelete, ldapmodify, ldapsearch)
    * openldap-servers (slaptest, slappasswd)
    * [genpasswd](https://github.com/Joungkyun/genpasswd)

  * Configration: @sysconfdir@/ldap-auth-utils.conf

```bash
[root@an3 ~]$ tar xvfpj ldap-auth-utils-@VERSION@.tar.bz2
[root@an3 ~]$ cd ldap-auth-utils-@VERSION@
[root@an3 ~]$ ./configure --prefix=/usr --sysconfdir=/etc/openldap --datadir=/usr/share
[root@an3 ~]$ make && make install DESTDIR=
```
## Usage

  * ldap_auth_init
   ```bash
[root@an3 ~]$ ldap_auth_init
```
  * ldap_auth
   ```bash
[root@an3 ~]$ # View information LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_auth -u LDAP_USER@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # View information LDAP_GROUP with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_auth -g LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # modify shadowMax attribute on LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_auth -u LDAP_USER@DOMAIN.COM shadowMax 99999
[root@an3 ~]$
[root@an3 ~]$ # remove shadowMax attribute on LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_auth -u LDAP_USER@DOMAIN.COM shadowMax

```
  * ldap_useradd
   ```bash
[root@an3 ~]$ # add LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_useradd LDAP_USER@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # add LDAP_USER with option
[root@an3 ~]$ ldap_useradd -n "Michael" -l "Jackson" LDAP_USER@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # add LDAP_USER with interactive mode
[root@an3 ~]$ ldap_useradd -i LDAP_USER@DOMAIN.COM
```
  * ldap_userdel
   ```bash
# remove LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
ldap_userdel LDAP_USER@DOMAIN.COM
```
  * ldap_grpadd
   ```bash
[root@an3 ~]$ # add LDAP_GROUP with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_grpadd LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # add LDAP_GROUP with gid 10010
[root@an3 ~]$ ldap_grpadd -g 10010 LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # add member of LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$ ldap_grpadd -m member1 -m member2 LDAP_GROUP
```
  * ldap_grpdel
   ```bash
[root@an3 ~]$ # remove LDAP_GROUP with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_grpdel LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # remove member of LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$ ldap_grpdel -m member1 -m member2 LDAP_GROUP
```
  * ldap_host_manage
   ```bash
[root@an3 ~]$ # add HOST to LDAP_USER BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_host_manage LDAP_USER@DOMAIN.COM HOST
[root@an3 ~]$
[root@an3 ~]$ # remove HOST to LDAP_USER BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_host_manage -r LDAP_USER@DOMAIN.COM HOST
```
  * ldap_passwd
   ```bash
[root@an3 ~]$ # change password of current login user
[root@an3 ~]$ ldap_passwd
[root@an3 ~]$
[root@an3 ~]$ # change password of current login user with md5 hash algorithm
[root@an3 ~]$ ldap_passwd -m md5
[root@an3 ~]$
[root@an3 ~]$ # change password of LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ # Only root can change other account!
[root@an3 ~]$ ldap_passwd LADP_USER@DOMAIN.com
```
  * ldap_replica
   ```bash
[root@an3 ~]$ # sync changes from ldap.tar.com
[root@an3 ~]$ ldap_replica -a -u uid=replica,ou=admin,dc=host,dc=com ldap.target.com
[root@an3 ~]$ # stop sync changes
[root@an3 ~]$ ldap_replica -r
```

--
vim: set filetype=README noet sw=4 ts=4 fdm=marker:

