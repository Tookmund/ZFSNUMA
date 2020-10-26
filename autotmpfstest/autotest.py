#!/usr/bin/python3

import os
import shutil
import subprocess
import sys
import time

def meminfo(what):
    print(what)
    for n in ["0", "1"]:
        with open("/sys/devices/system/node/node"+n+"/meminfo") as f:
            print(f.read())

tmpfsnode = 1

os.chdir("/home/jaadams/arctest/autotmpfstest/")

testruns = os.listdir("test-runs")

if len(testruns) == 0:
    print("Test Run Complete!")
    sys.exit(0)

testfile = testruns[0]
print(testfile)
meminfo("Begin")

test = testfile.split(".")
node = test[0]
script = test[1]
datafile = test[2]

os.chdir("data")

subprocess.run(["mount", "-t", "tmpfs", "-o", "mpol=bind:"+str(tmpfsnode)+",size=13G", "tmpfs", "/mnt"], check=True)

meminfo("Mount tmpfs")

try:
    os.mkdir(node)
except FileExistsError:
    pass

os.chdir(node)

subprocess.run(["numactl", "-N", str(tmpfsnode), "-m", str(tmpfsnode),
    "../../../genfile.sh", "/mnt/"+datafile], check=True, stdout=subprocess.DEVNULL)
meminfo("Create File")

subprocess.run(["numactl", "-N", node, "-m", node,
    "../../../"+script+".sh", "/mnt/"+datafile], check=True)
meminfo("After Test")

print(testfile, "Complete!", flush=True)
os.remove("../../test-runs/"+testfile)
subprocess.run(["reboot"])
