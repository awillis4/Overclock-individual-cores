#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - cpufreq
# Started On        - Mon 18 Sep 15:26:55 BST 2017
# Last Change       - Sun  4 Mar 20:54:37 GMT 2018
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Lightweight Bourne Shell utility to output your CPU frequencies.
#----------------------------------------------------------------------------------

_VERSION_="2018-03-04"

USAGE(){ echo "USAGE: cpuinfo [--help|-h|-? | --debug | --ignore-os]" 1>&2; }
XERR(){ echo "ERROR: $1" 1>&2; exit 1; }
ERR(){ echo "ERROR: $1" 1>&2; }

IGNORE_OS="false"
DEBUGME="false"

case "$1" in
	--help|-h|-\?)
		USAGE; exit 0 ;;
	--version|-v)
		printf "%s\n" "$_VERSION_"
		exit 0 ;;
	--debug|-D)
		DEBUGME="true" ;;
	--ignore-os|-I)
		IGNORE_OS="true" ;;
	"")
		;;
	*)
		USAGE; exit 1 ;;
esac

DEPCOUNT=0
for DEP in /bin/uname /usr/bin/lsb_release /bin/grep /usr/bin/cut; do
	if ! [ -f "$DEP" ] || ! [ -x "$DEP" ]; then
		ERR "Dependency '$DEP' unmet."
		DEPCOUNT=$((DEPCOUNT+1))
	fi
done

[ $DEPCOUNT -eq 0 ] || exit 1

if ! [ "$IGNORE_OS" = "true" ]; then
	case ":$(/bin/uname -s)" in
		:Linux)
			;;
		*)
			XERR "Unsupported OS type."
	esac

	case ":$(/usr/bin/lsb_release -is)" in
		:openSUSE*|:Ubuntu|:Debian|:LinuxMint)
			;;
		*)
			XERR "Unsupported OS type."
	esac
fi

FILE="/proc/cpuinfo"
[ -f "$FILE" ] || XERR "File '$FILE' not found."

GET=`/bin/grep "^cpu MHz" "$FILE" | /usr/bin/cut -d ":" -f 2`
TTLCORES=`/bin/grep -m 1 "^cpu cores" "$FILE" | /usr/bin/cut -d ":" -f 2`

NUM=0
for CORE in $GET; do
	echo "CORE_${NUM}: $CORE"
	NUM=$((NUM+1))
done