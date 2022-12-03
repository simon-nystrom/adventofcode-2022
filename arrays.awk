function map(arr, map_func) {
    for (i = 1; i <= length(arr); i++) {
        arr[i] = @map_func(arr[i])
    }
}

function sum(arr,    res) {
    for (i = 1 ; i < length(arr); i++) {
        res += arr[i]
    }
    return res;
}

function array_equal(arr1, arr2) {
    if (length(arr1) != length(arr2)) return 0;
    for (i = 1; i < length(arr1); i++) {
        if (arr1[i] != arr2[i]) return 0;
    }
    return 1;
}