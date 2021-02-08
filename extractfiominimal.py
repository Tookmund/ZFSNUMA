#!/usr/bin/python3

import csv
import sys

stat = sys.argv[1]
fname = sys.argv[2]
with open(fname) as f:
    l = f.read().split(";");
    # https://www.andypeace.com/fio_minimal.html
    if stat == "bw":
        print("Bandwidth:", l[6])
    elif stat == "50lat" or stat == "50":
        print("50% Latency:", l[23])
    elif stat == "99lat" or stat == "99":
        print("99% Latency:", l[29])
    elif stat == "avglat" or stat == "avg":
        print("Average Latency:", l[40])
