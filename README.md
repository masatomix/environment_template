# environment_template


![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/73777/64f06630-f008-e840-32d8-9c905ff2c83a.png)


## Zabbixサーバの構築

```
 # git clone https://github.com/masatomix/environment_template.git
 # cd environment_template/
 # git checkout -t origin/feature/for_qiita_zabbix
 # vagrant up
```

と実行することで、Ubuntu Linuxの構築から Docker のインストール、Dockerサーバ上でのZabbixのインストール、そのクライアントでのZabbix Agentのインストールと設定と起動、までが行われます。


## Zabbix Agentの構築

```
 # git clone https://github.com/masatomix/environment_template.git
 # cd environment_template/
 # git checkout -t origin/feature/for_qiita_zabbix
 # cd agent
 # vagrant up
```


と実行することで、Ubuntu Linuxの構築から Zabbix Agentのインストールと設定と起動、までが行われます。




## おまけ。バックアップ

vagrant@ubuntu-xenial:~$ cd /vagrant/zabbix/

### 「MySQL以外のプロセス」の停止

```
vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker-compose ps
                    Name                                  Command               State              Ports
-------------------------------------------------------------------------------------------------------------------
zabbix_mysql-server_1_bbe6d5af81da             docker-entrypoint.sh --cha ...   Up      3306/tcp, 33060/tcp
zabbix_zabbix-agent_1_e8a8079c2325             /sbin/tini -- docker-entry ...   Up      10050/tcp
zabbix_zabbix-java-gateway_1_92505d90c8f9      docker-entrypoint.sh             Up      10052/tcp
zabbix_zabbix-server-mysql_1_e37acaaa644d      /sbin/tini -- docker-entry ...   Up      0.0.0.0:10051->10051/tcp
zabbix_zabbix-web-nginx-mysql_1_432a2d375844   docker-entrypoint.sh             Up      443/tcp, 0.0.0.0:80->80/tcp

vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker-compose stop zabbix-agent zabbix-java-gateway zabbix-server-mysql zabbix-web-nginx-mysql
Stopping zabbix_zabbix-web-nginx-mysql_1_432a2d375844 ... done
Stopping zabbix_zabbix-agent_1_e8a8079c2325           ... done
Stopping zabbix_zabbix-server-mysql_1_e37acaaa644d    ... done
Stopping zabbix_zabbix-java-gateway_1_92505d90c8f9    ... done

vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker-compose ps
                    Name                                  Command                State            Ports
--------------------------------------------------------------------------------------------------------------
zabbix_mysql-server_1_bbe6d5af81da             docker-entrypoint.sh --cha ...   Up         3306/tcp, 33060/tcp
zabbix_zabbix-agent_1_e8a8079c2325             /sbin/tini -- docker-entry ...   Exit 0
zabbix_zabbix-java-gateway_1_92505d90c8f9      docker-entrypoint.sh             Exit 143
zabbix_zabbix-server-mysql_1_e37acaaa644d      /sbin/tini -- docker-entry ...   Exit 0
zabbix_zabbix-web-nginx-mysql_1_432a2d375844   docker-entrypoint.sh             Exit 0


vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                 NAMES
d44071b826a6        mysql:5.7           "docker-entrypoint.s…"   16 minutes ago      Up 16 minutes       3306/tcp, 33060/tcp   zabbix_mysql-server_1_bbe6d5af81da
```

以下「MySQL以外のプロセス」の停止、といったらこの作業を指す。


### バックアップ

```
vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker-compose exec mysql-server /bin/bash

I have no name!@d44071b826a6:/$ mysqldump --single-transaction -uzabbix -pzabbix zabbix > /tmp/db20190722.dump
mysqldump: [Warning] Using a password on the command line interface can be insecure.

I have no name!@d44071b826a6:/$ exit
exit
```

```
vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker cp d44071b826a6:/tmp/db20190722.dump ./
vagrant@ubuntu-xenial:/vagrant/zabbix$ ls -lrt
合計 2736
drwxr-xr-x 1 vagrant vagrant      96  7月 22 00:07 nginx
drwxr-xr-x 1 vagrant vagrant      96  7月 22 00:07 db
-rw-r--r-- 1 vagrant vagrant    2091  7月 22 00:07 docker-compose.yml
-rw-r--r-- 1 vagrant vagrant 2796867  7月 22 00:35 db20190722.dump
vagrant@ubuntu-xenial:/vagrant/zabbix$



### 起動

vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker-compose start zabbix-agent zabbix-java-gateway zabbix-server-mysql zabbix-web-nginx-mysql
Starting zabbix-java-gateway    ... done
Starting zabbix-server-mysql    ... done
Starting zabbix-web-nginx-mysql ... done
Starting zabbix-agent           ... done

vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker-compose ps
                    Name                                  Command               State              Ports
-------------------------------------------------------------------------------------------------------------------
zabbix_mysql-server_1_bbe6d5af81da             docker-entrypoint.sh --cha ...   Up      3306/tcp, 33060/tcp
zabbix_zabbix-agent_1_e8a8079c2325             /sbin/tini -- docker-entry ...   Up      10050/tcp
zabbix_zabbix-java-gateway_1_92505d90c8f9      docker-entrypoint.sh             Up      10052/tcp
zabbix_zabbix-server-mysql_1_e37acaaa644d      /sbin/tini -- docker-entry ...   Up      0.0.0.0:10051->10051/tcp
zabbix_zabbix-web-nginx-mysql_1_432a2d375844   docker-entrypoint.sh             Up      443/tcp, 0.0.0.0:80->80/tcp
vagrant@ubuntu-xenial:/vagrant/zabbix$

以後起動と行ったらこの作業を指す

## おまけ。リストア

### プロセス確認、停止

「MySQL以外のプロセス」を停止する


### リストア準備

```
vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker cp ./db20190722.dump d44071b826a6:/
vagrant@ubuntu-xenial:/vagrant/zabbix$ sudo docker-compose exec mysql-server /bin/bash

I have no name!@d44071b826a6:/$ ls -lrt
total 2800
...
-rw-r--r--   1 1000 1000 2796867 Jul 22 00:35 db20190722.dump
I have no name!@d44071b826a6:/$
```

### 削除・空DB作成・リストア

```
I have no name!@d44071b826a6:/$  mysql -uzabbix -pzabbix
...
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>  drop database zabbix;
Query OK, 144 rows affected (1.70 sec)

mysql> create  database zabbix;
Query OK, 1 row affected (0.01 sec)


mysql> exit
Bye
```


```
I have no name!@d44071b826a6:/$ mysql -uzabbix -pzabbix zabbix < ./db20190722.dump
mysql: [Warning] Using a password on the command line interface can be insecure.
I have no name!@d44071b826a6:/$


I have no name!@d44071b826a6:/$ exit
exit

```

### 起動

プロセスを起動すればOK。