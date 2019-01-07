FROM ubuntu
MAINTAINER masatomix


RUN apt update
RUN apt install -y curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x |  bash -
RUN apt install -y nodejs
RUN apt install -y git
RUN apt install -y vim

ARG user="stubby"
ARG homeDir="/home/${user}"

RUN useradd ${user}

WORKDIR ${homeDir}

ADD package.json ${homeDir}/package.json
ADD mocks ${homeDir}/mocks

RUN chown -R ${user}:${user} ${homeDir}
USER ${user}
RUN npm install

CMD ["./node_modules/.bin/stubby","--data","mocks/config.yaml","-w"]
