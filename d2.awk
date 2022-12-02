BEGIN {
    points["L"] = 0; points["D"] = 3; points["W"] = 6;
    values["X"] = 1; values["Y"] = 2; values["Z"] = 3;
}

/X$/  { p1 += values["X"]; }
/A X/ { p1 += points["D"]; p2 += values["Z"] + points["L"]; }
/B X/ { p1 += points["L"]; p2 += values["X"] + points["L"]; }
/C X/ { p1 += points["W"]; p2 += values["Y"] + points["L"]; }
/Y$/  { p1 += values["Y"]; }
/A Y/ { p1 += points["W"]; p2 += values["X"] + points["D"]; }
/B Y/ { p1 += points["D"]; p2 += values["Y"] + points["D"]; }
/C Y/ { p1 += points["L"]; p2 += values["Z"] + points["D"]; }
/Z$/  { p1 += values["Z"]; }
/A Z/ { p1 += points["L"]; p2 += values["Y"] + points["W"]; }
/B Z/ { p1 += points["W"]; p2 += values["Z"] + points["W"]; }
/C Z/ { p1 += points["D"]; p2 += values["X"] + points["W"]; }

END   { print p1; print p2; }

