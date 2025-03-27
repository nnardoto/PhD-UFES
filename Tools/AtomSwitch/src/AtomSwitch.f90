module AtomSwitch
  implicit none
  private
    integer nAtoms
    real, allocatable :: R(:, :)

  public :: LoadSystem
contains
  subroutine LoadSystem
    integer io, i, iov
    real X(3, 3)

    integer     trash_int
    real        trash_real
    character   trash_char
    

    open(action = 'read', newunit = io, FILE = 'input.inp')
    open(action = 'read', newunit =iov, FILE = 'vertice.inp')

        read(iov, *) X(1, :)
        read(iov, *) X(2, :)
        read(iov, *) X(3, :)

        read(io, *) nAtoms
        allocate(R(nAtoms, 3))

        do i = 1, nAtoms
            read(io, *) trash_int, trash_char, R(i, :), trash_real, trash_real
        enddo
    close(io)

        do i = 1, nAtoms
            if (R(i, 1) >= X(1, 1) .and. R(i, 1) <= X(2, 1)) then
                if(R(i, 2) >= X(1, 2) .and. R(i, 2) <= X(3, 2)) then
                    write(*, *) i, R(i, :)
                endif
            endif
        enddo
  end subroutine LoadSystem
end module AtomSwitch
