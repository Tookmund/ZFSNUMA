set terminal svg
set output "ProcessSizeImprovement.svg"
set title "Runtime Percentage Improvement Based on Process Size"
set xlabel "File Size"
set ylabel "Process Size"
set zlabel "Improvement (percentage)" rotate by 90
set palette rgb 30,31,32
splot "1MSimpleReadsProcessSize.txt" matrix columnheaders rowheaders notitle with lines palette
