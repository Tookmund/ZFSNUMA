#!/bin/sh
# Assume we're in data/whatever

cp -r ../../newdata/* .
cp /var/log/autoarctest/* .
../../../logname.sh
mv B.0.* B0
mv B.0.* B0
mv U.0.* U0
mv U.1* U1
mv M.0* M0
mv M.1* M1
mv T.1* T1
mv T.1* T1

