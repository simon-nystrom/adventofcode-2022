BEGIN  { x = 1;                     }
/noop/ { cycle();                   }
/addx/ { cycle(); cycle(); x += $2; }

END {
    print p1;
    for (i = 0; i < length(CRT); i++) {
        r = ""
        for (j in CRT[i]) {
            r = r CRT[i][j]
        }
        print r
    }
}

function cycle() {
    CRT[int(c / 40)][c + 1] = abs(c % 40 - x) <= 1 ? "#" : ".";
    c++;
    if ((c - 20) % 40 == 0) p1 += c * x;
}