# Docker 安装 Elasticsearch5.6.10

## 软件安装

1.  Docker获取最新版Elasticsearch<br>

    ```命令
    > docker pull elasticsearch
    ```

    > ![info][info] [elasticsearch说明地址][elasticsearch地址]<br>
    > Elasticsearch从6.x.x开始迁移到[www.docker.elastic.co](https://www.docker.elastic.co/)

2.  Docker运行Elasticsearch<br>
    a. 拷贝运行脚本到特定目录<br>

    > [start-container.sh](files/12/start-container.sh) -> /home/docker/es/<br>

    b. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/es/*.sh
    ```

    c. 运行Elasticsearch<br>

    ```命令
    > cd /home/docker/es/
    > ./start-container.sh
    ```

3. 打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许端口<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-port=9200/tcp --add-port=9300/tcp --permanent
    ```

    c. 重启防火墙<br>

    ```命令
    > sudo firewall-cmd --reload
    ```

    d. 查看是否添加成功<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

[elasticsearch地址]: https://hub.docker.com/_/elasticsearch/
[info]: /images/info.png
