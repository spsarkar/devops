cd /var/www

# remove repo if it already exists
rm -rf consumption; true

git clone http://github.com/nitrogen/consumption consumption
cd consumption
npm install

export MONGODB_CONNECTION_STRING=`etcdctl get /nitrogen/mongodb_connection_string`
export NODE_ENV=`etcdctl get /nitrogen/node_env`

export ACCESS_TOKEN_SIGNING_KEY=`etcdctl get /nitrogen/access_token_signing_key`

export AZURE_STORAGE_ACCOUNT=`etcdctl get /nitrogen/azure/storage_account`
export AZURE_STORAGE_KEY=`etcdctl get /nitrogen/azure/storage_key`

export HOST_NAME=`etcdctl get /nitrogen/host_name`

export NEW_RELIC_LICENSE_KEY=`etcdctl get /nitrogen/new_relic/license_key`
export NEW_RELIC_APP_NAME=`etcdctl get /nitrogen/new_relic/app_name`
export NEW_RELIC_HOME=`etcdctl get /nitrogen/new_relic/home`

export LOGGLY_SUBDOMAIN=`etcdctl get /nitrogen/loggly/subdomain`
export LOGGLY_INPUT_TOKEN=`etcdctl get /nitrogen/loggly/input_token`
export LOGGLY_USERNAME=`etcdctl get /nitrogen/loggly/username`
export LOGGLY_PASSWORD=`etcdctl get /nitrogen/loggly/password`

export SENDGRID_API_USER=`etcdctl get /nitrogen/sendgrid/api_user`
export SENDGRID_API_KEY=`etcdctl get /nitrogen/sendgrid/api_key`

export REDIS_SERVERS=`etcdctl get /nitrogen/redis/servers`

export USER_SESSION_SECRET=`etcdctl get /nitrogen/user/session_secret`

forever server.js
