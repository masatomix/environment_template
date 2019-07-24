
# Vagrant環境のDockerで、Zabbixサーバとエージェントを構築する

以前自分のWikiに「[Vagrant環境のDockerサーバに、Zabbixのサーバとエージェントを構築する](https://www.masatom.in/pukiwiki/Zabbix/Vagrant%B4%C4%B6%AD%A4%C7%A5%B5%A1%BC%A5%D0%A4%C8%A5%A8%A1%BC%A5%B8%A5%A7%A5%F3%A5%C8%A4%F2%B9%BD%C3%DB%A4%B9%A4%EB/)」って記事を書いたのですが、そのときはVagrantのProvision機能でDockerをチマチマ実行してました。

今回は同じ環境を docker-compose で作成します。


## 作成する環境

- 1つのVagrantfileで Zabbixサーバを1つ、別のVagrantfileで、監視されるエージェント側のOSを二つ構築します。
- ZabbixサーバはUbuntu Linux 上のDocker上に構築します。
- エージェント側もUbuntu Linuxとします。
- それぞれの仮想マシンはネットワーク的に到達可能である必要がありますが、Vagrantはデフォルトではおなじネットワークを共有しないようなので、ウラＬＡＮとして 192.168.33.0/24 のネットワークを構築します。
- Zabbixサーバは80番ポートでWEBサーバが起動しますが、VagrantはNATかけないとアクセス出来ないので、port forwardingで 8888番ポートアクセスを80番ポートへ転送します。

図にするとこんな感じ。
![Vagrant_Docker_zabbix.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/73777/4c7b4422-482e-0a2a-7fc5-8229e4143c53.png)


ちなみに今回作業する環境は下記の通り。

```
$ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.14.5
BuildVersion:	18F132
$
```

## コードの取得

使用するファイル群を[GitHub](https://github.com/masatomix/environment_template/tree/feature/for_qiita_zabbix)から取得します。

```bash
$ git clone https://github.com/masatomix/environment_template.git
$ cd environment_template/
$ git checkout -t origin/feature/for_qiita_zabbix
```

## Zabbixサーバの構築

## Zabbixサーバの構築

サーバの構築はVagrantで一発です。

```bash
$ vagrant up
```

と実行することで、Ubuntu Linuxの構築から Dockerのインストール、Dockerサーバ上でのZabbixサーバのインストール、そのサーバ自体を監視するためのZabbixエージェントのコンテナのインストール、と設定と起動、までが行われます。

Vagrantが動いてるOS上のブラウザから``http://127.0.0.1:8888/`` へアクセスして、Zabbixサーバのログイン画面が表示されればOKです。admin/zabbix で入れることを確認しておきましょう。
![top.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/73777/17fcc973-c48c-2d56-513a-dd5fa6a35119.png)


## Zabbixエージェントの構築

つづいてエージェント側。

```bash
$ cd agent
$ vagrant up
```

と実行することで、Ubuntu Linuxの構築から Zabbixエージェントのインストールと設定と起動、までが行われます。

``vagrant up`` が完了したらOSが二つ立ち上がっているはずので、ログイン出来ることを確認しておきましょう。

```bash
$ vagrant ssh agent001 (agent002)
Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-139-generic x86_64)
...
vagrant@agent001:~$
```

つづきは [Vagrant環境のDockerで、Zabbixサーバとエージェントを構築する](https://qiita.com/masatomix/items/8ad9d45399ef01d73d4c) に記事にしました。


