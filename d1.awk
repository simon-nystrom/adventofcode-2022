BEGIN   { RS = "\n\n"; }
        { for (i = 1; i <= NF; i++) { sum[FNR] += $i }; }
END     { 
            asort(sum);
            print "p1: " sum[NR];
            print "p2: " sum[NR] + sum[NR - 1] + sum[NR - 2];
}



