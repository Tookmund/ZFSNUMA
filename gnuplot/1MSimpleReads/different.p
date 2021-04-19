set terminal svg
NAME = "Runtime Different Node 1M Reads Small Process (Data Node 0)"
set output sprintf("%s.svg", NAME)
set logscale y 2
set key left top autotitle columnhead
set title NAME
plot    "1MSimpleReadsNewOpposite.txt" using 2:xtic(1) \
            with lines lt rgb "red" title "New ZFS", \
        "1MSimpleReadsOldOpposite.txt" using 2:xtic(1) \
            with lines lt rgb "blue" title "Old ZFS"

