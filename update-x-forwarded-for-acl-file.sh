#!/bin/bash
rm x-forwarded-for-acl
wget -O x-forwarded-for-acl https://www.cloudflare.com/ips-v4
echo "192.168.0.0/24" >> x-forwarded-for-acl
echo "172.16.0.0/12"  >> x-forwarded-for-acl
echo "10.0.0.0/8"     >> x-forwarded-for-acl
