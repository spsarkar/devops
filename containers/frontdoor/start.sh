cd /var/www

# remove repo if it already exists
rm -rf frontdoor; true

# install latest nodejs server
git clone http://github.com/nitrogen/frontdoor frontdoor 
cd frontdoor 
npm install

forever server.js
