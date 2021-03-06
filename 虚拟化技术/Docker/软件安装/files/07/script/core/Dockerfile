FROM ubuntu:18.04

USER root

# install curl,net-tools,openjdk-8-jdk,openssh-server,unzip,vim,wget
RUN apt-get update && \
    apt-get install -y curl net-tools openjdk-8-jdk openssh-server unzip vim wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install hadoop 2.7.6
ADD hadoop-2.7.6.tar.gz /usr/local

# set environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH /usr/local/hadoop/bin:/usr/local/hadoop/sbin:$PATH

# set encoding
ENV LANG C.UTF-8

COPY config/* /tmp/

RUN cd /usr/local && ln -s ./hadoop-2.7.6 hadoop && \
    # ssh without key
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys &&\
    mkdir -p /run/sshd /var/run/sshd && \
    # mkdir
    mkdir -p ~/hdfs/namenode && \
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs && \
    # files copy
    mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \ 
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    # script permission
    chmod +x ~/start-hadoop.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh 

# format namenode
WORKDIR $HADOOP_HOME

RUN bin/hdfs namenode -format

EXPOSE 22 50070 9000 8088

CMD ["/usr/sbin/sshd", "-D"]
