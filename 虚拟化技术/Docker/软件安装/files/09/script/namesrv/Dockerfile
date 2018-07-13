FROM ubuntu:18.04

USER root

# install curl,net-tools,openjdk-8-jdk,openssh-server,unzip,vim,wget
RUN apt-get update && \
    apt-get install -y curl net-tools openjdk-8-jdk openssh-server unzip vim wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV ROCKETMQ_HOME /opt/rocketmq
ENV PATH /opt/rocketmq/bin:$PATH
ENV MEMORY_CONF "-Xms256m -Xmx512m -Xmn256m"

# install rocketmq
RUN mkdir -p $ROCKETMQ_HOME /opt/logs /opt/store
COPY rocketmq-all-4.2.0-bin-release.zip $ROCKETMQ_HOME
RUN cd $ROCKETMQ_HOME && \
    unzip rocketmq-all-4.2.0-bin-release.zip && \
    rm rocketmq-all-4.2.0-bin-release.zip && \
    sed -i 's/-Xms4g -Xmx4g -Xmn2g/${MEMORY_CONF}/g' bin/runserver.sh && \
    export JAVA_OPT=" -Duser.home=/opt" && \
    chmod +x bin/mqnamesrv

EXPOSE 9876

VOLUME /opt/logs /opt/store

WORKDIR $ROCKETMQ_HOME

CMD ["bin/mqnamesrv"]
