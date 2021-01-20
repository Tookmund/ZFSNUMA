import json
import sys

with open(sys.argv[1]) as f:
    j = json.load(f)["jobs"][0]["read"]
    print("Bandwidth:", j["bw_bytes"])
    print("50% Latency:", j["clat_ns"]["percentile"]["50.000000"])
    print("99% Latency:", j["clat_ns"]["percentile"]["99.000000"])
    print("Average Latency:", j["lat_ns"]["mean"])
