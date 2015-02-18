../common/azure-coreos-cluster {{{frontdoor_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{frontdoor_nodes}}} --location "{{{location}}}" --vm-size {{{frontdoor_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --http --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}
../common/azure-coreos-cluster {{{ingestion_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{ingestion_nodes}}} --location "{{{location}}}" --vm-size {{{ingestion_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --http --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}
../common/azure-coreos-cluster {{{consumption_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{consumption_nodes}}} --location "{{{location}}}" --vm-size {{{consumption_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --http --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}
../common/azure-coreos-cluster {{{registry_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{registry_nodes}}} --location "{{{location}}}" --vm-size {{{frontdoor_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --http --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}

ssh-add ssh-cert.key

# allow clusters time to spin up
sleep 300

# configure clusters
ssh core@{{{frontdoor_cloud_service}}}.cloudapp.net -p 22001 < config-etcd
ssh core@{{{ingestion_cloud_service}}}.cloudapp.net -p 22001 < config-etcd
ssh core@{{{consumption_cloud_service}}}.cloudapp.net -p 22001 < config-etcd
ssh core@{{{registry_cloud_service}}}.cloudapp.net -p 22001 < config-etcd

./frontdoor-fleetctl start ../common/frontdoor@{{{frontdoor_node_range}}}.service
./frontdoor-fleetctl start ../common/newrelic-sysmond@{{{frontdoor_node_range}}}.service

./ingestion-fleetctl start ../common/ingestion@{{{ingestion_node_range}}}.service
./ingestion-fleetctl start ../common/newrelic-sysmond@{{{ingestion_node_range}}}.service

./registry-fleetctl start ../common/registry@{{{registry_node_range}}}.service
./registry-fleetctl start ../common/newrelic-sysmond@{{{registry_node_range}}}.service

./consumption-fleetctl start ../common/consumption@{{{consumption_node_range}}}.service
./consumption-fleetctl start ../common/newrelic-sysmond@{{{consumption_node_range}}}.service