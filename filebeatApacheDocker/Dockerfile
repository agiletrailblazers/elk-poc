# Ubuntu OS
FROM ubuntu:16.04

# Java
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean

# Filebeat (from https://www.elastic.co/guide/en/beats/filebeat/current/setup-repositories.html)
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    apt-get install apt-transport-https && \
    echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-5.x.list && \
    apt-get update && apt-get install filebeat && \
    apt-get clean
RUN update-rc.d filebeat defaults

# place our filebeat configuration
COPY filebeat.yml /etc/filebeat/filebeat.yml

# Apache
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    apt-get update -y && \
    apt-get clean

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && \
    a2enconf fqdn

# Make port 80 available outside this container
EXPOSE 80

# copy the startup script
COPY ./startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# execute the startup script
ENTRYPOINT ["/usr/local/bin/startup.sh"]
