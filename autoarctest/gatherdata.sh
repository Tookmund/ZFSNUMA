#!/bin/sh
# Assume we're in data/whatever

cp -r ../../newdata/* .
cp /var/log/autoarctest/* .
../../../logname.sh
mv B.0.* B0
mv B.1* B1
mv U.0* U0
mv U.1* U1
