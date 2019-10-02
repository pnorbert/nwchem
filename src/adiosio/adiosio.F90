      module adiosio

#ifdef ADIOS2
      use adios2
#endif

      implicit none
      integer :: adiosio_dummy_variable

#ifdef ADIOS2
      ! The one and only ADIOS2 object
      type(adios2_adios) :: adios2obj
      ! Engine objects that need to be closed at the end of run
      type(adios2_engine) :: adios2_engine_trajectory
#endif

#ifdef ADIOS2
      contains
      subroutine adiosio_init()
        implicit none
        integer :: ierr
        call adios2_init_config(adios2obj, "adios2cfg.xml", sml_comm, .true., ierr)

      end subroutine adiosio_init


      subroutine adiosio_finalize()
        implicit none
        integer :: ierr
        if (adios2_engine_trajectory%valid) then
             if (sml_mype == 0) print *, 'ADIOS2: Close output "trajectory"'
            call adios2_close(adios2_engine_trajectory, ierr)
        endif
        call adios2_finalize(adios2obj,ierr)
      end subroutine adiosio_finalize
#endif

      end module adiosio

