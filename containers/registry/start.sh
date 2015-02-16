cd /var/www

# remove repo if it already exists
rm -rf registry; true

# install latest nodejs server
git clone http://github.com/nitrogenjs/registry registry
cd registry

npm install

export NODE_ENV=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/node_env`
export HOST_NAME=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/host_name`
export PORT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/internal_port`
export EXTERNAL_PORT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/external_port`
export PROTOCOL=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/protocol`

export ACCESS_TOKEN_SIGNING_KEY=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/access_token_signing_key`
export USER_SESSION_SECRET=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/user/session_secret`

export CONSUMPTION_INTERNAL_ENDPOINT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/endpoints/consumption_http`
export CONSUMPTION_INTERNAL_WS_ENDPOINT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/endpoints/consumption_ws`
export INGESTION_INTERNAL_ENDPOINT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/endpoints/ingestion`
export REGISTRY_INTERNAL_ENDPOINT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/endpoints/registry`

export MONGODB_CONNECTION_STRING=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/mongodb_connection_string`
export REDIS_HOST=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/redis/host`
export REDIS_PORT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/redis/port`

export AZURE_STORAGE_ACCOUNT=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/azure/storage_account`
export AZURE_STORAGE_KEY=`etcdctl --peers "172.17.42.1:4001" get /nitrogen/azure/storage_key`

#export NEW_RELIC_LICENSE_KEY=`etcdctl get /nitrogen/new_relic/license_key`
#export NEW_RELIC_APP_NAME=`etcdctl get /nitrogen/new_relic/app_name`
#export NEW_RELIC_HOME=`etcdctl get /nitrogen/new_relic/home`

#export LOGGLY_SUBDOMAIN=`etcdctl get /nitrogen/loggly/subdomain`
#export LOGGLY_INPUT_TOKEN=`etcdctl get /nitrogen/loggly/input_token`
#export LOGGLY_USERNAME=`etcdctl get /nitrogen/loggly/username`
#export LOGGLY_PASSWORD=`etcdctl get /nitrogen/loggly/password`

#export SENDGRID_API_USER=`etcdctl get /nitrogen/sendgrid/api_user`
#export SENDGRID_API_KEY=`etcdctl get /nitrogen/sendgrid/api_key`

forever server.js
