set -a
source .env
set +a

echo "Server IP: ${SERVER_IP}"

mkdir -p ./cert

sudo openssl req -x509 -newkey rsa:2048 \
  -keyout ./cert/key.pem \
  -out ./cert/cert.pem \
  -days 365 \
  -nodes \
  -subj "/C=/ST=/L=/O=/OU=/CN=${SERVER_IP}"

mkdir -p ./3x-ui/3x_db
sudo cp ./3x-ui/x-ui.db.original ./3x-ui/3x_db/x-ui.db
sudo chmod 644 ./3x-ui/3x_db/x-ui.db
sudo chown root:root ./3x-ui/3x_db/x-ui.db
sudo chown root:root ./3x-ui/3x_db/

docker compose -f 3x-ui-docker-compose.yml up -d
