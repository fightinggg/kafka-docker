# kafka-docker
## step 1. launch zookeeper in background
```sh
docker run -d \
-p 2181:2181 \
--name zookeeper \
-m 100M --memory-swap 100M --cpus 0.1 \
zookeeper
```

## step 2. launch kafka
```sh
docker run -it --rm \
--link zookeeper:zookeeper \
--name=kafka \
-p 9092:9092 \
-m 200M --memory-swap=1024M \
1144560553/kafka:test \
bin/kafka-server-start.sh config/server.properties \
--override zookeeper.connect=zookeeper:2181 \
--override listeners=PLAINTEXT://0.0.0.0:9092 \
--override advertised.listeners=PLAINTEXT://localhost:9092
```

## step 3. enjoy
open a new term
```sh
docker exec -it kafka bash
# create a topic
bin/kafka-topics.sh --zookeeper zookeeper:2181 --create --replication-factor 1 --partitions 1 --topic mytopic
# create a producer
bin/kafka-console-producer.sh --topic mytopic --broker-list localhost:9092
```
open a new term again
```sh
docker exec -it kafka bash
# create a consumer
bin/kafka-console-consumer.sh --topic mytopic --bootstrap-server localhost:9092
```
