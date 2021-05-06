set terminal svg
NAME = "90th Percentile Latency Old ZFS 1M Reads NUMA Balancing 100 fio Runs (Data Node 0)"
set output sprintf("%s.svg", NAME)
set logscale y 2
set key autotitle columnhead top left
set title NAME
set xlabel "Runs"
set ylabel "90th Percentile Latency (ns)"
plot   "Same90.txt" with lines lt rgb "blue" title "Same Node", \
       "Different90.txt" with lines lt rgb "red" title "Different Node"
