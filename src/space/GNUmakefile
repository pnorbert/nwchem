#
# $Id$
#
#
OBJ=sp_init.o sp_main.o

LIBRARY=libspace.a

HEADER=

USES_BLAS=

include ../config/makefile.h

ifeq ($(USE_ADIOS2),y)
    LIB_INCLUDES += $(ADIOS2_INCLUDES)
endif


include ../config/makelib.h
