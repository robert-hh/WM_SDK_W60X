#!/bin/bash

SOBJ=wm_w600
TARGET=wm_w600

SECBOOT=secboot.img

OJBPATH=../../Bin

_ENV_TARGET=""
_REVI_TARGET=""

MKIMG=../wm_tool
LOGGER=logger

OS=`uname -o`
if [ "${OS}" = "Msys" -o "${OS}" = "Cygwin" ]; then
{
	MKIMG=../wm_tool.exe
	LOGGER=echo
}
else
{
	gcc ../src/wm_tool.c -lpthread -Wall -O2 -o ../wm_tool
}
fi

SHELL_DO_CMD_FLAG=1

shell_do_cmd()
{
	local retval=0
	#echo "Execute -- $@"
	[ 1 = ${SHELL_DO_CMD_FLAG} ] && {
		$@
	} || {
		$@ 0>/dev/null 1>/dev/null 2>/dev/null
	}
	retval=$?
	[ 0 != $retval ] && {
		${LOGGER} "Execute $@"
		echo -e "Execute \033[31mFAILURE\033[0m: $@"
		exit $retval
	}
}

main()
{
	shell_do_cmd cp ${SOBJ}.map ${OJBPATH}
	shell_do_cmd cp ${SOBJ}.bin ${OJBPATH}
	
	${MKIMG} -b "${OJBPATH}/${SOBJ}.bin" -sb "${OJBPATH}/${SECBOOT}" -fc compress -it ${IMGTYPE} -ua ${UPDADDR} -ra ${RUNADDR} -df -o "${OJBPATH}/${TARGET}"
}

usage()
{
	echo -ne "\n$0 [-e ENV | -r RVERSION | -h]\n\n"
	echo -ne "\t-e ENV   Compiler Environment, default is NOT SETTED\n"
	echo -ne "\t-h       This help information\n"
	echo -ne "\t-r REVISION    SVN-Reversion number, default is NOT SETTED\n"
	echo -ne "\n"
}

while getopts ":e:hr:" opt
do
	case ${opt} in
		e)
			_ENV_TARGET="${OPTARG}-"
			;;
		h)
			usage
			exit 0
			;;
		r)
			_REVI_TARGET="-${OPTARG}"
			;;
	esac
done

TARGET=${_ENV_TARGET}${TARGET}${_REVI_TARGET}
main
