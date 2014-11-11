FROM ubuntu:14.04
MAINTAINER Tim Park <tim@nitrogen.io>

RUN \
  apt-get update && \
  sudo apt-get install -y git curl software-properties-common wget

ADD etcdctl /usr/local/bin/
