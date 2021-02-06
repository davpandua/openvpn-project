#!/bin/bash

cd /usr/share/easy-rsa/
source vars
./pkitool client1

cp keys/client1* localkeys/
