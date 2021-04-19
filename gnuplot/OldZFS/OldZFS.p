set terminal svg
set output "Runtime Old ZFS 1M Reads Small Process (Data Node 0).svg"
set logscale y 2
set key autotitle columnhead
set title "Runtime Old ZFS 1M Reads Small Process (Data Node 0)"
plot   "OldZFSSame.csv" using 2:xtic(1) \
            with lines lt rgb "dark-green" title "Same Node", \
       "OldZFSDifferent.csv" using 2:xtic(1) \
            with lines lt rgb "gold" title "Different Node"

