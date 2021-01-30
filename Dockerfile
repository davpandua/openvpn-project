
#------------------------------------
# Dockerfile OPENVPN SERVER
#------------------------------------
#
# Install base image
FROM ubuntu:18.04
# Autor and contact references
LABEL maintainer=”DAVID-PANADES-DUART”
# Set default shell (bash)
#SHELL ["/bin/bash","-c"]
RUN apt-get update; apt-get upgrade -y \
&& apt-get install -y apt-utils openvpn easy-rsa bridge-utils nmap ufw less locate \
nano iputils-ping ssh traceroute net-tools tree netcat curl tcpdump \
&& apt autoremove \
&& apt clean all 
RUN mkdir /home/openvpn
RUN updatedb
RUN ln -s /usr/share/easy-rsa/openssl-1.0.0.cnf /usr/share/easy-rsa/openssl.cnf 
ADD openvpn/vars /usr/share/easy-rsa/vars
WORKDIR /home/openvpn
# Expose ports
EXPOSE 1194 943 945
ADD openvpn/server.conf /etc/openvpn/server/
ENTRYPOINT openvpn /etc/openvpn/server/server.conf
