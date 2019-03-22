# 安装 Ubuntu18 操作系统

## 安装操作系统

1.  开机 -> 等待系统进入安装界面<br>
    ![第1步](images/01_1_1.png)<br>
2.  语言选择：English -> Install Ubuntu -> 键盘布局：English English(US) -> 更新和其他软件：最小安装 安装时下载更新 -> 安装方式：清盘安装 -> 选择地区 -> 设置用户 -> 开始安装<br>
    ![第2步-1](images/01_2_1.png)<br>
    ![第2步-2](images/01_2_2.png)<br>
    ![第2步-3](images/01_2_3.png)<br>
    ![第2步-4](images/01_2_4.png)<br>
    ![第2步-5](images/01_2_5.png)<br>
    ![第2步-6](images/01_2_6.png)<br>

    > 用户：ubuntu 密码：1qaz2wsx
3.  安装常用工具

    ```命令
    > # 安装网络工具，可以使用ifconfig命令
    > sudo apt install net-tools 
    > # 安装VIM，可以使用vim编辑文件
    > sudo apt install vim
    > # 安装ssh，可以使用工具远程通过ssh登录系统
    > sudo apt-get install openssh-server
    ```