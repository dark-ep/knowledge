# Docker 安装 Hadoop2.7.6 集群

## 软件安装

1.  Docker获取最新版Ubuntu<br>

    ```命令
    > docker pull ubuntu:18.04
    ```

    > ![info][info] [ubuntu说明地址][ubuntu地址]

2.  创建Hadoop宿主目录(Dockerfile脚本及配置)<br>

    ```命令
    > mkdir -p /home/docker/hadoop/config /home/docker/hadoop/script/core/config
    ```

3.  编写Dockerfile创建Hadoop镜像脚本<br>
    a. 创建Dockerfile文件<br>

    ```命令
    > touch /home/docker/hadoop/script/core/Dockerfile
    ```

    b. 编写Docker构建内容<br>

    > ![info][info] [Dockerfile](files/07/script/core/Dockerfile)脚本说明<br>
    > 1.依赖ubuntu:18.04<br>
    > 2.使用root用户<br>
    > 3.安装必要工具(ssh及jdk8)<br>
    > 4.从宿主机器拷贝hadoop-2.7.6.tar.gz(需要在编译前提前准备好文件)并自动解压，同时做关联操作<br>
    > 5.设置环境变量<br>
    > 6.从宿主机器拷贝预设好的必要配置到特定目录<br>
    > 7.设置无秘登录<br>
    > 8.移动配置到hadoop的配置目录中<br>
    > 9.设置启动shell脚本执行权限<br>
    > 10.设置工作目录为hadoop的根目录<br>
    > 11.设置hadoop的namenode<br>
    > 12.导出需要使用的的端口<br>
    > 13.启动后预初始化执行启动ssh<br>

4.  补充Dockerfile编译脚本相关文件及使用配置<br>
    a. 下载hadoop-2.7.6.tar.gz<br>

    > [hadoop-2.7.6下载地址](http://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-2.7.6/hadoop-2.7.6.tar.gz)

    b. 拷贝文件到特定目录<br>

    > [script/core/build-image.sh](files/07/script/core/build-image.sh) -> /home/docker/hadoop/script/core/<br>
    > [script/core/config/core-site.xml](files/07/script/core/config/core-site.xml) -> /home/docker/hadoop/script/core/config/<br>
    > [script/core/config/hadoop-env.sh](files/07/script/core/config/hadoop-env.sh) -> /home/docker/hadoop/script/core/config/<br>
    > [script/core/config/hdfs-site.xml](files/07/script/core/config/hdfs-site.xml) -> /home/docker/hadoop/script/core/config/<br>
    > [script/core/config/mapred-site.xml](files/07/script/core/config/mapred-site.xml) -> /home/docker/hadoop/script/core/config/<br>
    > [script/core/config/ssh_config](files/07/script/core/config/ssh_config) -> /home/docker/hadoop/script/core/config/<br>
    > [script/core/config/start-hadoop.sh](files/07/script/core/config/start-hadoop.sh) -> /home/docker/hadoop/script/core/config/<br>
    > [script/core/config/yarn-site.xml](files/07/script/core/config/yarn-site.xml) -> /home/docker/hadoop/script/core/config/<br>

    c. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/hadoop/*.sh
    ```

5.  依赖Dockerfile构建镜像<br>
    a. 执行构建脚本<br>

    ```命令
    > cd /home/docker/hadoop/script/core/
    > ./build-image.sh
    ```

    b. 验证构建结果<br>

    ```命令
    > docker images
    ```

    ![第5步-b](images/07_5_b_1.png)<br>

6.  Hadoop环境准备<br>
    a. 创建hadoop专属docker网络环境<br>

    ```命令
    > docker network create --driver=bridge bigdata-net
    ```

    b. 验证docker网络环境创建结果<br>

    ```命令
    > docker network ls
    ```

    ![第6步-b](images/07_6_b_1.png)<br>

7.  运行Hadoop单机模式<br>
    a. 拷贝文件到特定目录<br>

    > [script/dc-hadoop-standalone.yml](files/07/script/dc-hadoop-standalone.yml) -> /home/docker/hadoop/script/<br>
    > [start-container-standalone.sh](files/07/start-container-standalone.sh) -> /home/docker/hadoop/<br>

    b. 执行启动脚本<br>

    ```命令
    > cd /home/docker/hadoop/
    > ./start-container-standalone.sh
    ```

    ![第7步-b-1](images/07_7_b_1.png)<br>
    
    > ![info][info] 容器启动成功后会自动进入hadoop-master容器
    
    ```命令
    > cd ~
    > ./start-hadoop.sh
    ```
    
    ![第7步-b-2](images/07_7_b_2.png)<br>

    c. 验证是否启动成功

    ```命令
    > jps
    ```

    ![第7步-c-1](images/07_7_c_1.png)<br>

    > [访问Name Node页面:\[Your IP Address\]:50070/](http://ep.cn:50070)<br>
    > [访问Resource Manager页面:\[Your IP Address\]:8088/](http://ep.cn:8088)<br>

    ![第7步-c-2](images/07_7_c_2.png)<br>
    ![第7步-c-3](images/07_7_c_3.png)<br>

8.  运行Hadoop集群模式<br>
    a. 拷贝文件到特定目录<br>

    > [script/dc-hadoop-cluster.yml](files/07/script/dc-hadoop-cluster.yml) -> /home/docker/hadoop/script/<br>
    > [start-container-cluster.sh](files/07/start-container-cluster.sh) -> /home/docker/hadoop/<br>

    b. 执行启动脚本<br>

    ```命令
    > cd /home/docker/hadoop/
    > ./start-container-cluster.sh 3
    ```

    ![第8步-b-1](images/07_8_b_1.png)<br>

    > ![info][info] 容器启动成功后会自动进入hadoop-master容器

    ```命令
    > cd ~
    > ./start-hadoop.sh
    ```

    ![第8步-b-2](images/07_8_b_2.png)<br>

    c. 验证是否启动成功

    ```命令
    > jps
    ```

    ![第8步-c-1](images/07_8_c_1.png)<br>
    ![第8步-c-2](images/07_8_c_2.png)<br>
    ![第8步-c-3](images/07_8_c_3.png)<br>

    > [访问Name Node页面:\[Your IP Address\]:50070/](http://ep.cn:50070)<br>
    > [访问Resource Manager页面:\[Your IP Address\]:8088/](http://ep.cn:8088)<br>

    ![第8步-c-4](images/07_8_c_4.png)<br>
    ![第8步-c-5](images/07_8_c_5.png)<br>

9.  打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许端口<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-port=50070/tcp --add-port=9000/tcp --add-port=8088/tcp --permanent
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
