FROM centos:8
RUN yum install java wget -y
RUN wget https://downloads.apache.org/kafka/2.8.0/kafka_2.13-2.8.0.tgz \
  && tar -zxvf kafka_2.13-2.8.0.tgz \
  && mv kafka_2.13-2.8.0 /usr/local/kafka \
  && rm -rf kafka_2.13-2.8.0.tgz
WORKDIR /usr/local/kafka
CMD bin/kafka-server-start.sh config/server.properties
