# kafka-docker
```
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
