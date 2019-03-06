#!/usr/bin/env bash

# the piping to sed prefixes the logs with the corresponding application name

run-zookeeper() {
    bin/zookeeper-server-start.sh config/zookeeper.properties | sed "s/^/[zookeeper] /"
}

wait-zookeeper() {
    while ! nc -z localhost 2181; do
        echo "Waiting for zookeeper"
        sleep 0.1
    done
}

run-kafka() {
    bin/kafka-server-start.sh config/server.properties | sed "s/^/[kafka-broker] /"
}

# run both in parallel but wait for zookeeper to startup
{ run-zookeeper & (wait-zookeeper && run-kafka) ; }
