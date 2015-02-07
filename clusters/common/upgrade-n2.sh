#!/bin/bash

../common/upgrade-role.sh api frontdoor $1 $2
../common/upgrade-role.sh ingestion ingestion $1 $2
../common/upgrade-role.sh registry registry $1 $2
../common/upgrade-role.sh consumption consumption $1 $2
../common/upgrade-role.sh mqtt mqtt $1 $2
