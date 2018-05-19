# 安装 CentOS7 操作系统

## 安装操作系统

1.  开机 -> 使用键盘的上下箭头按钮，选择“Install CentOS 7”选项 -> 按下回车键，开始安装 CentOS 7<br>
    ![第1步](images/01_1_1.png)<br>
2.  语言选择：English English(United States) -> 选择时区：Asia/Shanghai -> 软件选择：GNOME Desktop -> 安装位置：已选择自动分区 -> 网络和主机名：选择默认 -> 开始安装<br>
    ![第2步-1](images/01_2_1.png)<br>
    ![第2步-2](images/01_2_2.png)<br>
3.  设置root密码 -> 创建新用户 -> 重启<br>
    ![第3步-1](images/01_3_1.png)<br>
    ![第3步-2](images/01_3_2.png)<br>
    ![第3步-3](images/01_3_3.png)<br>

    > root密码：123456
    > 新用户：centos 密码：1qaz2wsx

4.  确认授权许可 -> 完成配置<br>
    ![第4步](images/01_4_1.png)<br>
5.  选择登录用户 -> 输入密码 -> 登录<br>
    ![第5步-1](images/01_5_1.png)<br>
    ![第5步-2](images/01_5_2.png)<br>
6.  选择语言(English) -> 选择键盘布局(English(US)) -> 开启本地服务 -> 网络账号绑定(跳过) -> 开始使用<br>
    ![第6步-1](images/01_6_1.png)<br>
    ![第6步-2](images/01_6_2.png)<br>
    ![第6步-3](images/01_6_3.png)<br>
7.  软件更新<br>

    ```命令
    > su - root
    > yum update
    ```
