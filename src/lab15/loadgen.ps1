pip install --user -r requirements.txt

locust --host="http://${FRONTEND_ADDR}" --no-web -c "${USERS:-30}" -r 10 -t 15m --print-stats