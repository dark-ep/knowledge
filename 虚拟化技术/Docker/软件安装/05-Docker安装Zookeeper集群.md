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

3.  Docker创建归属Zookeeper使用的网络<br>

    ```命令
    > docker network create -d bridge zk-net
    ```

4.  Docker运行Zookeeper集群<br>
    a. 拷贝运行脚本到特定目录<br>

    > [start-container.sh](files/05/start-container.sh) -> /home/docker/zk/<br>
    > [script/dc-zk.yml](files/05/script/dc-zk.yml) -> /home/docker/zk/script/<br>

    b. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/zk/*.sh
    ```

    c. 运行Zookeeper集群<br>

    ```命令
    > cd /home/docker/zk/
    > ./start-container.sh
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
