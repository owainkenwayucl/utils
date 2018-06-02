c     Sum up numbers from stdin and put answer in stdout
      program fpmean
      
      implicit none
      integer s
      real*8 c, n, total

      s = 0
      
      c = 0
      total = 0d0
      do while (s .eq. 0)
        read(*,*,IOSTAT=s) n
        if (s .eq. 0) then
          total = total + n
          c = c + 1d0
        else if (s .gt. 0) then
          write(*,*) 'Error: ', s
          stop 1
        else
          write(*,*) total/c
        end if
      end do

      end
