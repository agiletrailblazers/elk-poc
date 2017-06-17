# Overview
This repository contains a proof-of-concept of the Elastic Stack (formerly ELK Stack).  
- **E**lasticsearch
- **L**ogstash
- **K**ibana
- Beats

# Instructions
1. [Download, Install and Run Docker](https://docs.docker.com/engine/installation/) using the instructions appropriate to your operating system.
2. Open a console window
3. Clone this repository
```bash
git clone https://github.com/agiletrailblazers/elk-poc.git
cd elk-poc
```
4. Create the docker container containing Apache and Filebeat
```bash
cd filebeatApacheDocker
docker build -t elk-poc-filebeat-apache . 
```
5. Create the docker container containing Logstash
```bash
cd ../logstashDocker
docker build -t elk-poc-logstash . 
```
6. Create the docker container containing Elasticsearch
```bash
cd ../elasticsearchDocker
docker build -t elk-poc-elasticsearch . 
```
7. Create the docker container containing Kibana
```bash
cd ../kibanaDocker
docker build -t elk-poc-kibana . 
```
8. Start the elk-poc stack
```bash
cd ..
docker-compose up
```
9. Browse to http://localhost, this will display the default Apache welcome page.  The entries from the Apache access log will be automatically forwarded to the Logstash server for indexing, they will also be written to standard output so they appear in the console window.
10. You can search Logstash directly via its REST API.  Browse to http://localhost:9200/elk-poc/_search?q=source:access.log.  This search will return all of the records that were sourced from the Apache access log. Note: by default, only 10 records will be returned, the search behavior is controlled via additional parameters to the search API.
11. You can search Logstash visually, using Kibana. Browse to http://localhost:5601 and search the _elk-poc_ index.  You will be prompted to login, use the default credentials, username: _elastic_, password: _changeme_. To see the same search results as the direct Logstash query, search for "source=access.log" using the search field. 
12. To shutdown the elk-poc stack, type the `Ctrl-c` key sequence in the console window.
