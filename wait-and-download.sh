#!/bin/sh

set -eu -o pipefail

OUTPUT="${OUTPUT:-${PWD}}"
VM_USER="${VM_USER:-user}"

waitforssh -T "test -s /${ASSET}" -- "${VM_USER}@${VM_HOSTNAME}" &&
    sleep 5 &&
    scp -o LogLevel=VERBOSE \
        -o StrictHostKeyChecking=no \
        -o UserKnownHostsFile=/dev/null \
        -o User=user \
        "${VM_HOSTNAME}:/${ASSET}" "${OUTPUT}"
