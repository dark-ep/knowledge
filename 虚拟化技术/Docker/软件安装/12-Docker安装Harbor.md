# Docker 安装 Harbor1.7.5

## 软件安装

1.  Docker获取最新版Harbor<br>

    > ![info][info] [Harbor最新版地址][Harbor地址]

2.  创建Harbor宿主目录<br>

    ```命令
    > mkdir -p /home/docker/harbor
    ```

3.  安装Harbor<br>
    a. 下载Harbor<br>

    ![第3步-a](images/12_3_a_1.png)<br>
    
    ```命令
    > cd /home/docker/harbor
    > wget https://storage.googleapis.com/harbor-releases/release-1.7.0/harbor-online-installer-v1.7.5.tgz --no-check-certificate
    ```

    b. 解压缩<br>
    
    ```命令
    > tar -xzvf harbor-online-installer-v1.7.5.tgz
    ```

    c. 修改配置文件<br>

    ```命令
    > vim /home/docker/harbor/harbor/harbor.cfg 
    ```

    ![第3步-c](images/12_3_c_1.png)<br>

    d. 修改docker-compose的容器名称(防止重复都增加harbor-)<br>

    ```命令
    > vim /home/docker/harbor/harbor/docker-compose.yml
    ```

    ![第3步-d](images/12_3_d_1.png)<br>

    e. 执行安装脚本<br>

    ```命令
    > cd /home/docker/harbor/harbor
    > sudo ./install.sh
    ```

4.  验证启动结果<br>
    
    > ![info][info] [http\://\<宿主机ip>/harbor](http://192.168.3.100/harbor/)<br>
    > 用户名密码：admin/Harbor12345

    ![第4步-1](images/12_4_1.png)<br>
    ![第4步-2](images/12_4_2.png)<br>   

5.  验证上传下载镜像<br>
    a. 登录授权<br>

    ```命令
    > docker login 127.0.0.1
    ```

    ![第5步-a](images/12_5_a_1.png)<br>

    b. 镜像打包<br>

    ```命令
    > docker tag redis:latest 127.0.0.1/library/redis:latest
    ```

    ![第5步-b](images/12_5_b_1.png)<br>

    c. 上传镜像(需要Harbor上有对应的项目)<br>

    ```命令
    > docker push 127.0.0.1/library/redis:latest
    ```

    ![第5步-c-1](images/12_5_c_1.png)<br>
    ![第5步-c-2](images/12_5_c_2.png)<br>
    ![第5步-c-3](images/12_5_c_3.png)<br>

    d. 验证下载镜像<br>
 
    ```命令
    > docker rmi 127.0.0.1/library/redis:latest
    > docker pull 127.0.0.1/library/redis:latest
    ```

[Harbor地址]: https://github.com/goharbor/harbor/releases

[info]: /images/info.png
