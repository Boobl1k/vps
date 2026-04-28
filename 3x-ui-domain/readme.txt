1. cp .env.example .env
2. difine SERVER_DOMAIN
3. update TG_BOT_ENABLE and define TG_BOT_TOKEN if you need telegram bot
4. ./3x-ui.sh
5. open https://admin.<server_domain> in your browser to access panel. Default creds: admin admin
6. update admin password!!!
7. now you can create inbound and clients

Inbound settings:
1. port 6767 (if you need to change port, edit docker compose)
2. security - Reality
3. generate keys for Reality
4. enable Sockopt
