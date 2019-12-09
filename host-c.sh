
apt-get -qq update
apt-get -qq install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get -qq update
apt-get -qq install docker-ce docker-ce-cli containerd.io

docker pull -q dustnic82/nginx-test
docker run -d -p 80:80 dustnic82/nginx-test

printf "Enabling enp0s8\n"
ip link set dev enp0s8 up
printf "Adding ip 10.0.6.2/23 to enp0s8"
ip addr add 10.0.6.2/23 dev enp0s8

printf "Adding router for 10.0.6.0/23"
ip route add 10.0.0.0/23 via 10.0.6.1
ip route add 10.0.4.0/23 via 10.0.6.1
