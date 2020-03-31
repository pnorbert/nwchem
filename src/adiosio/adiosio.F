      module adiosio

      use adios2
      ! The one and only ADIOS2 object
      type(adios2_adios) :: adios2obj
      ! IO objects for each output/input stream
      type(adios2_io) :: adios2_io_trj
      ! Engine objects that need to be closed at the end of run
      type(adios2_engine) :: adios2_engine_trj

      contains
      subroutine adiosio_init()
        use adios2
        implicit none
!#include "global.fh"
#include "mpif.h"
        integer*4 :: ierr, wcomm

        !wcomm = MPI_COMM_WORLD
        call ga_mpi_comm(wcomm)
        call adios2_init(adios2obj, "adios2.xml", wcomm, 
     &                          .true._4, ierr)

      end subroutine adiosio_init


      subroutine adiosio_finalize()
        use adios2
        implicit none
!#include "global.fh"
#include "mpif.h"
        integer*4 :: ierr, rank, wcomm
        call ga_mpi_comm(wcomm)
        call MPI_Comm_Rank(wcomm, rank, ierr)
        if (adios2_engine_trj%valid) then
            !if (ga_nodeid() == 0) print *, 'ADIOS2: Close output "trj"'
            if (rank == 0) print *, 'ADIOS2: Close output "trj"'
            call adios2_close(adios2_engine_trj, ierr)
        endif
        if (adios2obj%valid) then
            call adios2_finalize(adios2obj,ierr)
        endif
      end subroutine adiosio_finalize

      end module adiosio
