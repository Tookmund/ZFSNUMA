#!/usr/bin/python3

import os
import subprocess
import sys
import time


def meminfo(what):
    print(what)
    for n in ["0", "1"]:
        with open("/sys/devices/system/node/node"+n+"/meminfo") as f:
            print(f.read())

os.chdir("/home/jaadams/arctest/autoarctest/")

testruns = os.listdir("test-runs")

if len(testruns) == 0:
    print("Test Run Complete!")
    subprocess.run(["sendmessage.sh", "Test Run Complete!"], check=True)
    sys.exit(0)

testfile = testruns[0]
print(testfile)
meminfo("Begin")

test = testfile.split(".")
bound = test[0]
node = test[1]
script = test[2]
datafile = test[3]
nums = ""
opposite = False

if len(test) > 4:
    nums = test[4]
if len(test) > 5 and test[5] == "O":
    opposite = True

os.chdir("newdata")

# Unload modules to ensure consistent state for test
subprocess.run(["./scripts/zfs.sh", "-u"], cwd="/home/jaadams/zfs", check=True)

if bound == "B":
    subprocess.run(["./scripts/zfs.sh"], cwd="/home/jaadams/zfs", check=True)
else:
    subprocess.run(["modprobe", "zfs"], check=True)
meminfo("Load ZFS")

subprocess.run(["zpool", "import", "tank"], check=True)
meminfo("Import tank ZPool")

try:
    os.mkdir(bound+node)
except FileExistsError:
    pass

os.chdir(bound+node)

subprocess.run(["numactl", "-N", node, "-m", node,
    "../../../"+script+".sh", "/tank/"+datafile, nums], check=True)

meminfo("After Test")

if opposite:
    try:
        os.mkdir("O")
    except FileExistsError:
        pass
    os.chdir("O")
    onode = "1" if node == "0" else "0"
    subprocess.run(["numactl", "-N", onode, "-m", onode,
        "../../../../"+script+".sh", "/tank/"+datafile, nums], check=True)
    meminfo("After Opposite Node")
    os.chdir("..")

os.remove("../../test-runs/"+testfile)
print(testfile, "Complete!", flush=True)
subprocess.run(["reboot"])
