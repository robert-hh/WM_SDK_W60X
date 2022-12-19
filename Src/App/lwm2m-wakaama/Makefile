#/**************************************************************************
# * Kevin 2014-02-24                                                       *
# **************************************************************************/

#---------------------------------------------------------------------------
# Constant Variable definition
#---------------------------------------------------------------------------

ifeq ($(COMPILER_OS_CYGWIN),1)
TOPDIR=../../..
endif

include $(TOPDIR)/Tools/toolchain.def

#---------------------------------------------------------------------------
# Target definition (User)
#---------------------------------------------------------------------------
GOAL  = $(LIB_DIR)/lwm2m-wakaama.$(LIBTYPE)

#---------------------------------------------------------------------------
# Source section (User)
#---------------------------------------------------------------------------
ASM_SRC			+=
C_SRC			+=core/block1.c
C_SRC			+=core/bootstrap.c
C_SRC			+=core/data.c
C_SRC			+=core/discover.c
C_SRC			+=core/json.c
C_SRC			+=core/json_common.c
C_SRC			+=core/liblwm2m.c
C_SRC			+=core/list.c
C_SRC			+=core/management.c
C_SRC			+=core/objects.c
C_SRC			+=core/observe.c
C_SRC			+=core/packet.c
C_SRC			+=core/registration.c
C_SRC			+=core/senml_json.c
C_SRC			+=core/tlv.c
C_SRC			+=core/transaction.c
C_SRC			+=core/uri.c
C_SRC			+=core/utils.c
C_SRC			+=examples/lightclient/lightclient.c
C_SRC			+=examples/shared/commandline.c
C_SRC			+=examples/shared/connection.c
C_SRC			+=examples/shared/memtrace.c
C_SRC			+=examples/shared/platform.c
C_SRC			+=examples/lightclient/object_device.c
C_SRC			+=examples/lightclient/object_security.c
C_SRC			+=examples/lightclient/object_server.c
C_SRC			+=examples/lightclient/test_object.c
C_SRC			+=core/er-coap-13/er-coap-13.c

#---------------------------------------------------------------------------
# Implicit rules
#---------------------------------------------------------------------------
.c.o:
	$(CC) $(CFLAGS) -c -o $*.o $< $(INCLUDES)

.s.o:
	$(ASM) $(ASMFLAGS) -c -o $*.o $< $(INCLUDES)

#---------------------------------------------------------------------------
# Explicit ruls
#---------------------------------------------------------------------------
OBJ_FILES	= $(C_SRC:%.c=%.o) $(ASM_SRC:%.s=%.o)

all: $(GOAL)

$(GOAL): $(OBJ_FILES)
	$(AR) $(ARFLAGS) $@ $(OBJ_FILES)

.PHONY: clean
clean:
	$(RM) -f $(GOAL)
	$(RM) -f $(OBJ_FILES:.o=.d) $(OBJ_FILES)
	
