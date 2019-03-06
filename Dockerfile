FROM alpine

ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 2.1.0

RUN apk add --no-cache wget
RUN wget -q "http://mirrors.up.pt/pub/apache/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" -O "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
RUN tar -xzf "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" -C "/tmp"

# Kafka and Zookeeper
FROM java:openjdk-8-jre-alpine

ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 2.1.0
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

RUN apk add --no-cache bash

COPY --from=0 "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}" "/opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}"

COPY scripts/run.sh $KAFKA_HOME/run.sh

WORKDIR $KAFKA_HOME

# 2181 is zookeeper, 9092 is kafka
EXPOSE 2181 9092

ENTRYPOINT ["./run.sh"]
