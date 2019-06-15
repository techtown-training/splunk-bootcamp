#!/bin/bash
set -e
trap "exit" TERM

if [[ -z "${FRONTEND_ADDR}" ]]; then
    echo >&2 "FRONTEND_ADDR not specified"
    exit 1
fi

pip install --user -r requirements.txt

set -x
locust --host="http://${FRONTEND_ADDR}" --no-web -c "${USERS:-30}" -r 10 -t 15m --print-stats
