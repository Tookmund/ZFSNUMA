set terminal svg
set output "ReadSizeImprovement.svg"
set title "50% Latency Percentage Improvement"
splot "ReadSizeImprovement.csv" matrix columnheaders rowheaders with lines notitle 
