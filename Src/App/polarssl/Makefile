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
GOAL  = $(LIB_DIR)/wmpolarssl.$(LIBTYPE)

#---------------------------------------------------------------------------
# Source section (User)
#---------------------------------------------------------------------------
ASM_SRC			+=
C_SRC				+= library/asn1parse.c
C_SRC				+= library/base64.c
C_SRC				+= library/cipher.c
C_SRC				+= library/cipher_wrap.c
C_SRC				+= library/error.c
C_SRC				+= library/md.c
C_SRC				+= library/md_wrap.c
C_SRC				+= library/pem.c
C_SRC				+= library/rsa.c
C_SRC				+= library/ssl_cli.c
C_SRC				+= library/ssl_tls.c
C_SRC				+= library/x509parse.c
C_SRC				+= library/polarssl_bignum.c
C_SRC				+= library/polarssl_debug.c
C_SRC				+= library/polarssl_md5.c
C_SRC				+= library/polarssl_sha1.c
C_SRC				+= library/arc4.c
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
	
