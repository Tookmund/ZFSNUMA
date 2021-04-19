set terminal svg
NAME = "Runtime Old ZFS 1M Reads Small Process (Data Node 0)"
set output sprintf("%s.svg", NAME)
set logscale y 2
set key autotitle columnhead top left
set title NAME
set xlabel "File Size"
set ylabel "Runtime (seconds)"
plot   "OldZFSSame.csv" using 2:xtic(1) \
            with lines lt rgb "dark-green" title "Same Node", \
       "OldZFSDifferent.csv" using 2:xtic(1) \
            with lines lt rgb "orange" title "Different Node"

