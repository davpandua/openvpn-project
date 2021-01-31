#!/bin/bash

cd /usr/share/easy-rsa/
source vars
cp -r localkeys keys
./pkitool --server server


cp keys/* localkeys/
