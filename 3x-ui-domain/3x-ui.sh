set -a
source .env
set +a

echo "Dir: ${DIR}"
echo "Server IP: ${SERVER_IP}"
echo "Server domain: ${SERVER_DOMAIN}"

mkdir -p ./cert

sudo openssl req -x509 -newkey rsa:2048 \
  -keyout ./cert/key.key \
  -out ./cert/cert.crt \
  -days 365 \
  -nodes \
  -subj "/CN=${SERVER_IP}" \
  -addext "subjectAltName = IP:${SERVER_IP} "

mkdir -p ./3x_db
sudo cp ./x-ui.db.original ./3x_db/x-ui.db
sudo chmod 644 ./3x_db/x-ui.db
sudo chown root:root ./3x_db/x-ui.db
sudo chown root:root ./3x_db/

docker compose up -d
