c     Sum up numbers from stdin and put answer in stdout
      program intsum
      
      use ISO_FORTRAN_ENV

      implicit none
      integer                       :: n, total, s, argl
      character(len=:), allocatable :: a

      s = 0
      argl = 0

      if (command_argument_count() > 0) then
        call get_command_argument(1, length = argl)
        allocate(character(argl) :: a)
        call get_command_argument(1, a)
        open(unit = 42, FILE = a, IOSTAT = s)
      end if
      
      total = 0
      do while (s .ge. 0)
        if (argl .gt. 0) then
          read(42, *, IOSTAT = s) n
        else
          read(*, *, IOSTAT = s) n
        end if
        if (s .eq. 0) then
          total = total + n
        else if (s .lt. 0) then
          write(*,*) total
        end if
      end do

      if (argl .gt. 0) then
        close(42, IOSTAT = s)
      end if

      end
