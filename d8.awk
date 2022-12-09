@include "math"

BEGIN { FS = ""; }

{ for (i = 1; i <= NF; i++) grid[NR][i] = $i; } 

END {
    for (y = 2; y <= NR - 1; y++) {
        m = grid[y][1]
        for (x = 2; x <= NF - 1; x++) {
            if (grid[y][x] > m) counted[y][x] = 1;    
            m = max(m, grid[y][x])
        }
    }
    
    m = 0
    for (y = 2; y <= NR - 1; y++) {
        m = grid[y][NF]
        for (x = NF; x > 1; x--) {
            if (grid[y][x] > m) counted[y][x] = 1;
            m = max(m, grid[y][x])
        }
    }
    
    m = 0
    for (x = 2; x <= NF - 1; x++) {
        m = grid[1][x]
        for (y = 2; y <= NR - 1; y++) {
            if (grid[y][x] > m) counted[y][x] = 1;
            m = max(m, grid[y][x])
        }
    }
    
    m = 0
    for (x = 2; x <= NF - 1; x++) {
        m = grid[NR][x]
        for (y = NR - 1; y > 1; y--) {
            if (grid[y][x] > m) counted[y][x] = 1;
            m = max(m, grid[y][x])
        }
    }   

    for (i = 1; i <= NR; i++)
        sum += length(counted[i])
    print sum + 2 * NF + 2 * NR - 4

    for (y = 2; y <= NR - 1; y++ ) {
        for (x = 2; x <= NF - 1; x++) {
            m = max(m, left(y,x) * right(y,x) * up(y,x) * down(y,x));
            if (m > prev) prev = m;
        }
    }
    print m
    
}

function left(y, x,      i,  dist) {
    i = x - 1
    while (grid[y][i] < grid[y][x] && i-- > 1) dist++;
    return dist + 1;
}
function right(y, x,      i,  dist) {
    i = x + 1;
    while (grid[y][i] < grid[y][x] && i++ < NR) dist++;
    return dist + 1;
}
function up(y, x,      i,  dist) {
    i = y - 1;
    while (grid[i][x] < grid[y][x] && i-- > 1) dist++;
    return dist + 1;
}
function down(y, x,      i,  dist) {
    i = y + 1
    while (grid[i][x] < grid[y][x] && i++ < NR) dist++
    return dist + 1;
}