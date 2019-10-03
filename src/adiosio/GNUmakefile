#
# $Id$
#
#
OBJ=adiosio.o 

LIBRARY=libadiosio.a

HEADERS=adiosio.mod

USES_BLAS=

LIB_DEFINES = 
LIB_INCLUDES = 

#adiosio.o: adiosio.F90

ifeq ($(USE_ADIOS2),y)
  LIB_INCLUDES += $(ADIOS2_INCLUDES)
endif

include ../config/makefile.h
include ../config/makelib.h


