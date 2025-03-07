program intrinsics_132
    real :: x = 5.8
    integer(kind = 4) :: res_4
    integer(kind = 8) :: res_8
    integer :: test_kind
    
    res_4 = floor(x)
    print *, res_4
    if (res_4 /= 5) error stop

    res_8 = floor(x, 8)
    print *, res_8
    if (res_8 /= 5) error stop

    res_4 = floor(x, 4)
    print *, res_4
    if (res_4 /= 5) error stop

    res_4 = floor(5.8)
    print *, res_4
    if (res_4 /= 5) error stop

    res_8 = floor(5.8, 8)
    print *, res_8
    if (res_8 /= 5) error stop

    res_4 = floor(0.0)
    print *, res_4
    if (res_4 /= 0) error stop

    res_8 = floor(0.0, 8)
    print *, res_8
    if (res_8 /= 0) error stop

    res_4 = floor(-412.124)
    print *, res_4
    if (res_4 /= -413) error stop

    res_8 = floor(-412.124, 8)
    print *, res_8
    if (res_8 /= -413) error stop

    test_kind = kind(floor(x,4))
    print *, test_kind
    if (test_kind /= 4) error stop

    test_kind = kind(floor(x,8))
    print *, test_kind
    if (test_kind /= 8) error stop

    test_kind = kind(floor(5.0,4))
    print *, test_kind
    if (test_kind /= 4) error stop

    test_kind = kind(floor(5.0,8))
    print *, test_kind
    if (test_kind /= 8) error stop

    test_kind = kind(floor(0.0))
    print *, test_kind
    if (test_kind /= 4) error stop

end program
