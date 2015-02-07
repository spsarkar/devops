git clone http://github.com/nitrogenjs/$1 $1 
cd $1

deis create $1-$2

../config-env.sh

git push deis master
deis scale web=$2
