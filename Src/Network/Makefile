#/**************************************************************************
# * Kevin 2014-02-24                                                       *
# **************************************************************************/

#---------------------------------------------------------------------------
# Constant Variable definition
#---------------------------------------------------------------------------

ifeq ($(COMPILER_OS_CYGWIN),1)
TOPDIR=../..
endif

include $(TOPDIR)/Tools/toolchain.def

#---------------------------------------------------------------------------
# Target definition (User)
#---------------------------------------------------------------------------
GOAL  = $(LIB_DIR)/wmlwip.$(LIBTYPE)

#---------------------------------------------------------------------------
# Source section (User)
#---------------------------------------------------------------------------
ASM_SRC			+= 

C_SRC				:= api2.0.3/tls_sockets.c \
				 api2.0.3/tls_netconn.c \
				 lwip2.0.3/core/dns.c \
				 lwip2.0.3/core/def.c \
				 lwip2.0.3/core/init.c \
				 lwip2.0.3/core/mem.c \
				 lwip2.0.3/core/memp.c \
				 lwip2.0.3/core/netif.c \
				 lwip2.0.3/core/pbuf.c \
				 lwip2.0.3/core/raw.c \
				 lwip2.0.3/core/stats.c \
				 lwip2.0.3/core/sys.c \
				 lwip2.0.3/core/tcp.c \
				 lwip2.0.3/core/tcp_in.c \
				 lwip2.0.3/core/tcp_out.c \
				 lwip2.0.3/core/udp.c \
				 lwip2.0.3/core/inet_chksum.c \
				 lwip2.0.3/core/ip.c \
				 lwip2.0.3/core/timeouts.c \
				 lwip2.0.3/core/alg.c \
				 lwip2.0.3/core/ipv4/ip4_frag.c \
				 lwip2.0.3/core/ipv4/ip4_addr.c \
				 lwip2.0.3/core/ipv4/ip4.c \
				 lwip2.0.3/core/ipv4/dhcp.c \
				 lwip2.0.3/core/ipv4/etharp.c \
				 lwip2.0.3/core/ipv4/igmp.c \
				 lwip2.0.3/core/ipv4/icmp.c \
				 lwip2.0.3/core/ipv4/autoip.c \
				 lwip2.0.3/core/ipv6/ip6_frag.c \
				 lwip2.0.3/core/ipv6/ip6_addr.c \
				 lwip2.0.3/core/ipv6/ip6.c \
				 lwip2.0.3/core/ipv6/dhcp6.c \
				 lwip2.0.3/core/ipv6/ethip6.c \
				 lwip2.0.3/core/ipv6/icmp6.c \
				 lwip2.0.3/core/ipv6/inet6.c \
				 lwip2.0.3/core/ipv6/mld6.c \
				 lwip2.0.3/core/ipv6/nd6.c \
				 lwip2.0.3/sys_arch.c \
				 lwip2.0.3/netif/ethernetif.c \
				 lwip2.0.3/netif/ethernet.c \
				 lwip2.0.3/netif/wm_ethernet.c \
				 lwip2.0.3/api/tcpip.c \
				 lwip2.0.3/api/api_lib.c \
				 lwip2.0.3/api/api_msg.c \
				 lwip2.0.3/api/err.c \
				 lwip2.0.3/api/netbuf.c \
				 lwip2.0.3/api/netdb.c \
				 lwip2.0.3/api/netifapi.c \
				 lwip2.0.3/api/sockets.c
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
