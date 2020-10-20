#!/usr/bin/python3

import os
import subprocess
import sys

os.chdir("/home/jaadams/arctest/autoarctest/")

testruns = os.listdir("test-runs")

if len(testruns) == 0:
    print("Test Run Complete!")
    sys.exit(0)

testfile = testruns[0]
print(testfile)

test = testfile.split(".")
bound = test[0]
node = test[1]
script = test[2]
datafile = test[3]

os.chdir("data")

if bound == "U":
    subprocess.run(["modprobe", "zfs"], check=True)
elif bound == "B":
    subprocess.run(["./scripts/zfs.sh"], cwd="/home/jaadams/zfs", check=True)

subprocess.run(["zpool", "import", "tank"], check=True)

try:
    os.mkdir(bound+node)
except FileExistsError:
    pass

os.chdir(bound+node)

subprocess.run(["numactl", "-N", node, "-m", node,
    "../../../"+script+".sh", "/tank/"+datafile], check=True)

os.remove("../../test-runs/"+testfile)
subprocess.run(["reboot"])
