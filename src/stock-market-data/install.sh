#!/bin/bash

SITE_NAME="yfinance"
DATA_DIR="/home/yfinance-data"
PORT="8080"
CONF_FILE="/etc/apache2/sites-available/${SITE_NAME}.conf"

echo "➡️ Instalando Apache (caso necessário)..."
sudo apt update
sudo apt install -y apache2

echo "➡️ Criando configuração Apache em: $CONF_FILE"
cat <<EOF | sudo tee "$CONF_FILE" > /dev/null
<VirtualHost *:${PORT}>
    DocumentRoot "${DATA_DIR}"

    <Directory "${DATA_DIR}">
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${SITE_NAME}-error.log
    CustomLog \${APACHE_LOG_DIR}/${SITE_NAME}-access.log combined
</VirtualHost>
EOF

echo "➡️ Adicionando Listen $PORT ao Apache (se necessário)"
if ! grep -q "Listen $PORT" /etc/apache2/ports.conf; then
    echo "Listen $PORT" | sudo tee -a /etc/apache2/ports.conf > /dev/null
fi

echo "➡️ Ativando site e reiniciando Apache"
sudo a2ensite "${SITE_NAME}.conf"
sudo systemctl restart apache2

echo "✅ Apache configurado! Acesse em: http://<IP-DA-SUA-VM>:${PORT}/"