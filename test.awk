@include "strings"
@include "math"
@include "arrays"

function assert(expected, actual) {
    if (expected != actual) {
        print expected " does not equal " actual
        exit 1;
    }
}

function assertTrue(bool) {
    return assert(1, bool)
}

function assertFalse(bool) {
    return assert(0, bool)
}

function mapper(v) {
    return v + 1
}

BEGIN {
    assert(min(3, 2), 2)
    assert(min(-1, 2), -1)
    assert(min(2, 2), 2)
    assert(min(2, 3), 2)

    assert(max(3, 2), 3)
    assert(max(-1, 2), 2)
    assert(max(2, 2), 2)
    assert(max(2, 3), 3)

    split("a b c", a)
    assert("abc", join(a))
    split("ac", a)
    assert("ac", join(a))
    split("", a)
    assert("", join(a))

    split("a b c", a)
    split("a b c", b)    
    assertTrue(array_equal(a, b))

    split("1 2 3", a)
    map(a, "mapper")
    split("2 3 4", b)
    assertTrue(array_equal(a, b))


}