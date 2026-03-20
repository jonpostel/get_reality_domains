#!/bin/bash

curl -sL "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" -o /tmp/install.sh

domain_list=$(sed -n '9245p' /tmp/install.sh | sed 's/.*realityDestDomainList="\([^"]*\)".*/\1/')

echo "$domain_list" | tr ',' '\n' > RealityName.txt

echo "已成功将 xray-core 的域名写入 RealityName.txt"
echo "共 $(wc -l < RealityName.txt) 个域名"
