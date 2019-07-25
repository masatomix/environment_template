FROM ubuntu

MAINTAINER masatomix

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y openssh-server

ADD dot_ssh /root/.ssh
RUN mkdir -p /var/run/sshd

RUN apt-get install -y gcc graphviz ruby

RUN mkdir -p /jenkins/workspace

CMD ["/usr/sbin/sshd","-D"]
