#!/bin/sh

cd /vagrant/jenkins/slaves

# mkdir -p ./jenkins-slave01 && chown 1000:1000 ./jenkins-slave01
# mkdir -p ./jenkins-slave02 && chown 1000:1000 ./jenkins-slave02
mkdir -p dot_ssh

# file="/vagrant/jenkins/slaves/id_rsa"
file="id_rsa"
 
if [ -e $file ]; then
    echo "${file} found."
    rm -fr "${file}"
    rm -fr "${file}.pub"
else
    echo "${file} NOT found."
fi

# mkdir -p `dirname ${file}`

expect -c "
set timeout 5
spawn /usr/bin/ssh-keygen -t rsa -b 4096 -C \"test@example.com\"
expect \"Enter file in which to save the key (/home/vagrant/.ssh/id_rsa):\"
send \"${file}\n\"
expect \"Enter passphrase (empty for no passphrase):\"
send \"\n\"
expect \"Enter same passphrase again:\"
send \"\n\"

expect \"$\"
exit 0
"

cp -pfr "${file}.pub" ./dot_ssh/authorized_keys

