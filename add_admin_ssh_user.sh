#!/bin/bash

set -e

USERNAME="$1"
SSH_KEY="$2"

if [[ -z "$USERNAME" || -z "$SSH_KEY" ]]; then
  echo "Usage: $0 <username> <ssh_public_key>"
  exit 1
fi

# 1. Создаём пользователя, если его нет
if id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME already exists"
else
  useradd -m -s /bin/bash "$USERNAME"
  echo "User $USERNAME created"
fi

# 2. Добавляем в sudo группу (админ права)
usermod -aG sudo "$USERNAME"

# 3. Разрешаем sudo без пароля (NOPASSWD)
SUDO_FILE="/etc/sudoers.d/${USERNAME}"

echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "$SUDO_FILE"
chmod 440 "$SUDO_FILE"

# проверка синтаксиса sudoers (важно!)
visudo -cf "$SUDO_FILE" >/dev/null

echo "Passwordless sudo enabled for $USERNAME"

# 4. Настройка SSH ключа
HOME_DIR=$(eval echo "~$USERNAME")
SSH_DIR="$HOME_DIR/.ssh"
AUTH_KEYS="$SSH_DIR/authorized_keys"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# избегаем дубликатов ключей
touch "$AUTH_KEYS"
grep -qxF "$SSH_KEY" "$AUTH_KEYS" || echo "$SSH_KEY" >> "$AUTH_KEYS"

chmod 600 "$AUTH_KEYS"
chown -R "$USERNAME:$USERNAME" "$SSH_DIR"

echo "User $USERNAME is now admin and SSH key added."
