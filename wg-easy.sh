docker network create \
  --driver bridge \
  --ipv6 \
  --subnet 10.42.42.0/24 \
  --subnet fdcc:ad94:bacf:61a3::/64 \
  vpn

docker compose -f wg-easy-docker-compose.yml up -d
