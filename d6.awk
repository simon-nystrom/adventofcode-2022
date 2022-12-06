# l = 4 in part1
BEGIN { FS = ""; l = 14; }

{ 
    for (i = 1; i <= NF; i++) {
        a = substr($0, i, l)
        split(a, b, "")
        for (j = 1; j <= l; j++) {
            if (found[b[j]] > 1) break;
            found[b[j]]++;
        }
        if (length(found) == l) {
            print i + l - 1; exit;
        }
        delete found;
    }
}