# Docker 安装 Zookeeper 集群

## 软件安装

1.  Docker获取最新版Zookeeper<br>

    ```命令
    > docker pull zookeeper
    ```

    > ![info][info] [zookeeper说明地址][zookeeper地址]


2.  创建Zookeeper宿主目录(DockerCompose脚本)<br>

    ```命令
    > mkdir -p /home/docker/zk/script
    ```

3.  编写DockerCompose创建Zookeeper集群脚本<br>

    ```命令
    > vim /home/docker/zk/script/dc-zk.yml
    ```

    ```内容
    version: '3'

    services:
      zk1:
        image: zookeeper
        container_name: zk1
        restart: unless-stopped
        hostname: zk1
        ports:
          - 22181:2181
        environment:
          ZOO_MY_ID: 1
          ZOO_SERVERS: server.1=0.0.0.0:22888:23888 server.2=zk2:22888:23888 server.3=zk3:22888:23888

      zk2:
        image: zookeeper
        container_name: zk2
        restart: unless-stopped
        hostname: zk2
        ports:
          - 22182:2181
        environment:
          ZOO_MY_ID: 2
          ZOO_SERVERS: server.1=zk1:22888:23888 server.2=0.0.0.0:22888:23888 server.3=zk3:22888:23888

      zk3:
        image: zookeeper
        container_name: zk3
        restart: unless-stopped
        hostname: zk3
        ports:
          - 22183:2181
        environment:
          ZOO_MY_ID: 3
          ZOO_SERVERS: server.1=zk1:22888:23888 server.2=zk2:22888:23888 server.3=0.0.0.0:22888:23888
    ```

4.  运行DockerCompose脚本<br>


    ```命令
    > docker-compose -f /home/docker/zk/script/dc-zk.yml up -d
    ```

5.  打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>


    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许端口<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-port=22181/tcp --add-port=22182/tcp --add-port=22183/tcp --permanent
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

[zookeeper地址]: https://hub.docker.com/_/zookeeper/
