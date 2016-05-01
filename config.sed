# config.sed - parse config file
# Copyright (C) 2016  JoungKyun.Kim <http://oops.org>
#
# This file is part of oops-firewall
# http://svn.oops.org/wsvn/OOPS.oops-firewall/trunk/src/include/config.sed
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# removed comment
s/\([[:space:]]\+\)\?#.*//g

:sumline
# Case that the last character of ther line is '/'
/\\[ \t]*$/ {
	# input next line to patern space.
	N

	# removed next line comment
	s/\([[:space:]]\+\)\?#.*//g

	# remove '/' character and newline
	s/[ \t]*\\[ \t]*[\r\n]\+[ \t]*/ /g

	# repeat Until '/' character don't exists.
	t sumline
}

# replace resolved characters on option value
:equalchk
/^[^=]\+=[^=]\+=/ {
	s/^\([^=]\+=[^=]\+\)=/\1@equalmark@/g
	t equalchk
}
s/"/@quotemark@/g

# remove line of direction format
/^[^=]\+$/d

# remove blank line
/^$/d

# remove first white space each lines.
s/^[ \t]\+//g

# remove white space before or after equal mark
s/[ \t]*=[ \t]*/="/g

# remove last blanks
s/[[:space:]]\+$//g

# close quote of variable's value
s/$/";/g

# revokin marking
s/@equalmark@/=/g
s/@quotemark@/\\"/g

# print
p
