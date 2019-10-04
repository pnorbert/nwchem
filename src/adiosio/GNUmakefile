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

include ../config/makefile.h

ifeq ($(USE_ADIOS2),y)
  LIB_INCLUDES += $(ADIOS2_INCLUDES)
endif

ifneq ($(MPI_INCLUDE),)
   LIB_INCLUDES += $(patsubst -I-I%,-I%,-I$(MPI_INCLUDE))
endif

include ../config/makelib.h

adiosio.mod: adiosio.o

