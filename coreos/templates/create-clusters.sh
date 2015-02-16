../common/azure-coreos-cluster {{{frontdoor_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{frontdoor_nodes}}} --location "{{{location}}}" --vm-size {{{frontdoor_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}
../common/azure-coreos-cluster {{{ingestion_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{ingestion_nodes}}} --location "{{{location}}}" --vm-size {{{ingestion_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}
../common/azure-coreos-cluster {{{consumption_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{consumption_nodes}}} --location "{{{location}}}" --vm-size {{{consumption_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}
../common/azure-coreos-cluster {{{registry_cloud_service}}} --subscription {{{subscription}}} --azure-cert azure-cert.pem --num-nodes {{{registry_nodes}}} --location "{{{location}}}" --vm-size {{{frontdoor_vm_size}}} --blob-container-url {{{blob_container_url}}} --data-disk --ssh-cert ssh-cert.cer --ssh-thumb {{{ssh_thumbprint}}}

ssh-add ssh-cert.key

ssh core@{{{frontdoor_cloud_service}}}.cloudapp.net -p 22001 < config-etcd
ssh core@{{{ingestion_cloud_service}}}.cloudapp.net -p 22001 < config-etcd
ssh core@{{{consumption_cloud_service}}}.cloudapp.net -p 22001 < config-etcd
ssh core@{{{registry_cloud_service}}}.cloudapp.net -p 22001 < config-etcd

export FLEETCTL_TUNNEL={{{frontdoor_cloud_service}}}.cloudapp.net:22001
fleetctl start ../common/frontdoor@{{{frontdoor_node_range}}}.service

export FLEETCTL_TUNNEL={{{ingestion_cloud_service}}}.cloudapp.net:22001
fleetctl start ../common/ingestion@{{{ingestion_node_range}}}.service

export FLEETCTL_TUNNEL={{{consumption_cloud_service}}}.cloudapp.net:22001
fleetctl start ../common/consumption@{{{consumption_node_range}}}.service

export FLEETCTL_TUNNEL={{{registry_cloud_service}}}.cloudapp.net:22001
fleetctl start ../common/registry@{{{registry_node_range}}}.service
