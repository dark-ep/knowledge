# Docker 安装 ELK6.4.0

## 软件安装

1.  Docker获取最新版ELK<br>

    ```命令
    > docker pull docker.elastic.co/elasticsearch/elasticsearch:6.4.0
    > docker pull docker.elastic.co/kibana/kibana:6.4.0
    > docker pull docker.elastic.co/beats/filebeat:6.4.0
    > docker pull docker.elastic.co/logstash/logstash:6.4.0
    ```

    > ![info][info] [ELK说明地址][ELK地址]

2.  创建ELK宿主目录(脚本及配置,待处理的日志目录)<br>

    ```命令
    > mkdir -p /home/docker/elk/logs
    > mkdir -p /home/docker/elk/script
    > mkdir -p /home/docker/elk/filebeat/conf
    > mkdir -p /home/docker/elk/logstash/conf
    ```

3.  Docker运行ELK<br>
    a. 拷贝运行脚本到特定目录<br>

    > [start-container.sh](files/16/start-container.sh) -> /home/docker/elk/<br>
    > [filebeat/conf/filebeat.yml](files/16/filebeat/conf/filebeat.yml) -> /home/docker/elk/filebeat/conf/<br>
    > [logstash/conf/logstash.conf](files/16/logstash/conf/logstash.conf) -> /home/docker/elk/logstash/conf/<br>
    > [script/dc-elk.yml](files/16/script/dc-elk.yml) -> /home/docker/elk/script/<br>

    b. 设置执行权限<br>

    ```命令
    > chmod +x /home/docker/elk/*.sh
    ```

    c. 运行ELK<br>

    ```命令
    > cd /home/docker/elk/
    > ./start-container.sh
    ```

    d. 验证是否启动成功<br>

    > [访问Manager页面:\[Your IP Address\]:5601/](http://ep.cn:5601)<br>

    ![第3步-d-1](images/16_3_d_1.png)<br>

4. 打开防火墙端口<br>
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

5. 设置Kibana搜索规则<br>
    a. 添加Kibana的index设置<br>

    ![第5步-a-1](images/16_5_a_1.png)<br>
    ![第5步-a-2](images/16_5_a_2.png)<br>
    ![第5步-a-3](images/16_5_a_3.png)<br>
    ![第5步-a-4](images/16_5_a_4.png)<br>

    b. Discover增加Filter查看搜索结果<br>

    ![第5步-b-1](images/16_5_b_1.png)<br>
    ![第5步-b-2](images/16_5_b_2.png)<br>
    ![第5步-b-3](images/16_5_b_3.png)<br>

[ELK地址]: https://www.docker.elastic.co/
[info]: /images/info.png
