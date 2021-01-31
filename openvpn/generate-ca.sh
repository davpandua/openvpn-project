#!/bin/bash

cd /usr/share/easy-rsa/
source vars
./clean-all
./pkitool --initca
./build-dh

cp keys/* localkeys/
