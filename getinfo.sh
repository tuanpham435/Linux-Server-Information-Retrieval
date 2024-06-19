#!/bin/bash

cpu_num=$(grep -c ^processor /proc/cpuinfo)
echo "cpu num: $cpu_num"

total_memory=$(free -h | awk '/^Mem:/ {print $2}')
free_memory=$(free -m | awk '/^Mem:/ {print $4}')
echo "memory total: $total_memory"
echo "memory free: $free_memory M"

disk_size=$(df -h / | awk '/\// {print $2}')
echo "disk size: $disk_size"

system_bit=$(getconf LONG_BIT)
echo "system bit: $system_bit"

process_count=$(ps -e | wc -l)
echo "process: $process_count"

software_count=$(dpkg -l | grep ^ii | wc -l)
echo "software num: $software_count"

ip_address=$(ip addr show | awk '/inet/ {print $2}' | cut -d/ -f1 | grep -v -E '127.0.0.1|::1' | head -n 1)
echo "ip: $ip_address"
