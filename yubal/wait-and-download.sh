#!/bin/sh

BASEDIR=`dirname -- "$0"` || exit $?
BASEDIR=`realpath -- "${BASEDIR}"` || exit $?

. "${BASEDIR}/.env"

OUTPUT="${OUTPUT:-${PWD}}"

test -n "${ASSET}" || exit $?

waitforssh -T "test -s /${ASSET}" -- "user@${VM_HOSTNAME}" &&
    sleep 5 &&
    scp -o LogLevel=VERBOSE \
        -o StrictHostKeyChecking=no \
        -o UserKnownHostsFile=/dev/null \
        -o User=user \
        "${VM_HOSTNAME}:/${ASSET}" "${OUTPUT}"
