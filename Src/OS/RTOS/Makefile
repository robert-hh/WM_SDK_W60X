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

CFLAGS		+= -DTLS_OS_FREERTOS=1
#---------------------------------------------------------------------------
# Target definition (User)
#---------------------------------------------------------------------------
GOAL  = $(LIB_DIR)/wmrtos.$(LIBTYPE)

#---------------------------------------------------------------------------
# Source section (User)
#---------------------------------------------------------------------------
ASM_SRC				+= 

C_SRC				+= source/croutine.c
C_SRC				+= source/heap_2.c
C_SRC				+= source/heap_3.c
C_SRC				+= source/list.c
C_SRC				+= source/queue.c
C_SRC				+= source/rtostimers.c
C_SRC				+= source/tasks.c
C_SRC				+= wm_osal_rtos.c
ifeq ($(TOOL_GNU),1)
C_SRC				+= ports/port_m3_gcc.c
else
C_SRC				+= ports/port_m3.c
endif
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
	
