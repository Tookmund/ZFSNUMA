#!/usr/bin/python3

import json
import sys

stat = sys.argv[1]
statfiles = sys.argv[2:]
if stat == "bw":
	print("Bandwidth")
elif stat == "99lat":
	print("99% Latency")
elif stat == "50lat":
	print("50% Latency")
elif stat == "avglat" or stat == "avg":
	print("Average Latency")
else:
	ptile = float(stat)
	print("{}% Latency:".format(ptile))

for fname in statfiles:
	with open(fname) as f:
		j = json.load(f)["jobs"][0]["read"]
		if stat == "bw":
			print(j["bw_bytes"])
		elif stat == "50lat" or stat == "50":
			print(j["clat_ns"]["percentile"]["50.000000"])
		elif stat == "99lat" or stat == "99":
			print(j["clat_ns"]["percentile"]["99.000000"])
		elif stat == "avglat" or stat == "avg":
			print(j["lat_ns"]["mean"])
		else:
			print(j["clat_ns"]["percentile"]["{:.6f}".format(ptile)])
