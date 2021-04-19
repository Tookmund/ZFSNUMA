set terminal svg
set output "ReadSizeImprovement.svg"
set title "50% Latency Percentage Improvement"
set xlabel "File Size"
set ylabel "Read Size"
set zlabel "Improvement (percentage)" rotate by 90
splot "ReadSizeImprovement.csv" matrix columnheaders rowheaders with lines notitle 
