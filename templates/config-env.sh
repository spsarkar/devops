deis config:set NODE_ENV="{{{node_env}}}"

deis config:set HOST_NAME="{{{host_name}}}"
deis config:set PORT="{{{port}}}"
deis config:set EXTERNAL_PORT="{{{external_port}}}"
deis config:set PROTOCOL="{{{protocol}}}"

deis config:set MONGODB_CONNECTION_STRING="{{{mongodb_connection_string}}}"
deis config:set REDIS_HOST="{{{redis_host}}}"
deis config:set REDIS_PORT="{{{redis_port}}}"

deis config:set AZURE_STORAGE_ACCOUNT="{{{azure_storage_account}}}"
deis config:set AZURE_STORAGE_KEY="{{{azure_storage_key}}}"

deis config:set ACCESS_TOKEN_SIGNING_KEY="{{{access_token_signing_key}}}"
deis config:set USER_SESSION_SECRET="{{{user_session_secret}}}"

deis config:set LOGGLY_SUBDOMAIN="{{{loggly_subdomain}}}"
deis config:set LOGGLY_INPUT_TOKEN="{{{loggly_input_token}}}"
deis config:set LOGGLY_USERNAME="{{{loggly_username}}}"
deis config:set LOGGLY_PASSWORD="{{{loggly_password}}}"

deis config:set NEW_RELIC_LICENSE_KEY="{{{new_relic_license_key}}}"
deis config:set NEW_RELIC_APP_NAME="{{{new_relic_app_name}}}"
deis config:set NEW_RELIC_HOME="{{{new_relic_home}}}"

deis config:set SENDGRID_API_USER="{{{sendgrid_api_user}}}"
deis config:set SENDGRID_API_KEY="{{{sendgrid_api_key}}}"

deis config:set CONSUMPTION_INTERNAL_ENDPOINT="{{{consumption_internal_endpoint}}}"
deis config:set CONSUMPTION_INTERNAL_WS_ENDPOINT="{{{consumption_internal_ws_endpoint}}}"
deis config:set INGESTION_INTERNAL_ENDPOINT="{{{ingestion_internal_endpoint}}}"
deis config:set REGISTRY_INTERNAL_ENDPOINT="{{{registry_internal_endpoint}}}"
