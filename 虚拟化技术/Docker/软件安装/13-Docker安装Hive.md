# Docker 安装 Hive2.3.3

## 软件安装

1.  Docker获取最新版Ubuntu<br>

    ```命令
    > docker pull ubuntu:18.04
    ```

    > ![info][info] [ubuntu说明地址][ubuntu地址]

2.  创建Hive宿主目录(Dockerfile脚本及配置)<br>

    ```命令
    > mkdir -p /home/docker/hive/config /home/docker/hive/script/core/config /home/docker/hive/script/core/lib
    ```

3.  编写Dockerfile创建Hive镜像脚本<br>
    a. 创建Dockerfile文件<br>

    ```命令
    > touch /home/docker/hive/script/core/Dockerfile
    ```

    b. 编写Docker构建内容<br>

    > ![info][info] [Dockerfile](files/13/script/core/Dockerfile)脚本说明<br>
    > 1.依赖ubuntu:18.04<br>
    > 2.使用root用户<br>
    > 3.安装必要工具(ssh及jdk8)<br>
    > 4.从宿主机器拷贝hadoop-2.7.6.tar.gz(需要在编译前提前准备好文件)并自动解压，同时做关联操作<br>
    > 5.从宿主机器拷贝apache-hive-2.3.3-bin.tar.gz(需要在编译前提前准备好文件)并自动解压，同时做关联操作<br>
    > 6.设置环境变量<br>
    > 7.从宿主机器拷贝预设好的必要配置到特定目录<br>
    > 8.设置无秘登录<br>
    > 9.移动配置到hadoop的配置目录中<br>
    > 10.设置启动shell脚本执行权限<br>
    > 11.设置工作目录为hadoop的根目录<br>
    > 12.设置hadoop的namenode<br>
    > 13.设置工作目录为hive的根目录<br>
    > 14.导出需要使用的的端口<br>
    > 15.启动后预初始化执行启动ssh<br>

4.  补充Dockerfile编译脚本相关文件及使用配置<br>
    a. 下载hadoop-2.7.6.tar.gz<br>

    > [hadoop-2.7.6下载地址](http://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-2.7.6/hadoop-2.7.6.tar.gz)

    b. 下载apache-hive-2.3.3-bin.tar.gz<br>

    > [apache-hive-2.3.3-bin.tar.gz下载地址](http://www.apache.org/dyn/closer.cgi/hive/)

    c. 拷贝文件到特定目录<br>

    > [script/core/build-image.sh](files/13/script/core/build-image.sh) -> /home/docker/hive/script/core/<br>
    > [script/core/config/core-site.xml](files/13/script/core/config/core-site.xml) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/hadoop-env.sh](files/13/script/core/config/hadoop-env.sh) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/hdfs-site.xml](files/13/script/core/config/hdfs-site.xml) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/hive-site.xml](files/13/script/core/config/hive-site.xml) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/init-hive.sh](files/13/script/core/config/init-hive.sh) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/mapred-site.xml](files/13/script/core/config/mapred-site.xml) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/ssh_config](files/13/script/core/config/ssh_config) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/start-hadoop.sh](files/13/script/core/config/start-hadoop.sh) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/start-hive.sh](files/13/script/core/config/start-hive.sh) -> /home/docker/hive/script/core/config/<br>
    > [script/core/config/yarn-site.xml](files/13/script/core/config/yarn-site.xml) -> /home/docker/hive/script/core/config/<br>

    d. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/hive/script/core/*.sh
    ```

5.  依赖Dockerfile构建镜像<br>
    a. 执行构建脚本<br>

    ```命令
    > cd /home/docker/hive/script/core/
    > ./build-image.sh
    ```

    b. 验证构建结果<br>

    ```命令
    > docker images
    ```

    ![第5步-b](images/13_5_b_1.png)<br>

6.  Hive环境准备<br>
    a. 创建hive专属docker网络环境<br>

    ```命令
    > docker network create --driver=bridge bigdata-net
    ```

    b. 验证docker网络环境创建结果<br>

    ```命令
    > docker network ls
    ```

    ![第6步-b](images/13_6_b_1.png)<br>

7.  运行Hive单机模式<br>
    a. 拷贝文件到特定目录<br>

    > [script/dc-hive-standalone.yml](files/13/script/dc-hive-standalone.yml) -> /home/docker/hive/script/<br>
    > [start-container-standalone.sh](files/13/start-container-standalone.sh) -> /home/docker/hive/<br>

    b. 执行启动脚本<br>

    ```命令
    > chmod +x /home/docker/hive/*.sh
    > cd /home/docker/hive/
    > ./start-container-standalone.sh
    ```

    ![第7步-b-1](images/13_7_b_1.png)<br>

    > ![info][info] 容器启动成功后会自动进入hive-master容器<br>

    ```命令
    > cd ~
    > ./start-hadoop.sh
    ```

    ![第7步-b-2](images/13_7_b_2.png)<br>

    ```命令
    > ./init-hive.sh
    ```

    ![第7步-b-3](images/13_7_b_3.png)<br>

    ```命令
    > ./start-hive.sh
    ```

    c. 验证是否启动成功<br>

    ```命令
    > jps
    ```

    ![第7步-c-1](images/13_7_c_1.png)<br>

    > [访问Name Node页面:\[Your IP Address\]:50070/](http://ep.cn:50070)<br>
    > [访问Resource Manager页面:\[Your IP Address\]:8088/](http://ep.cn:8088)<br>

    ![第7步-c-2](images/13_7_c_2.png)<br>
    ![第7步-c-3](images/13_7_c_3.png)<br>

    > [访问Hive页面:\[Your IP Address\]:10002/](http://ep.cn:10002)<br>

    ![第7步-c-3](images/13_7_c_4.png)<br>

8.  打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许端口<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-port=50070/tcp --add-port=9000/tcp --add-port=8088/tcp --add-port=10000/tcp --add-port=10002/tcp --permanent
    ```

    c. 重启防火墙<br>

    ```命令
    > sudo firewall-cmd --reload
    ```

    d. 查看是否添加成功<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

9.  Beeline进行操作<br>
    a. 前置条件<br>

    > 1. 启动hiveserver2服务（端口默认设置为10000）<br>
    > 2. 设置可以被任意人使用（hadoop的core-site.xml，需要重启hdfs）<br>
    > 3. 准备测试数据student.txt放到root目录下：[data/student.txt](files/13/script/core/data/student.txt) -> /root/<br>

    ![第9步-a-1](images/13_9_a_1.png)<br>
    ![第9步-a-2](images/13_9_a_2.png)<br>

    b. 链接hiveserver2<br>

    ```命令
    > $HIVE_HOME/bin/beeline -u jdbc:hive2://127.0.0.1:10000
    ```

    ![第9步-b-1](images/13_9_b_1.png)<br>

    c. 操作hive<br>

    ```命令
    > create database test;
    > show databases;
    > use test;
    > create table student(id int, name string, sex string, age int, department string) row format delimited fields terminated by "," lines terminated by "\n";
    > load data local inpath "/root/student.txt" into table student;
    > select * from student;
    ```

    ![第9步-c-1](images/13_9_c_1.png)<br>
    ![第9步-c-2](images/13_9_c_2.png)<br>

[info]: /images/info.png

[ubuntu地址]: https://hub.docker.com/_/ubuntu/
