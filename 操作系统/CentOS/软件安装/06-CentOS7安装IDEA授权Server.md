# CentOS7 安装 IDEA License Server

## 软件安装

1.  创建ideaActivation文件夹<br>

    ```命令
    > sudo mkdir -p /usr/ideaActivation
    ```

2.  FTP上传IntelliJIDEALicenseServer_linux_amd64<br>

3.  设置文件执行权限<br>

    ```命令
    > sudo chmod +x /usr/ideaActivation/IntelliJIDEALicenseServer_linux_amd64
    ```

4.  编写启动脚本并设置文件执行权限<br>

    ```命令
    > sudo vim /usr/ideaActivation/start.sh
    ```

    ```内容
    #! /bin/bash
    /usr/ideaActivation/IntelliJIDEALicenseServer_linux_amd64 > /usr/ideaActivation/run.log &
    ```

    ```命令
    > sudo chmod +x /usr/ideaActivation/start.sh
    ```

5.  增加自启动功能并设置执行权限<br>

    ```命令
    > sudo vim /etc/rc.d/rc.local
    ```

    ```内容
    bash /usr/ideaActivation/start.sh
    ```

    ```命令
    > sudo chmod +x /etc/rc.d/rc.local
    ```

6.  打开防火墙端口<br>
    a. 查看当前活动防火墙策略<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```

    b. 为防火墙策略增加允许端口1027<br>

    ```命令
    > sudo firewall-cmd --zone=public --add-port=1027/tcp --permanent
    ```

    c. 重启防火墙<br>

    ```命令
    > sudo firewall-cmd --reload
    ```

    d. 查看是否添加成功<br>

    ```命令
    > sudo firewall-cmd --zone=public --list-all
    ```
