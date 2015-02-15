../common/azure-coreos-cluster n2-fd-stg --subscription 1d3bc944-c31f-41a9-a1ac-cafea961eba5 --azure-cert azure-cert.pem --num-nodes 3 --location "East US" --vm-size Small --blob-container-url https://nitrogenprod.blob.core.windows.net/vhds/ --data-disk

export FLEETCTL_TUNNEL=n2-fd-stg.cloudapp.net:22001

fleetctl start ../common/n2-frontdoor\@{1,2,3}.service
