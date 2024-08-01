#!/bin/bash
# par sbeteta@beteta.org
# Under licence GPLv2 http://www.gnu.org/licenses/gpl.txt

sudo sysctl -w fs.file-max=100000
sudo sysctl -w net.core.somaxconn=65535
sudo sysctl -w net.core.netdev_max_backlog=65536
sudo sysctl -w net.ipv4.tcp_fin_timeout=15
sudo sysctl -w net.ipv4.tcp_tw_reuse=1
sudo sysctl -w net.ipv4.tcp_tw_recycle=1
sudo sysctl -w net.ipv4.tcp_max_tw_buckets=65536
sudo sysctl -w net.core.rmem_max=16777216
sudo sysctl -w net.core.wmem_max=16777216
sudo sysctl -w net.core.rmem_default=8388608
sudo sysctl -w net.core.wmem_default=8388608
sudo sysctl -w net.ipv4.tcp_max_syn_backlog=4096
sudo sysctl -w net.ipv4.tcp_window_scaling=1