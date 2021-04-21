set terminal svg
set output "ReadSizeImprovement.svg"
set title "50% Latency Percentage Improvement"
set xlabel "File Size"
set ylabel "Read Size"
set zlabel "Improvement (percentage)" rotate by 90
set palette rgb 30,31,32
splot "ReadSizeImprovement.csv" matrix columnheaders rowheaders notitle with lines palette
