#!/usr/bin/python3

import os
import shutil
import subprocess
import sys

os.chdir("/home/jaadams/arctest/autotmpfstest/")

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
    subprocess.run(["mount", "-t", "tmpfs", "-o", "size=13G", "/mnt"], check=True)
elif bound == "B":
    subprocess.run(["mount", "-t", "tmpfs", "-o", "mpol=bind:1,size=13G", "/mnt"], check=True)

try:
    os.mkdir(bound+node)
except FileExistsError:
    pass

os.chdir(bound+node)

subprocess.run(["../../../genfile.sh", "/mnt/"+datafile], check=True)
subprocess.run(["numactl", "-N", node, "-m", node,
    "../../../"+script+".sh", "/mnt/"+datafile], check=True)

os.remove("../../test-runs/"+testfile)
subprocess.run(["reboot"])
