set -a
source .env
set +a

ADMIN_DOMAIN=admin.${SERVER_DOMAIN}
SUBSCRIPTION_DOMAIN=sub.${SERVER_DOMAIN}

echo "Server IP: ${SERVER_IP}"
echo "Server domain: ${SERVER_DOMAIN}"
echo "Admin domain: ${ADMIN_DOMAIN}"
echo "Subscription domain: ${SUBSCRIPTION_DOMAIN}"

./cert.sh

mkdir -p ./3x_db
sudo cp ./x-ui.db.original ./3x_db/x-ui.db
sudo chmod 644 ./3x_db/x-ui.db
sudo chown root:root ./3x_db/x-ui.db
sudo chown root:root ./3x_db/

docker compose up -d
