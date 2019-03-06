#!/usr/bin/env sh

# piping to sed prefixes the logs with the corresponding application name

run_zookeeper() {
    bin/zookeeper-server-start.sh config/zookeeper.properties | sed "s/^/[zookeeper] /"
}

wait_zookeeper() {
    while ! nc -z localhost 2181; do
        echo "Waiting for zookeeper"
        sleep 0.1
    done
}

run_kafka() {
    echo -e "\nadvertised.host.name=${ADVERTISED_HOST:-localhost}" >> config/server.properties
    bin/kafka-server-start.sh config/server.properties | sed "s/^/[kafka-broker] /"
}

# run both in parallel but wait for zookeeper to startup
{ run_zookeeper & (wait_zookeeper && run_kafka) ; }
