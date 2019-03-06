# kafka-minimal
[![CircleCI](https://circleci.com/gh/codacy/kafka-minimal.svg?style=svg)](https://circleci.com/gh/codacy/kafka-minimal)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/11f09c91c28644718046c41164e56b0d)](https://www.codacy.com/app/Codacy/kafka-minimal?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=codacy/kafka-minimal&amp;utm_campaign=Badge_Grade)
[![](https://images.microbadger.com/badges/image/codacy/kafka-minimal.svg)](https://microbadger.com/images/codacy/kafka-minimal "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/codacy/kafka-minimal.svg)](https://microbadger.com/images/codacy/kafka-minimal "Get your own version badge on microbadger.com")

A minimal docker image to run Apache Kafka for testing purposes

## Run

`docker run -it -p 2181:2181 -p 9092:9092 codacy/kafka-minimal`

If you want to set another host name for the `advertised.host.name` setting:

`docker run -it -p 2181:2181 -p 9092:9092 -e ADVERTISED_HOST=<other_hostname> codacy/kafka-minimal`
