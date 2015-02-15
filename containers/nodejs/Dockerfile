FROM nitrogen/ubuntu:14.04
MAINTAINER Tim Park <tim@nitrogen.io>

RUN \
  sudo apt-get update && \
  sudo apt-get install -y software-properties-common python-software-properties && \
  sudo add-apt-repository ppa:chris-lea/node.js && \
  sudo apt-get update && \
  sudo apt-get install -y nodejs && \
  sudo npm install npm -g && \
  sudo npm install -g forever
