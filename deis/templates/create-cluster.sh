../common/create-azure-user-data $(curl -s https://discovery.etcd.io/new)

mv ../common/azure-user-data .

../common/azure-coreos-cluster {{cloudService}} --subscription {{subscription}} --azure-cert azure-cert.pem --num-nodes {{nodes}} --location "{{location}}" --vm-size {{vmSize}} --blob-container-url {{{vhdBlobs}}} --data-disk --deis --custom-data azure-user-data

export DEISCTL_TUNNEL="{{cloudService}}.cloudapp.net:22001"

ssh-add ssh-cert.key

sleep 300

deisctl config platform set sshPrivateKey=ssh-cert.key
deisctl config platform set domain={{domain}}
deisctl config platform set sslKey={{{sslKeyFile}}} sslCert={{{sslCertFile}}}
deisctl install platform
deisctl start platform
