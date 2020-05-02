FROM logstash:7.6.2

# install dependency
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-aggregate
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-mutate

# copy lib database jdbc jars
COPY ./mysql-connector-java-8.0.20.jar /usr/share/logstash/logstash-core/lib/jars/mysql-connector-java.jar

