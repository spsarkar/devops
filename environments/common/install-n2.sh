#!/bin/bash

# ../common/install-role.sh frontdoor $1
# ../common/install-role.sh ingestion $1
../common/install-role.sh registry $1
../common/install-role.sh consumption $1
