set terminal svg
set output "RandReadSizeImprovement.svg"
set title "50th Percentile Latency Percentage Random Read Improvement"
set xlabel "File Size"
set ylabel "Read Size"
set zlabel "Improvement (percentage)" rotate by 90
set palette rgb 30,31,32
splot "RandReadSizeImprovement.tsv" matrix columnheaders rowheaders notitle with lines palette
