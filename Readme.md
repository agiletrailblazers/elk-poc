# Overview
This repository contains a proof-of-concept of the ELK Stack.  
- **E**lasticsearch
- **L**ogstash
- **K**ibana

# Instructions
1. Download and [Install Docker](https://docs.docker.com/engine/installation/).
2. Clone this repository.
3. Execute the following command to launch the elk-poc stack.
```
docker-compose up
```
4. Browse to http://localhost to bring up the main Apache page.  You will see the apache log entries forwarded to the Logstash server and logged to stdout.
5. `Ctrl-c` to shutdown the elk-poc stack.
