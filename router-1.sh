 
printf "Enabling enp0s8\n"
ip link set dev enp0s8 up
printf "Enabling enp0s9\n"
ip link set dev enp0s9 up
printf "Adding ip 10.0.0.1/23 to enp0s8"
ip addr add 10.0.0.1/23 dev enp0s8
printf "Adding ip 10.0.4.1/30 to enp0s8"
ip addr add 10.0.4.1/23 dev enp0s8
printf "Adding ip 10.0.8.1/30 to enp0s9"
ip addr add 10.0.8.1/30 dev enp0s9
sysctl -w net.ipv4.ip_forward=1 > /dev/null
ip route add 10.0.6.0/23 via 10.0.8.2
