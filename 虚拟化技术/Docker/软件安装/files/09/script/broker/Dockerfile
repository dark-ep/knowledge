FROM ubuntu:18.04

USER root

# install openjdk and wget
RUN apt-get update && apt-get install -y openjdk-8-jdk zip unzip

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV ROCKETMQ_HOME=/opt/rocketmq
ENV MEMORY_CONF "-Xms256m -Xmx512m -Xmn256m"

# install rocketmq
RUN mkdir -p ${ROCKETMQ_HOME} /opt/logs /opt/store
COPY rocketmq-all-4.2.0-bin-release.zip ${ROCKETMQ_HOME}
RUN cd ${ROCKETMQ_HOME} && \
    unzip rocketmq-all-4.2.0-bin-release.zip && \
    rm rocketmq-all-4.2.0-bin-release.zip && \
    sed -i 's/-Xms8g -Xmx8g -Xmn4g/${MEMORY_CONF}/g' bin/runbroker.sh && \
    chmod +x bin/mqbroker

EXPOSE 10909 10911

VOLUME /opt/logs /opt/store

CMD cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT=" -Duser.home=/opt" && sh mqbroker -c ${ROCKETMQ_HOME}/conf/broker.properties
