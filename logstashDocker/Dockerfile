FROM docker.elastic.co/logstash/logstash:5.4.0

# place our logstash pipeline configuration
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD logstash.conf /usr/share/logstash/pipeline/
