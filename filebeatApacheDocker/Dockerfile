# Ubuntu OS
FROM ubuntu:16.04

# install Apache web server
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    apt-get update -y && \
    apt-get clean

# Make port 80 available to the world outside this container
EXPOSE 80

#VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
