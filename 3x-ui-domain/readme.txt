1. cp .env.example .env
2. difine SERVER_DOMAIN
3. update TG_BOT_ENABLE and define TG_BOT_TOKEN if you need telegram bot
4. ./3x-ui.sh
5. ./cert.sh
6. docker compose up -d
7. open https://admin.<server_domain> in your browser to access panel. Default creds: admin admin
8. update admin password!!!
9. now you can create inbound and clients

Inbound settings (VLESS):
1. port 6767 (if you need to change port, edit docker compose)
2. security - Reality
3. generate keys for Reality
4. enable Sockopt

Subscription domain behavior:
1. https://<subscription_domain>/ (no path) -> static page borscht.html (edit it and restart nginx if needed)
2. https://<subscription_domain>/<any path>, e.g. /sub/<id> -> proxied to 3x-ui (port 2096)
