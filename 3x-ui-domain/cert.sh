sudo apt-get install certbot -y

CERT_DIR=${PWD}/cert

cp copy_certs.sh.original copy_certs.sh
sed -i "s|#{CERT_DIR}|${CERT_DIR}|g" ./copy_certs.sh
sed -i "s|#{DOMAIN}|${SERVER_DOMAIN}|g" ./copy_certs.sh

sudo certbot certonly \
  --standalone \
  -d ${SERVER_DOMAIN} \
  -d ${ADMIN_DOMAIN} \
  -d ${SUBSCRIPTION_DOMAIN} \
  --deploy-hook "${PWD}/copy_certs.sh" \
  --register-unsafely-without-email \
  --non-interactive \
  --agree-tos \
  --expand
