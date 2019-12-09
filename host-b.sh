printf "Enabling enp0s8\n"
ip link set dev enp0s8 up
printf "Adding ip 10.0.4.2/23 to enp0s8"
ip addr add 10.0.4.2/23 dev enp0s8

printf "Adding router for 10.0.6.0/23"
ip route add 10.0.6.0/23 via 10.0.4.1
