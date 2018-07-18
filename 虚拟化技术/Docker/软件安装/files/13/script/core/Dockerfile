FROM ubuntu:18.04

USER root

# install curl,net-tools,openjdk-8-jdk,openssh-server,unzip,vim,wget
RUN apt-get update && \
    apt-get install -y curl net-tools openjdk-8-jdk openssh-server unzip vim wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install hadoop 2.7.6
ADD hadoop-2.7.6.tar.gz /usr/local

# install hive 2.3.3
ADD apache-hive-2.3.3-bin.tar.gz /usr/local

# set environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME /usr/local/hadoop
ENV HIVE_HOME /usr/local/hive
ENV HIVE_CONF_DIR /usr/local/hive/conf
ENV PATH /usr/local/hadoop/bin:/usr/local/hadoop/sbin:/usr/local/hive/bin:$PATH

COPY config/* /tmp/
COPY lib/* /tmp/

RUN cd /usr/local && ln -s ./hadoop-2.7.6 hadoop && \
    ln -s ./apache-hive-2.3.3-bin hive && \
    # ssh without key
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys &&\
    mkdir -p /run/sshd /var/run/sshd && \
    # mkdir
    mkdir -p ~/hdfs/namenode && \
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs && \
    mkdir -p ~/hive/warehouse && \
    mkdir -p ~/hive/tmp && \
    mkdir -p ~/hive/log && \
    # files copy
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
    mv /tmp/hive-site.xml $HIVE_CONF_DIR/hive-site.xml && \
    mv /tmp/init-hive.sh ~/init-hive.sh && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    mv /tmp/start-hive.sh ~/start-hive.sh && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    # jar copy
    mv /tmp/mysql-connector-java-5.1.46.jar $HIVE_HOME/lib && \
    # script permission
    chmod +x ~/start-hadoop.sh && \
    chmod +x ~/init-hive.sh && \
    chmod +x ~/start-hive.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh

# format namenode
WORKDIR $HADOOP_HOME

RUN bin/hdfs namenode -format

WORKDIR $HIVE_HOME

EXPOSE 22 50070 9000 8088 9083 10000 10002

CMD ["/usr/sbin/sshd", "-D"]
