set -a
source .env
set +a

echo "Server IP: ${SERVER_IP}"
echo "Server domain: ${SERVER_DOMAIN}"
echo "Admin domain: ${ADMIN_DOMAIN}"
echo "Subscription domain: ${SUBSCRIPTION_DOMAIN}"

./cert.sh

docker compose up -d

sleep 5

docker compose down

envsubst < ./settings.sql | sudo sqlite3 ./3x_db/x-ui.db

docker compose up -d
