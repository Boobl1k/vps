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

docker compose -f 3x-ui-docker-compose.yml up -d
