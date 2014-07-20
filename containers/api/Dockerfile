FROM ubuntu:12.04
MAINTAINER Tim Park <tim@nitrogen.io>

RUN apt-get install -y python-software-properties --fix-missing
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

RUN apt-get install -y git

RUN mkdir /var/www
RUN mkdir /var/www/api
RUN cd /var/www/api
RUN git clone https://github.com/nitrogenjs/service service
RUN cd service
RUN npm install
