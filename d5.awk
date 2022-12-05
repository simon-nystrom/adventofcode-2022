@include "strings"

BEGIN { 
    cargo["1"] = "DLVTMHF";  cargo["2"] = "HQGJCTNP"; cargo["3"] = "RSDMPH";
    cargo["4"] = "LBVF";     cargo["5"] = "NHGLQ";    cargo["6"] = "WBDGRMP";
    cargo["7"] = "GMNRCHLQ"; cargo["8"] = "CLW";      cargo["9"] = "RDLQJZMT";
}

FNR > 10 {
    num = $2; from = $4; to = $6;
    # For part2 remove reverse
    cargo[to] = cargo[to] reverse(substr(cargo[from], length(cargo[from]) - num + 1,  num));
    cargo[from] = substr(cargo[from], 0, length(cargo[from]) - num);
}

END { 
    for (i = 1; i <= 9; i++) {
        split(cargo[i], arr, "")
        msg = msg arr[length(arr)];
    }
    print msg
 }