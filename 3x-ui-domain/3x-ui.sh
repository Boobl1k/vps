set -a
source .env
set +a

echo "Dir: ${DIR}"
echo "Server IP: ${SERVER_IP}"
echo "Server domain: ${SERVER_DOMAIN}"

./cert.sh

mkdir -p ./3x_db
sudo cp ./x-ui.db.original ./3x_db/x-ui.db
sudo chmod 644 ./3x_db/x-ui.db
sudo chown root:root ./3x_db/x-ui.db
sudo chown root:root ./3x_db/

docker compose up -d
