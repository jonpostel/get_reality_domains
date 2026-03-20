#!/bin/bash

set -e

detect_os() {
    case "$(uname -s)" in
        Linux*)     echo "linux";;
        Darwin*)    echo "macos";;
        CYGWIN*|MINGW*|MSYS*) echo "windows";;
        *)          echo "unknown";;
    esac
}

get_temp_dir() {
    local os=$(detect_os)
    if [ "$os" = "windows" ]; then
        echo "$TEMP"
    else
        echo "/tmp"
    fi
}

main() {
    local temp_dir=$(get_temp_dir)
    local temp_file="${temp_dir}/install_$$_$(date +%s).sh"
    
    curl -sL "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" -o "$temp_file"
    
    domain_list=$(sed -n '9245p' "$temp_file" | sed 's/.*realityDestDomainList="\([^"]*\)".*/\1/')
    
    echo "$domain_list" | tr ',' '\n'
    
    local count=$(echo "$domain_list" | tr ',' '\n' | wc -l)
    echo "Total: $count domains"
    
    rm -f "$temp_file"
}

main "$@"
