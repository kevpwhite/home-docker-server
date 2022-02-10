PERSONAL USE: FEEL FREE TO MODIFY FOR YOUR USE.

What this does.
    * Creates Docker image for IPVANISH VPN Solution
    * Creates Docker image for Transmission
    * Mounts CIFS share local SMB NAS
    * Routes Transmission container through OVPN IPVANISH server.
       
PLEASE NOTE: 
    This was build for personal use. You are welcome to fork and modify it as you see fit. 

DOCKER
https://docs.docker.com/engine/install/

DOCKER- COMPOSE
https://docs.docker.com/compose/install/

You need to connect to your ipvanish account for this to work. Follow these steps.
    * Create a .ipvlogin with your favorite text editor like nano. (Refer to example below)
    * Make sure .ipvlogin is saved to /ipvanish/.ipvlogin

    ###example .ipvlogin file###
    username@email.com
    password

This docker container is connecting to ipvanish-US-Los-Angeles-lax-a06.ovpn. You can change the server follow these steps.
    * Download other server configs from https://www.ipvanish.com/software/configs/configs.zip.
    * Unzip the configs.zip copy and paste the server you want into /ipvanish/ folder.
    * Open the ipvanish-NEW_SERVER_FILE.ovpn file you just downloaded with your favorit text editor. 
    * Edit line 10 it has to read /usr/app/ca.ipvanish.com.crt
    * Edit the start_ovpn.sh script and change ipvanish-US-Los-Angeles-lax-a06.ovpn to the ipvanish-NEW_SERVER_FILE.ovpn you downloaded and placed in /ipvanish/  

You need to add the .env so that the cifs SMB NAS share can add your credentials. Follow these steps.
    * Create a .env with your favorite text editor like nano. (Refer to example below)
    * .env should be placed on root directory.
    * Add the dockerusername variable 
    * Add the dockerpassword variable. 

    ###.env example### 
    dockerusername=YOUR_USERNAME
    dockerpassword=YOUR_PASSWORD

Change the IP address and share on docker-compose.yml. Follow these steps. 
    * Change devices:\\\\SERVER_IP\\SHARE\\ to your server ip address and share name. 

Change settings.json to reflect the changes you want. 
    * With your favorite text editor like nano edit settings.json
    * Change the settings to your needs.

Allow Transmission Web URL to route to your local network. Follow these steps. 
    * With your favorite text editor modify line 2 of start_ovpn.sh.
    * Change it to reflect your local LAN and Subnet Mask if needed. For example mine is 10.10.10.0 and subnet mask is 255.255.255.0 

    ### Example change the x.x.x.x to your LAN ###    
    route add -net "X.X.X.X" netmask 255.255.255.0 gw 172.21.0.1

Once you changed all the settings to your specifications build and run the image and container. Follow these steps. 
    * docker-compose build
    * docker-compose up -d
