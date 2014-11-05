FROM nitrogen/ubuntu
MAINTAINER Tim Park <tim@nitrogen.io>

RUN sudo apt-get install -y software-properties-common python-software-properties
RUN sudo add-apt-repository ppa:chris-lea/node.js
RUN sudo apt-get update
RUN sudo apt-get install -y nodejs
RUN sudo npm install npm -g
RUN sudo npm install -g forever
