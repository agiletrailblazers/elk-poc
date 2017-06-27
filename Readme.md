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
9. Browse to http://localhost, this will display the default Apache welcome page.  The entries from the Apache access log will be automatically forwarded to the Logstash server, where the records will be parsed and sent to Elasticsearch for indexing, they will also be written to standard output so they appear in the console window.
10. You can search Elasticsearch directly via its REST API.  Browse to http://localhost:9200/elk-poc/_search?q=source:access.log.  This search will return all of the records that were sourced from the Apache access log. If you are prompted to login, use the default credentials, username: _elastic_, password: _changeme_. Note: by default, only 10 records will be returned, the search behavior is controlled via additional parameters to the search API.
11. You can search Elasticsearch visually, using Kibana. Browse to http://localhost:5601, when prompted to login, use the default credentials, username: _elastic_, password: _changeme_. You will land in the Management section, where you must configure an index pattern, this is where you will tell Kibana which Elasticsearch index to use, enter _elk-poc_ for the index name and then click the _Create_ button. Upon successful configuration, you will see all of the fields that are searchable in the _elk-poc_ index. To execute the same search as done previously using the Elasticsearch REST API, click on _Discover_ in the left-side navigation and enter "source=access.log" into the search field and click the search icon, the matching log entries will be displayed in the search results below along with a timeline of when the events occurred. 
12. To shutdown the elk-poc stack, press `Ctrl-c` in the console window.
