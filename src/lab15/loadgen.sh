#!/bin/bash
set -e
trap "exit" TERM

pip install --user -r requirements.txt

set -x
locust --host="http://localhost" --no-web -c "30" -r 10 -t 15m --print-stats
