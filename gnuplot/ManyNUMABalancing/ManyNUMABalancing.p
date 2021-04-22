set terminal svg
NAME = "90% Latency Old ZFS 1M Reads NUMA Balancing 100 fio Runs (Data Node 0)"
set output sprintf("%s.svg", NAME)
set logscale y 2
set key autotitle columnhead top left
set title NAME
set xlabel "Runs"
set ylabel "90% Latency (ns)"
plot   "Same90.txt" with lines lt rgb "dark-green" title "Same Node", \
       "Different90.txt" with lines lt rgb "orange" title "Different Node"

