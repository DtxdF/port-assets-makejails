#!/bin/sh

BASEDIR=`dirname -- "$0"` || exit $?
BASEDIR=`realpath -- "${BASEDIR}"` || exit $?

. "${BASEDIR}/.env"

OUTPUT="${OUTPUT:-${PWD}}"
WAIT="${WAIT:-10}"

test -n "${ASSET}" || exit $?

while :; do
    ssh -o LogLevel=QUIET \
        -o StrictHostKeyChecking=no \
        -o UserKnownHostsFile=/dev/null \
        -o User=user \
        "${BACKREST_HOSTNAME}" test -f "/${ASSET}"

    if [ $? -ne 0 ]; then
        sleep "${WAIT}" || exit $?
        continue
    fi

    scp -o LogLevel=VERBOSE \
        -o StrictHostKeyChecking=no \
        -o UserKnownHostsFile=/dev/null \
        -o User=user \
        "${BACKREST_HOSTNAME}:/${ASSET}" "${OUTPUT}"

    exit $?
done
