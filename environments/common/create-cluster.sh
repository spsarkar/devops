../common/create-azure-user-data $(curl -s https://discovery.etcd.io/new)

mv ../common/azure-user-data .

../common/azure-coreos-cluster {{cloudService}} --subscription {{subscription}} --azure-cert azure-cert.pem --num-nodes {{nodes}} --location "{{location}}" --vm-size {{vmSize}} --pip --blob-container-url https://{{azure_storage_account}}.blob.core.windows.net/vhds/ --data-disk --deis --custom-data azure-user-data

ssh-add ssh-cert.key
deisctl config platform set sshPrivateKey=ssh-cert.key
deisctl config platform set domain={{domain}}
deisctl config builder set image=deis/builder:v1.1.1-azure
deisctl install platform
deisctl start platform
