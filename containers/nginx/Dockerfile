FROM nitrogen/ubuntu:14.04
MAINTAINER Tim Park <tpark@microsoft.com>

# install confd
RUN \
  wget https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 && \
  sudo mv confd-0.6.3-linux-amd64 /usr/local/bin/confd && \
  sudo chmod +x /usr/local/bin/confd

# install and configure nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# setup and run start script.
ADD start.sh /var/www/start.sh
RUN chmod +x /var/www/start.sh

CMD ./var/www/start.sh

# expose ports.
EXPOSE 80
EXPOSE 443
