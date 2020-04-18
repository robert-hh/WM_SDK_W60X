#configure the serial port number to be operated, ex:
#SERIAL_NAME=COM3
#SERIAL_NAME=ttyUSB3
#SERIAL_NAME=tty.usbserial3
#you can use "../wm_tool -l" to view the locally available serial port number.
SERIAL_NAME=

TARGET=wm_w600
_ENV_TARGET=""
_REVI_TARGET=""

DLIMG=wm_tool
LOGGER=logger

OS=`uname -o`
[ "${OS}" = "Msys" -o "${OS}" = "Cygwin" ] && {
	DLIMG=wm_tool.exe
	LOGGER=echo
}

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
    if [ "$SERIAL_NAME" = "" ]; then
    {
        echo -e "\033[31munable to download because no serial port is configured.\033[0m"
        echo -e "please open the \033[35mdownload_img.sh\033[0m file (e.g: \033[32mvim ./download_img.sh\033[0m),"
        echo -e "and configure \033[36mSERIAL_NAME\033[0m to the serial port number you are using."
        exit $retval
    }
    fi

    shell_do_cmd cd ../../Tools

    ./${DLIMG} -c ${SERIAL_NAME} -ds 2M -dl "../Bin/${TARGET}_gz.img" -ws 115200 -rs at
#    ./${DLIMG} -c ${SERIAL_NAME} -ds 2M -dl "../Bin/${TARGET}_gz.img" -ws 115200 -rs at -sl str
#    ./${DLIMG} -c ${SERIAL_NAME} -ds 2M -dl "../Bin/${TARGET}.fls" -eo secboot -ws 115200 -rs at
#    ./${DLIMG} -c ${SERIAL_NAME} -ds 2M -dl "../Bin/${TARGET}.fls" -eo secboot -ws 115200 -rs at -sl str
#    ./${DLIMG} -c ${SERIAL_NAME} -ds 2M -dl "../Bin/${TARGET}_gz.img" -rs rts
#    ./${DLIMG} -c ${SERIAL_NAME} -ds 2M -dl "../Bin/${TARGET}.fls" -eo secboot -rs rts
#    ./${DLIMG} -c ${SERIAL_NAME} -ds 2M -dl "../Bin/${TARGET}.fls" -eo secboot -rs rts -sl str -ws 115200
}

main
