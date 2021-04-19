set terminal svg
NAME = "Bandwidth Different Node 2M Reads fio (Data Node 0)"
set output sprintf("%s.svg", NAME)
set logscale y 2
set key left top autotitle columnhead
set title NAME
set xlabel "File Size"
set ylabel "Bandwidth (GB/s)"
plot    "2MfioBandwidthNewDifferent.txt" using 2:xtic(1) \
            with lines lt rgb "red" title "New ZFS", \
        "2MfioBandwidthOldDifferent.txt" using 2:xtic(1) \
            with lines lt rgb "blue" title "Old ZFS"

