# Docker 安装 Nginx

## 软件安装

1.  Docker获取最新版Nginx<br>

    ```命令
    > docker pull nginx
    ```

    > ![info][info] [nginx说明地址][nginx地址]

2.  创建Nginx宿主目录(配置etc/静态文件content)<br>

    ```命令
    > mkdir -p /home/docker/nginx/content
    > mkdir -p /home/docker/nginx/etc/conf.d
    ```

3.  Docker启动默认Nginx<br>

    ```命令
    > docker run --name nginx -d nginx
    ```

4.  Docker拷贝默认Nginx文件到宿主目录<br>

    ```命令
    > docker cp nginx:/etc/nginx/nginx.conf /home/docker/nginx/etc
    > docker cp nginx:/etc/nginx/conf.d/default.conf /home/docker/nginx/etc/conf.d
    > docker cp nginx:/usr/share/nginx/html/index.html /home/docker/nginx/content
    > docker cp nginx:/usr/share/nginx/html/50x.html /home/docker/nginx/content
    ```

5.  Docker运行Nginx<br>
    a. 拷贝运行脚本到特定目录<br>

    > [start-container.sh](files/01/start-container.sh) -> /home/docker/nginx/<br>

    b. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/nginx/*.sh
    ```

    c. 运行Nginx<br>

    ```命令
    > cd /home/docker/nginx/
    > ./start-container.sh
    ```

6.  打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许服务<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-service=http --permanent
    ```

    c. 重启防火墙<br>

    ```命令
    > sudo firewall-cmd --reload
    ```

    d. 查看是否添加成功<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    > ![info][info] 该操作会开放HTTP的80端口

[info]: /images/info.png

[nginx地址]: https://hub.docker.com/_/nginx/
