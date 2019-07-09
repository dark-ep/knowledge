# MacOS 配置环境变量的方法

##  bash中设置环境变量path的几种方法

1.  Mac系统的环境变量加载顺序
    
    /etc/profile -> /etc/paths -> ~/.bash_profile -> ~/.bash_login -> ~/.profile -> ~/.bashrc
    
    > 当然/etc/profile和/etc/paths是系统级别的，系统启动就会加载，后面几个是当前用户级的环境变量。后面3个按照从前往后的顺序读取，如果/.bash_profile文件存在，则后面的几个文件就会被忽略不读了，如果/.bash_profile文件不存在，才会以此类推读取后面的文件。~/.bashrc没有上述规则，它是bash shell打开的时候载入的。

2.  设置PATH的语法
    
    ```内容
    #中间用冒号隔开
    export PATH=$PATH:<PATH 1>:<PATH 2>:<PATH 3>:------:<PATH N>
    ```

3.  设置说明

    a.  全局设置(修改时需要root权限)

    -  /etc/paths （全局建议修改这个文件）<br>
       编辑 paths，将环境变量添加到 paths文件中 ，一行一个路径<br>
    -  /etc/profile （建议不修改这个文件）<br>
       全局（公有）配置，不管是哪个用户，登录时都会读取该文件。<br>
    -  /etc/bashrc （一般在这个文件中添加系统级环境变量）<br>
       全局（公有）配置，bash shell执行时，不管是何种方式，都会读取此文件。<br>
    -  /etc/path.d/文件名<br>
       -  创建一个文件<br>
          sudo touch /etc/paths.d/mysql
       -  用 vim 打开这个文件<br>
          sudo vim /etc/paths.d/mysql
       -  编辑该文件，键入路径并保存<br>
          /usr/local/mysql/bin

    b.  单个用户设置
    -  ~/.bash_profile （任意一个文件中添加用户级环境变量）
       > 注：Linux 里面是 .bashrc 而 Mac 是 .bash_profile<br>
       -  若bash shell是以login方式执行时，才会读取此文件。该文件仅仅执行一次!默认情况下,他设置一些环境变量<br>
       -  设置命令别名alias ll=’ls -la’<br>
       -  设置环境变量：<br>
           export PATH=/opt/local/bin:/opt/local/sbin:$PATH

    -  ~/.bashrc 同上
    > 如果想立刻生效，则可执行下面的语句：<br>
    > $ source 相应的文件<br>
    > 一般环境变量更改后，重启后生效。
