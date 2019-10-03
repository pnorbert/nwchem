      module adiosio

#ifdef ADIOS2
      use adios2
      ! The one and only ADIOS2 object
      type(adios2_adios) :: adios2obj
      ! Engine objects that need to be closed at the end of run
      type(adios2_engine) :: adios2_engine_trajectory
#endif
      integer adiosio_dummy_variable

#ifdef ADIOS2
      contains
      subroutine adiosio_init()
        use adios2
        implicit none
#include "global.fh"
        integer*4 :: ierr, wcomm

        wcomm = ga_pgroup_get_world()
        call adios2_init_config(adios2obj, "adios2.xml", wcomm, 
     &                          .true._4, ierr)

      end subroutine adiosio_init


      subroutine adiosio_finalize()
        use adios2
        implicit none
#include "global.fh"
        integer*4 :: ierr
        if (adios2_engine_trajectory%valid) then
            if (ga_nodeid() == 0) print *, 'ADIOS2: Close output "trj"'
            call adios2_close(adios2_engine_trajectory, ierr)
        endif
        if (adios2obj%valid) then
            call adios2_finalize(adios2obj,ierr)
        endif
      end subroutine adiosio_finalize
#endif

      end module adiosio
