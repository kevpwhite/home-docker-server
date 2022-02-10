FROM alpine:3
LABEL maintainer "Kevin White <kevinpwhitejr@gmail.com>"
LABEL name "transmission"

#Working DIR for app
WORKDIR /usr/app/

COPY settings.json .
COPY start_transmission.sh /etc

#1st line installs apps listed. 
#2nd line makes config folder. 
#3rd line changes folder and subs to 777. 
#4th line creates the mount location for cifs share built via docker-compose file. 
#5th line removes /tmp/* to keep image small.
#6th line moves custom setting.json to config folder.  
RUN apk --no-cache add transmission-cli transmission-daemon cifs-utils && \ 
    mkdir -p /transmission/config && \
    chmod -R 1777 /transmission && \
    mkdir -p /mnt/transmission &&\
    rm -rf /tmp/* && \
    mv settings.json /transmission/config

#This expose 9091 the default transmission port
EXPOSE 9091
EXPOSE 443

#This starts transmission in the foregrond and makes the config path /transmission/config
CMD ["sh", "/etc/start_transmission.sh"]
