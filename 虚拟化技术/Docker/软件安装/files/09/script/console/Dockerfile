FROM ubuntu:18.04

USER root

# install openjdk and wget
RUN apt-get update && apt-get install -y openjdk-8-jdk zip unzip

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ADD rocketmq-console-ng-1.0.0.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar" ]
