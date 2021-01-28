#!/usr/bin/python3

import json
import sys

stat = sys.argv[1]
fname = sys.argv[2]
with open(fname) as f:
    j = json.load(f)["jobs"][0]["read"]
    if stat == "bw":
        print("Bandwidth:", j["bw_bytes"])
    elif stat == "50lat" or stat == "50":
        print("50% Latency:", j["clat_ns"]["percentile"]["50.000000"])
    elif stat == "99lat" or stat == "99":
        print("99% Latency:", j["clat_ns"]["percentile"]["99.000000"])
    elif stat == "avglat" or stat == "avg":
        print("Average Latency:", j["lat_ns"]["mean"])
