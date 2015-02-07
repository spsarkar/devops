rm -rf $1-$3 

git clone http://github.com/nitrogenjs/$2 $1-$3 
cd $1-$3

deis create $1-$3

../config-env-$3.sh

git push deis master
#deis scale web=$4
