/\$ cd [^.]/ { d[p][FNR] = p "/" $3; p = p "/" $3;   }
/\$ cd \.\./ { sub(/\/[a-z]+$/, "", p);              }
/([0-9]+)/   { f[p][FNR] = $0;                       }

END {
    for (i in d) 
        for (j in d[i]) {
            req[d[i][j]] = size(d[i][j]);
            if (req[d[i][j]] < 100000) p1 += size(d[i][j]);
        }

    nf = 30000000 - (70000000 - size("//"));
    asort(req);
    for (i in req) {
        if (nf - req[i] < 0) {
            break;
        }
    }
    print "p1: " p1;
    print "p2: " req[i];
}

function size(path,   s, i, k) {
    for (i in f[path]) s += f[path][i];
    for (k in d[path]) s += size(d[path][k]);
    return s
}