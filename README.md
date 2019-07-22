# environment_template

Vagrant上で、Ubuntu 16.04 LTS を起動するテンプレ。provisionで

- 日本語環境のインストール
- Python(pyenv上)のインストール
- MeCab等のインストール
- Nodejs(ndenv上)のインストール
- Ruby(rbenv上)のインストール
- Dockerのインストール

などを行います。



```bash
vagrant のhost側で
$ vagrant up
$ vagrant ssh
```


### 履歴

- 1.0.0 新規
- 1.0.1 docker-compose 関連追加、Rubyの追加、Docker上にMySQL,Stubby,Requestbin,などを追加。
- 1.0.2 python追加時、libbz2-dev もインストール
- 1.0.3 docker-compose でzabbixを構築する docker-compose.yml を追加
- 1.0.4 docker-compose.yml の微調整 