FROM ubuntu

RUN apt-get update
RUN apt-get -y dist-upgrade

RUN apt-get -y install git curl

RUN adduser ubuntu 
RUN mkdir /home/ubuntu/.ssh
COPY ./id_rsa.pub /home/ubuntu/.ssh/authorized_keys
ENTRYPOINT ["/bin/sh"]


