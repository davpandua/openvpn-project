#!/bin/bash

cd /usr/share/easy-rsa/
source vars
./clean-all
./pkitool --initca
./build-dh
openvpn --genkey --secret keys/ta.key

cp keys/* localkeys/
