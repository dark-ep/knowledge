FROM ubuntu:18.04

USER root

# install curl,net-tools,openjdk-8-jdk,openssh-server,unzip,vim,wget
RUN apt-get update && \
    apt-get install -y curl net-tools openjdk-8-jdk openssh-server unzip vim wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# set encoding
ENV LANG C.UTF-8

ADD rocketmq-console-ng-1.0.0.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar" ]
