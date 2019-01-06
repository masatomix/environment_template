Stubbyを起動するDockerコンテナ


## docker-composeがある場合

```
# git clone https://github.com/masatomix/stubby-docker.git
# cd stubby-docker/
# sudo docker-compose up -d
```


## つかってみる
```
# curl http://localhost:8882/ajax/get001/
{"param1":{"v1Param1":"v1Value1"}}
```


## Build と起動(docker-composeがないばあい)

```
# git clone https://github.com/masatomix/stubby-docker.git
# cd stubby-docker/
# sudo docker build ./ -t my-stubby-npm
```

```
# docker run  \
 -it --name my-stubby  \
 -p 8882:8882 \
 my-stubby-npm
```


独自の設定を使うには

```
# ls -lrt `pwd`/mocks/
合計 12
-rw-r--r-- 1 vagrant vagrant  35  5月 26  2018 get002.json
-rwxr-xr-x 1 vagrant vagrant 338  5月 26  2018 config.yaml
-rwxr-xr-x 1 vagrant vagrant  36 12月 29 17:06 get001.json

# docker run  \
 -it --name my-stubby  \
 -p 8882:8882 \
 -v `pwd`/mocks:/home/stubby/mocks \
 my-stubby-npm
```