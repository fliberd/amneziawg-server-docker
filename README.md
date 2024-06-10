# Amneziawg-server-docker
### forked from [amnesia-vpn](https://github.com/amnezia-vpn)
Docker image + compose for create VPN tunnel between VPS 

[Pull Docker image](https://hub.docker.com/r/fliberd/amnesia-server)

## Step by step guide for debian 11 and 12
0) Connect to the VPS as a root. Use ```su -```
1) Update Debian
   ```apt-get update && apt-get full-upgrade -y```
2) UFW installing and git
   ```apt-get install ufw git```
3) Docker + docker compose installing
   ```wget -qO- get.docker.com | bash```
4) Make dir
   ```mkdir /opt/amnesia-server```
6) Clone git repository
   ```git clone https://github.com/fliberd/amnesiawg-server-docker.git```
7) Move files
   ```mv  -v /opt/amnesiawg-server-docker/* /opt/amnesia-server/```
9) Change directory
    ```cd /opt/amnesia-server```
10) Make dir
    ```mkdir wireguard```
11) [Create private and public keys for VPS](https://www.webhi.com/how-to/install-configure-wireguard-debian-ubuntu/#:~:text=private%20key%20with%3A-,%24,-wg%20genkey%20%3E)
12) awg.conf change
    ```cp awg.conf ./wireguard/awg.conf```
    ```nano ./wireguard/awg.conf```
13) Enable UFW
    ```ufw allow 22``` (SSH port)
    ```ufw allow {your wireguard port}```
    ```ufw enable```
14) Docker up
    ```docker compose up -d```
15) Check connection
    ```docker exec -it amnesia-server /bin/bash```
    ```ping xx.xx.xx.xx``` (second VPS IP in VPN)
    ```exit```
16) End

## Building
```cd /opt/amnesia-server```
```docker compose build```

## Star history
[![Star History Chart](https://api.star-history.com/svg?repos=fliberd/amnesiawg-server-docker&type=Date)](https://star-history.com/#fliberd/amnesiawg-server-docker&Date)

