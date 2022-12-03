BEGIN {
    num_grps = 1;
}

{ 
    a = $0;
    gsub(".{" length(a) / 2 "}", "& ", a);
    split(a, b, " ");
    first = b[1]; second = b[2];
    split(first, arr, "");
    for (i = 1; i <= length(arr); i++) {
        n = gsub(arr[i], "", second)
        if (n > 0) res[FNR] = arr[i]
    }
}

cntr == 0 { x = $0; cntr++; next; }
cntr == 1 { y = $0; cntr++; next; }
cntr == 2 { 
    cntr = 0;
    z = $0; 
    split(x, brr, "");
    for (i = 1; i <= length(brr); i++) {
        n1 = gsub(brr[i], "", y);
        n2 = gsub(brr[i], "", z);
        if (n1 > 0 && n2 > 0) {
            res1[num_grps++] = brr[i]
            next;
        }
    }
}

END {
    for(n = 0; n < 256; n++) ord[sprintf("%c",n)] = n;
    for (i = 1; i <= length(res); i++) {
        if (ord[res[i]] >= 97) p1 += ord[res[i]] - 96;
        else p1 += ord[res[i]] - 38;
    }
    for (i = 1; i < num_grps; i++) {
        if (ord[res1[i]] >= 97) p2 += ord[res1[i]] - 96;
        else p2 += ord[res1[i]] - 38;
    }
    print p1; print p2;
}