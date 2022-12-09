@include "math"

BEGIN { for (i = 0; i <= 9; i++) { P[i]["x"] = 0; P[i]["y"] = 0; } }

{
    for (i = 1; i <= $2; i++) { 
        if ($1 == "U") P[0]["y"]--;
        if ($1 == "D") P[0]["y"]++;
        if ($1 == "R") P[0]["x"]++;
        if ($1 == "L") P[0]["x"]--;
        for (k = 1; k <= 9; k++) {
            if (!is_adj(P[k]["x"],P[k]["y"],P[k-1]["x"],P[k-1]["y"])) {
                diffX = P[k-1]["x"] - P[k]["x"];
                diffY = P[k-1]["y"] - P[k]["y"];
                P[k]["x"] += diffX > 0 ? 1 : diffX == 0 ? 0 : -1;
                P[k]["y"] += diffY > 0 ? 1 : diffY == 0 ? 0 : -1;
            }
        } 
        A[P[1]["y"]][P[1]["x"]] = 1;
        B[P[9]["y"]][P[9]["x"]] = 1;
    }
}

 END {
    for (a in A) p1 += length(A[a]);
    for (a in B) p2 += length(B[a]);
    print p1; print p2;
 }

function is_adj(x1,y1,x2,y2) {
    return abs(x1 - x2) <= 1 && abs(y1 - y2) <= 1;
}



