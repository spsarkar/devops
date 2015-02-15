#!/bin/bash

../common/install-role.sh api frontdoor $1 $2
../common/install-role.sh ingestion ingestion $1 $2
../common/install-role.sh registry registry $1 $2
../common/install-role.sh consumption consumption $1 $2
../common/install-role.sh mqtt mqtt $1 $2
