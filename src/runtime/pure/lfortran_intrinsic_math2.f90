! Temporary module, a subset of lfortran_intrinsic_math that works
module lfortran_intrinsic_math2
use, intrinsic :: iso_fortran_env, only: i8 => int8, i16 => int16, i32 => int32, i64 => int64, sp => real32, dp => real64
implicit none

interface sqrt
    module procedure ssqrt, dsqrt
end interface

interface aimag
    module procedure saimag, daimag
end interface

interface modulo
    module procedure imodulo, smodulo, dmodulo
end interface

interface min
    module procedure imin, imin8, imin16, imin64, smin, dmin, dmin1, imin_6args
end interface

interface max
    module procedure imax, imax8, imax16, imax64, smax, dmax, dmax1, imax_3_args, imax_6args, dmax_3args
end interface

interface max0
    module procedure imax, imax8, imax16, imax64, imax_3_args, imax_6args
end interface

interface min0
    module procedure imin, imin8, imin16, imin64, imin_3_args, imin_6args
end interface

contains

! sqrt -------------------------------------------------------------------------

elemental real(sp) function ssqrt(x) result(r)
real(sp), intent(in) :: x
if (x >= 0) then
    r = x**(1._sp/2)
else
    error stop "sqrt(x) for x < 0 is not allowed"
end if
end function

elemental real(dp) function dsqrt(x) result(r)
real(dp), intent(in) :: x
if (x >= 0) then
    r = x**(1._dp/2)
else
    error stop "sqrt(x) for x < 0 is not allowed"
end if
end function

! aimag ------------------------------------------------------------------------

elemental real(sp) function saimag(x) result(r)
complex(sp), intent(in) :: x
r = 3
! Uncomment once it is implemented
!r = x%im
!error stop "aimag not implemented yet"
end function

elemental real(dp) function daimag(x) result(r)
complex(dp), intent(in) :: x
r = 3
! Uncomment once it is implemented
!r = x%im
!error stop "aimag not implemented yet"
end function

! modulo -----------------------------------------------------------------------

elemental integer function imodulo(x, y) result(r)
integer, intent(in) :: x, y
r = x-floor(real(x)/y)*y
end function

elemental real(sp) function smodulo(x, y) result(r)
real(sp), intent(in) :: x, y
r = x-floor(x/y)*y
end function

elemental real(dp) function dmodulo(x, y) result(r)
real(dp), intent(in) :: x, y
r = x-floor(x/y)*y
end function

! min --------------------------------------------------------------------------

elemental integer function imin(x, y) result(r)
integer, intent(in) :: x, y
if (x < y) then
    r = x
else
    r = y
end if
end function

elemental integer(i8) function imin8(x, y) result(r)
integer(i8), intent(in) :: x, y
if (x < y) then
    r = x
else
    r = y
end if
end function

elemental integer(i16) function imin16(x, y) result(r)
integer(i16), intent(in) :: x, y
if (x < y) then
    r = x
else
    r = y
end if
end function

elemental integer(i64) function imin64(x, y) result(r)
integer(i64), intent(in) :: x, y
if (x < y) then
    r = x
else
    r = y
end if
end function

elemental real(sp) function smin(x, y) result(r)
real(sp), intent(in) :: x, y
if (x < y) then
    r = x
else
    r = y
end if
end function

elemental real(dp) function dmin(x, y) result(r)
real(dp), intent(in) :: x, y
if (x < y) then
    r = x
else
    r = y
end if
end function

elemental real(dp) function dmin1(x, y) result(r)
real(dp), intent(in) :: x, y
if (x < y) then
    r = x
else
    r = y
end if
end function

elemental integer function imin_3_args(x, y, z) result(r)
integer, intent(in) :: x, y, z
r = imin(imin(x, y), z)
end function

elemental integer function imin_6args(a, b, c, d, e, f) result(r)
integer, intent(in) :: a, b, c, d, e, f
integer :: args(6)
integer :: itr, curr_value
args(1) = a
args(2) = b
args(3) = c
args(4) = d
args(5) = e
args(6) = f
r = a
do itr = 1, 6
    curr_value = args(itr)
    r = min(curr_value, r)
end do
end function

! max --------------------------------------------------------------------------

elemental integer function imax(x, y) result(r)
integer, intent(in) :: x, y
if (x > y) then
    r = x
else
    r = y
end if
end function

elemental integer(i8) function imax8(x, y) result(r)
integer(i8), intent(in) :: x, y
if (x > y) then
    r = x
else
    r = y
end if
end function

elemental integer(i16) function imax16(x, y) result(r)
integer(i16), intent(in) :: x, y
if (x > y) then
    r = x
else
    r = y
end if
end function

elemental integer(i64) function imax64(x, y) result(r)
integer(i64), intent(in) :: x, y
if (x > y) then
    r = x
else
    r = y
end if
end function

elemental integer function imax_3_args(x, y, z) result(r)
integer, intent(in) :: x, y, z
r = imax(imax(x, y), z)
end function

elemental integer function imax_6args(a, b, c, d, e, f) result(r)
integer, intent(in) :: a, b, c, d, e, f
integer :: args(6)
integer :: itr, curr_value
args(1) = a
args(2) = b
args(3) = c
args(4) = d
args(5) = e
args(6) = f
r = a
do itr = 1, 6
    curr_value = args(itr)
    r = imax(curr_value, r)
end do
end function

elemental real(sp) function smax(x, y) result(r)
real(sp), intent(in) :: x, y
if (x > y) then
    r = x
else
    r = y
end if
end function

elemental real(dp) function dmax(x, y) result(r)
real(dp), intent(in) :: x, y
if (x > y) then
    r = x
else
    r = y
end if
end function

elemental real(dp) function dmax1(x, y) result(r)
real(dp), intent(in) :: x, y
if (x > y) then
    r = x
else
    r = y
end if
end function

elemental real(dp) function dmax_3args(x, y, z) result(r)
real(dp), intent(in) :: x, y, z
r = dmax(x, y)
r = dmax(r, z)
end function

end module
