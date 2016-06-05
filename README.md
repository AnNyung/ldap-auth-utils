ldap-auth-utils
====
[![GitHub license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://raw.githubusercontent.com/Joungkyun/ldap-auth-utils/master/LICENSE)

## License

Copyright (c) 2016 JoungKyun.Kim &lt;http://oops.org&gt;

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

  * ldap_auth_init     - initionalize ldap auth database
  * ldap_auth          - managed ldap user or group
  * ldap_useradd       - add ldap user
  * ldap_userdel       - remove ldap user
  * ldap_grpadd        - add ldap group
  * ldap_grpdel        - remove ldap group
  * ldap_host_manage   - managed host access privileges
  * ldap_passwd        - change password for general account
  * ldap_replica       - managed 2way multi master replication

If you can read korean, see also [OpenLDAP authentificate Integrate on AnNyung LInux 3 User Guides](https://joungkyun.gitbooks.io/annyung-3-user-guide/content/chapter2-3-auth-integrate-openldap.html).

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
[root@an3 ~]$ ldap_auth -h
ldap_auth: managed user or group attributes
Usage: ldap_auth [OPTIONS] {USER|GROUP}@DOMAIN.COM[ ENTRY MODIFIED_ENTRY_VALUE]
Options:
    -d               permit modify duplicated uidNumber/gidNumber
    -g               searching group
    -h               display this help message and exit
    -u               searching account [default option]
    -y               None intercative mode

[root@an3 ~]$
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
[root@an3 ~]$ ldap_useradd -h
ldap_useradd: Add user to LDAP database
Usage: ldap_useradd [OPTIONS] USERNAME
Options:
    -d HOME_DIR      home directory [Default: /home/ldapusers/USERNAME]
    -e EXPIRE_DATE   expiration date [Default: unlimit(0)]
                     Fromat is "YYYY-MM-DD HH:mm:SS" or unix timestamp
    -g GID           ID of the primary group [Default: ldapusers(10000)]
    -G GROUPS        list of supplementary groups
    -h               display this help message and exit
    -H FQDN          host access privileges
    -i               interactive mode. ignore other options
    -n NAME          Real Name
    -l LAST NAME     Last Name
    -p PASSWORD      password. plain string or hashed string(with {CRYPT})
    -s SHELL         login shell [Default: /bin/bash]
    -u UID           user ID [Default: MAXUID + 1]
    -y               None intercative mode
    --gecos          Set GECOS field of passwd entry

USERNAME format
    FROMAT : ACCOUNT@DOMAIN_NAME

    if base dn of LDAP is "dc=DOMAIN,dc=COM", domain name is "DOMAIN.COM".

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
[root@an3 ~]$ ldap_userdel -h
ldap_userdel: Remove user on LDAP database
Usage: ldap_userdel [OPTIONS] USERNAME ...
Options:
    -y               None intercative mode [default: interactive mode]

USERNAME format
    FROMAT : ACCOUNT@DOMAIN_NAME

    if base dn of LDAP is "dc=DOMAIN,dc=COM", domain name is "DOMAIN.COM".

[root@an3 ~]$ # remove LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_userdel LDAP_USER@DOMAIN.COM
```
  * ldap_grpadd
```bash
[root@an3 ~]$ ldap_grpadd -h
ldap_grpadd: Add group to LDAP database
Usage: ldap_grpadd [OPTIONS] GROUPNAME
Options:
    -g GID           group id [biggern than 10000
    -d DESC          group description
    -m MERBER_NAME   group member. enable multiple
    -h               display this help message and exit

GROUPNAME format
    FROMAT : ACCOUNT@DOMAIN_NAME

    if base dn of LDAP is "dc=DOMAIN,dc=COM", domain name is "DOMAIN.COM".

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
[root@an3 ~]$ ldap_grpdel -h
ldap_grpdel: Remove group on LDAP database
Usage: ldap_grpdel [OPTIONS] GROUPNAME
Options:
    -m MERBER_NAME   group member. enable multiple
    -h               display this help message and exit

GROUPRNAME format
    FROMAT : ACCOUNT@DOMAIN_NAME

    if base dn of LDAP is "dc=DOMAIN,dc=COM", domain name is "DOMAIN.COM".

[root@an3 ~]$ # remove LDAP_GROUP with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_grpdel LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$
[root@an3 ~]$ # remove member of LDAP_GROUP@DOMAIN.COM
[root@an3 ~]$ ldap_grpdel -m member1 -m member2 LDAP_GROUP
```
  * ldap_host_manage
```bash
[root@an3 ~]$ ldap_host_manage -h
ldap_host_manage: managed host access privileges
Usage: ldap_host_manage [OPTIONS] USERNAME HOST1
Options:
    -r               remove host
    -h               display this help message and exit

USERNAME format
    FROMAT : ACCOUNT@DOMAIN_NAME

    if base dn of LDAP is "dc=DOMAIN,dc=COM", domain name is "DOMAIN.COM".

[root@an3 ~]$ # add HOST to LDAP_USER BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_host_manage LDAP_USER@DOMAIN.COM HOST
[root@an3 ~]$
[root@an3 ~]$ # remove HOST to LDAP_USER BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ ldap_host_manage -r LDAP_USER@DOMAIN.COM HOST
```
  * ldap_passwd
```bash
[root@an3 ~]$ ldap_passwd -h
ldap_passwd: change ldap password
Usage: ldap_passwd [OPTIONS] USERNAME
Options:
    -g Group         group out [Default: Group]
    -h               display this help message and exit
    -m HASH_ALGO     md5 or sha512 [default: sha512]
    -u Pepole        Account OU default: People]

USERNAME format
    FROMAT : ACCOUNT@DOMAIN_NAME

    if base dn of LDAP is "dc=DOMAIN,dc=COM", domain name is "DOMAIN.COM".

[root@an3 ~]$ # change password of current login user
[root@an3 ~]$ ldap_passwd
[root@an3 ~]$
[root@an3 ~]$ # change password of current login user with md5 hash algorithm
[root@an3 ~]$ ldap_passwd -m md5
[root@an3 ~]$
[root@an3 ~]$ # change password of LDAP_USER with BASE DN 'dc=DOMAIN,dc=COM'
[root@an3 ~]$ # Only root can change other account!
[root@an3 ~]$ ldap_passwd LDAP_USER@DOMAIN.com
```
  * ldap_replica
```bash
[root@an3 ~]$ ldap_replica -h
ldap_replica: management ldap 2way multi master replication
Usage: ldap_replica [OPTIONS] REPLICA_SERVER
Options:
    -a               add replcation configuration on this server
    -i               Server ID on this server [default: RAMDOM]
    -r               remove replication configuration on this server
    -u USER_RDN      replication user dn

[root@an3 ~]$ # sync changes from ldap.tar.com
[root@an3 ~]$ ldap_replica -a -u uid=replica,ou=admin,dc=host,dc=com ldap.target.com
[root@an3 ~]$ # stop sync changes
[root@an3 ~]$ ldap_replica -r
```

--
vim: set filetype=README noet sw=4 ts=4 fdm=marker:

