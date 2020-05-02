## Starting logstash 

Starting logstash input jdbc

```bash
docker-compose up --build
```

Stoping all service

```bash
docker-compose down --rmi local
```

## Customize configuration

Customize configuration for logstash

- modify file `logstash.conf` in docker container

```yml
input {
    jdbc {
        jdbc_driver_library => "${LOGSTASH_JDBC_DRIVER_JAR_LOCATION}"
        jdbc_driver_class => "${LOGSTASH_JDBC_DRIVER}"
        jdbc_connection_string => "${LOGSTASH_JDBC_URL}"
        jdbc_user => "${LOGSTASH_JDBC_USERNAME}"
        jdbc_password => "${LOGSTASH_JDBC_PASSWORD}"
        schedule => "* * * * *"
        statement => "select ... from table_name"
    }
}

output {
    stdout { codec => json_lines }
}
```

Environtment example

- LOGSTASH_JDBC_DRIVER_JAR_LOCATION: `/usr/share/logstash/logstash-core/lib/jars/mysql-connector-java.jar`
- LOGSTASH_JDBC_DRIVER: `com.mysql.jdbc.Driver`
- LOGSTASH_JDBC_URL: `jdbc:mysql://[host]:[port]/[database-name]`
- LOGSTASH_JDBC_USERNAME: `database_user`
- LOGSTASH_JDBC_PASSWORD: `database_user_password`