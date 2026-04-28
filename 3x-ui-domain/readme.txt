1. cp .env.example .env
2. difine SERVER_IP and SERVER_DOMAIN
3. ./3x-ui.sh
4. open https://<server_domain>:1011 in your browser to access panel. Default creds: admin admin
5. update admin password!!!
6. now you can create inbound and clients

Inbound settings:
1. port 6767 (if you need to change port, edit docker compose)
2. security - Reality
3. generate keys for Reality
4. enable Sockopt
