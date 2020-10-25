#!/usr/bin/python3

import os
import shutil
import subprocess
import sys

def meminfo(what):
    print(what)
    for n in ["0", "1"]:
        with open("/sys/devices/system/node/node"+n+"/meminfo") as f:
            print(f.read())

os.chdir("/home/jaadams/arctest/autotmpfstest/")

testruns = os.listdir("test-runs")

if len(testruns) == 0:
    print("Test Run Complete!")
    sys.exit(0)

testfile = testruns[0]
print(testfile)
meminfo("Begin")

test = testfile.split(".")
bound = test[0]
node = test[1]
script = test[2]
datafile = test[3]

os.chdir("data")

if bound == "U":
    subprocess.run(["mount", "-t", "tmpfs", "-o", "size=13G", "tmpfs", "/mnt"], check=True)
elif bound == "B":
    subprocess.run(["mount", "-t", "tmpfs", "-o", "mpol=bind:1,size=13G", "tmpfs", "/mnt"], check=True)

meminfo("Mount tmpfs")

try:
    os.mkdir(bound+node)
except FileExistsError:
    pass

os.chdir(bound+node)

subprocess.run(["../../../genfile.sh", "/mnt/"+datafile], check=True)
subprocess.run(["numactl", "-N", node, "-m", node,
    "../../../"+script+".sh", "/mnt/"+datafile], check=True)
meminfo("After Test")

os.remove("../../test-runs/"+testfile)
subprocess.run(["reboot"])
