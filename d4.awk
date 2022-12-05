    { 
        match($0, /([0-9]+)-([0-9]+),([0-9]+)-([0-9]+)/, r);
        if (r[1] <= r[3] && r[2] >= r[4] || r[3] <= r[1] && r[4] >= r[2]) { p1++; p2++; }
        else if (r[1] <= r[3] && r[2] >= r[3]) p2++;
        else if (r[3] <= r[1] && r[4] >= r[1]) p2++;
    }
END { print p1; print p2; }

