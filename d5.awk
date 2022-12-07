@include "strings"

BEGIN { 
    c["1"] = "DLVTMHF";  c["2"] = "HQGJCTNP"; c["3"] = "RSDMPH";
    c["4"] = "LBVF";     c["5"] = "NHGLQ";    c["6"] = "WBDGRMP";
    c["7"] = "GMNRCHLQ"; c["8"] = "CLW";      c["9"] = "RDLQJZMT";
}

# remove reverse for p2

FNR > 10 { 
    c[$6] = c[$6] reverse(substr(c[$4], length(c[$4]) - $2 + 1, $2)); 
    c[$4] = substr(c[$4], 0, length(c[$4]) - $2);
}

END { 
    for (i = 1; i <= 9; i++) {
        split(c[i], arr, //);
        msg = msg arr[length(arr)];
    }
    print msg;
 }
