#!/bin/bash
set -e
trap "exit" TERM

pip3 install --user -r requirements.txt

set -x
locust --host="http://localhost" --no-web -c "30" -r 10 --print-stats
