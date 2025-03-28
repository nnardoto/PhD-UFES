module AtomSwitch
  implicit none
  private
    integer nAtoms
    real(8), allocatable :: R(:, :)
    real(8) X(3, 3)
    real(8), parameter :: delta = 1E-3

!    interface 
!        function real f1(xx) 
!    end interface


  public :: LoadSystem

contains
  subroutine LoadSystem
    integer io, i, iov

    integer     trash_int
    real        trash_real
    character   trash_char
    
    open(action = 'read', newunit =iov, FILE = 'vertice.inp')
        read(iov, *) X(1, :)
        read(iov, *) X(2, :)
        read(iov, *) X(3, :)
    close(iov)


    open(action = 'read', newunit = io, FILE = 'input.inp')
        read(io, *) nAtoms
        allocate(R(nAtoms, 3))

        do i = 1, nAtoms
            read(io, *) trash_int, trash_char, R(i, :), trash_real, trash_real
        enddo
    close(io)

        do i = 1, nAtoms
!            if (R(i, 1) >= X(1, 1) .and. R(i, 1) <= X(2, 1)) then
!                if(R(i, 2) >= X(1, 2) .and. R(i, 2) <= X(3, 2)) then
                if(R(i, 2) >= X(1, 2) .and. R(i, 2) <= f1(R(i, 1)) .and. R(i, 2) <= f2(R(i, 1) )) then
                    write(*, *) i, R(i, :)
                endif
!            endif
        enddo
  end subroutine LoadSystem

  real(8) function f1(xx)
    real(8) :: m, b
    real(8), intent(IN)  :: xx

    m = (X(3, 2) - X(1, 2)) / (X(3, 1) - X(1, 1))
    b = X(1, 2) - m*X(1, 1)
    
    f1 = m*xx + b + delta
    return
  end function

  real(8) function f2(xx)
    real(8) :: m, b
    real(8), intent(IN)  :: xx
  
    m = (X(3, 2) - X(2, 2)) / (X(3, 1) - X(2, 1))
    b = X(2, 2) - m*X(2, 1)
    
    f2 = m*xx + b + delta
    return
  end function
  
end module AtomSwitch
