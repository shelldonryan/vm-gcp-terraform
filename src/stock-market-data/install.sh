#!/bin/bash

SITE_NAME="yfinance"
DATA_DIR="/home/yfinance-data"
PORT="8080"
CONF_FILE="/etc/apache2/sites-available/${SITE_NAME}.conf"

echo "➡️ Instalando Apache (caso necessário)..."
sudo apt update
sudo apt install -y apache2

echo "➡️ Criando diretório: $DATA_DIR"
sudo mkdir -p "$DATA_DIR"
sudo chmod -R 755 "$DATA_DIR"

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

echo "➡️ Iniciando servidor HTTP Python na porta ${PORT}..."
python3 -m http.server ${PORT} --directory "${DATA_DIR}" &

echo "✅ Apache configurado e servidor HTTP Python rodando! Acesse em: http://<IP-DA-SUA-VM>:${PORT}/"