net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
net.ipv4.tcp_fin_timeout = 3
net.ipv4.tcp_tw_recycle = 0
net.core.netdev_max_backlog = 30000
net.ipv4.tcp_no_metrics_save=1
net.core.somaxconn = 262144
net.ipv4.tcp_syncookies = 0
net.ipv4.tcp_max_orphans = 262144
net.ipv4.tcp_max_syn_backlog = 262144
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 2
net.ipv4.ip_local_port_range=1024 65535
# /etc/sysctl.d/00-network.conf# Receive Queue Size per CPU Core, number of packets
# Example server: 8 cores
net.core.netdev_max_backlog = 4096# SYN Backlog Queue, number of half-open connections
net.ipv4.tcp_max_syn_backlog = 32768# Accept Queue Limit, maximum number of established
# connections waiting for accept() per listener.
net.core.somaxconn = 65535# Maximum number of SYN and SYN+ACK retries before
# packet expires.
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1# Timeout in seconds to close client connections in
# TIME_WAIT after receiving FIN packet.
net.ipv4.tcp_fin_timeout = 5# Disable SYN cookie flood protection
net.ipv4.tcp_syncookies = 0# Maximum number of threads system can have, total.
# Commented, may not be needed. See user limits.
#kernel.threads-max = 3261780# Maximum number of file descriptors system can have, total.
# Commented, may not be needed. See user limits.
#fs.file-max = 3261780
