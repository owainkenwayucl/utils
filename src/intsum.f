c     Sum up numbers from stdin and put answer in stdout
      program intsum
      
      implicit none
      integer n, total, s

      s = 0
      

      total = 0
      do while (s .eq. 0)
        read(*,*,IOSTAT=s) n
        if (s .eq. 0) then
          total = total + n
        else if (s .gt. 0) then
          write(*,*) 'Error: ', s
          stop 1
        else
          write(*,*) total
        end if
      end do

      end
