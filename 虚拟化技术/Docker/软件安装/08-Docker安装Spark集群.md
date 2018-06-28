# Docker 安装 Spark2.3.1 集群

## 软件安装

1.  Docker获取最新版Ubuntu<br>

    ```命令
    > docker pull ubuntu:18.04
    ```

    > ![info][info] [ubuntu说明地址][ubuntu地址]

2.  创建Spark宿主目录(Dockerfile脚本及配置)<br>

    ```命令
    > mkdir -p /home/docker/spark
    ```
    
3.  编写Dockerfile创建Hadoop镜像脚本<br>
    a. 创建Dockerfile文件<br>

    ```命令
    > touch /home/docker/spark/Dockerfile
    ```

    b. 编写Docker构建内容<br>

    > ![info][info] [Dockerfile](files/08/Dockerfile)脚本说明<br>
    > 1.依赖ubuntu:18.04<br>
    > 2.使用root用户<br>
    > 3.安装必要工具(ssh及jdk8)<br>
    > 4.从宿主机器拷贝hadoop-2.7.6.tar.gz(需要在编译前提前准备好文件)并自动解压，同时做关联操作<br>
    > 5.从宿主机器拷贝spark-2.3.1-bin-hadoop2.7.tgz(需要在编译前提前准备好文件)并自动解压，同时做关联操作<br>
    > 6.从宿主机器拷贝scala-2.12.6.tgz(需要在编译前提前准备好文件)并自动解压，同时做关联操作<br>
    > 7.设置环境变量<br>
    > 8.设置无秘登录<br>
    > 9.从宿主机器拷贝配置预设好的必要配置到特定目录(slaves文件要提前修改好)<br>
    > 10.设置启动shell脚本执行权限<br>
    > 11.设置hadoop的namenode<br>
    > 12.启动后预初始化执行启动ssh<br>

4.  补充Dockerfile编译脚本相关文件及使用配置<br>
    a. 下载hadoop-2.7.6.tar.gz<br>

    > [hadoop-2.7.6下载地址](http://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-2.7.6/hadoop-2.7.6.tar.gz)
    
    b. 下载spark-2.3.1-bin-hadoop2.7.tgz<br>

    > [spark-2.3.1下载地址](https://www.apache.org/dyn/closer.lua/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz)

    c. 下载scala-2.12.6.tgz<br>

    > [scale-2.12.6下载地址](https://downloads.lightbend.com/scala/2.12.6/scala-2.12.6.tgz)

    d. 拷贝文件到特定目录<br>

    > [build-image.sh](files/08/build-image.sh) -> /home/docker/spark/<br>
    > [start-container.sh](files/08/start-container.sh) -> /home/docker/spark/<br>
    > [config/core-site.xml](files/08/config/core-site.xml) -> /home/docker/spark/config/<br>
    > [config/hadoop-env.sh](files/08/config/hadoop-env.sh) -> /home/docker/spark/config/<br>
    > [config/hdfs-site.xml](files/08/config/hdfs-site.xml) -> /home/docker/spark/config/<br>
    > [config/mapred-site.xml](files/08/config/mapred-site.xml) -> /home/docker/spark/config/<br>
    > [config/slaves](files/08/config/slaves) -> /home/docker/spark/config/<br>
    > [config/start-spark.sh](files/08/config/start-spark.sh) -> /home/docker/spark/config/<br>
    > [config/ssh_config](files/08/config/ssh_config) -> /home/docker/spark/config/<br>
    > [config/start-spark.sh](files/08/config/start-spark.sh) -> /home/docker/spark/config/<br>
    > [config/yarn-site.xml](files/08/config/yarn-site.xml) -> /home/docker/spark/config/<br>

    e. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/spark/*.sh
    ```

5.  依赖Dockerfile构建镜像<br>
    a. 执行构建脚本<br>

    ```命令
    > cd /home/docker/spark
    > ./build-image.sh
    ```

    b. 验证构建结果<br>

    ```命令
    > docker images
    ```

    ![第5步-b](images/08_5_b_1.png)<br>

6.  运行Spark集群<br>
    a. 创建spark专属docker网络环境<br>

    ```命令
    > docker network create --driver=bridge spark
    ```

    b. 验证docker网络环境创建结果<br>

    ```命令
    > docker network ls
    ```

    ![第6步-b](images/08_6_b_1.png)<br>

    c. 运行hadoop集群<br>

    ```命令
    > cd /home/docker/spark/
    > ./start-container.sh
    ```

    ![第6步-c-1](images/08_6_c_1.png)<br>

    > ![info][info] 容器启动成功后会自动进入spark-master容器

    ```命令
    > cd ~
    > ./start-spark.sh
    ```

    ![第6步-c-2](images/08_6_c_2.png)<br>

    d. 验证是否启动成功

    ```命令
    > docker exec -it spark-master bash
    > docker exec -it spark-slave1 bash
    > docker exec -it spark-slave2 bash
    ```

    ![第6步-d-1](images/08_6_d_1.png)<br>
    ![第6步-d-2](images/08_6_d_2.png)<br>
    ![第6步-d-3](images/08_6_d_3.png)<br>

    > [访问Name Node页面:\[Your IP Address\]:50070/](http://ep.cn:50070)<br>
    > [访问Resource Manager页面:\[Your IP Address\]:8088/](http://ep.cn:8088)<br>
    > [访问Spark Info页面:\[Your IP Address\]:8080/](http://ep.cn:8080)<br>

    ![第6步-d-4](images/08_6_d_4.png)<br>
    ![第6步-d-5](images/08_6_d_5.png)<br>
    ![第6步-d-6](images/08_6_d_6.png)<br>
    
    > 在spark-master容器中执行spark-shell,可用scala语言进行任务操作<br>
    > 可用[访问Spark 任务页面:\[Your IP Address\]:4040/](http://ep.cn:4040)查看任务信息
    
    ![第6步-d-7](images/08_6_d_7.png)<br>
    ![第6步-d-8](images/08_6_d_8.png)<br>

7.  打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许端口<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-port=50070/tcp --add-port=9000/tcp --add-port=8088/tcp --add-port=7077/tcp --add-port=8080/tcp --add-port=4040/tcp --permanent
    ```

    c. 重启防火墙<br>

    ```命令
    > sudo firewall-cmd --reload
    ```

    d. 查看是否添加成功<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

[info]: /images/info.png

[ubuntu地址]: https://hub.docker.com/_/ubuntu/