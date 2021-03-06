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

def runtest(folder, node, script, datafile, nums, blocksize):
    t = subprocess.run(["numactl", "-N", node, "-m", node,
        folder+script+".sh", "/tank/"+datafile, nums, blocksize],
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    if t.returncode != 0:
        message('''ERROR
Return Code: {}
Node: {}
Script: {}
Datafile: {}
Nums: {}
Blocksize: {}
Error:
{}'''.format(t.returncode, node, script, datafile, nums, blocksize, str(t.stdout)))
        sys.exit(t.returncode);

def message(text):
    print(text)
    subprocess.run(["sendmessage.sh", text], check=False)

os.chdir("/home/jaadams/arctest/autoarctest/")

testruns = os.listdir("test-runs")

runsleft = len(testruns)
if runsleft == 0:
    message("Test Run Complete!")
    sys.exit(0)
elif runsleft % 5 == 0:
    message("{} Tests Remaining!".format(runsleft))

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
blocksize = ""

if len(test) > 4:
    nums = test[4]
if len(test) > 5 and test[5] == "O":
    opposite = True
if len(test) > 6:
    blocksize = test[6]

os.chdir("newdata")

# Unload modules to ensure consistent state for test
subprocess.run(["./scripts/zfs.sh", "-u"], cwd="/home/jaadams/zfs", check=True)

if bound == "B" or bound == "T":
    subprocess.run(["./scripts/zfs.sh"], cwd="/home/jaadams/zfs", check=True)
else:
    subprocess.run(["modprobe", "zfs"], check=True)

if bound == "M":
    subprocess.run(["sysctl", "kernel.numa_balancing=1"], check=True)
else:
    subprocess.run(["sysctl", "kernel.numa_balancing=0"], check=True)

meminfo("Load ZFS")

subprocess.run(["zpool", "import", "tank"], check=True)
meminfo("Import tank ZPool")

try:
    os.mkdir(bound+node)
except FileExistsError:
    pass

os.chdir(bound+node)

runtest("../../../", node, script, datafile, nums, blocksize)

meminfo("After Test")

if opposite:
    try:
        os.mkdir("O")
    except FileExistsError:
        pass
    os.chdir("O")
    onode = "1" if node == "0" else "0"
    runtest("../../../../", onode, script, datafile, nums, blocksize)
    meminfo("After Opposite Node")
    os.chdir("..")

os.remove("../../test-runs/"+testfile)
print(testfile, "Complete!", flush=True)
subprocess.run(["reboot"])
