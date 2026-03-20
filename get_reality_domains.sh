#!/bin/bash

curl -sL "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" -o /tmp/install.sh

domain_list=$(sed -n '9245p' /tmp/install.sh | sed 's/.*realityDestDomainList="\([^"]*\)".*/\1/')

echo "$domain_list" | tr ',' '\n'

echo "共 $(echo "$domain_list" | tr ',' '\n' | wc -l) 个域名"
