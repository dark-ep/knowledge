# Docker 安装 ActiveMQ5.15.4

## 软件安装

1.  Docker获取最新版ActiveMQ<br>

    ```命令
    > docker pull rmohr/activemq:5.15.4
    ```

    > ![info][info] [rmohr/activemq说明地址][rmohr/activemq地址]

2.  Docker运行ActiveMQ<br>
    a. 拷贝运行脚本到特定目录<br>

    > [start-container.sh](files/14/start-container.sh) -> /home/docker/activemq/<br>

    b. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/activemq/*.sh
    ```

    c. 运行ActiveMQ<br>

    ```命令
    > cd /home/docker/activemq/
    > ./start-container.sh
    ```

    d. 验证是否启动成功<br>

    > [访问Manager页面:\[Your IP Address\]:8161/](http://ep.cn:8161)<br>
    > 用户名:admin 密码：admin<br>

    ![第2步-d-1](images/14_2_d_1.png)<br>
    ![第2步-d-2](images/14_2_d_2.png)<br>
    ![第2步-d-3](images/14_2_d_3.png)<br>

3.  打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许服务<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-port=61616/tcp --add-port=8161/tcp --permanent
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

[rmohr/activemq地址]: https://hub.docker.com/r/rmohr/activemq/
