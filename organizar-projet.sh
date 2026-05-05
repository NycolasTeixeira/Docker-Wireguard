#!/bin/bash

echo "====================================="
echo " ORGANIZANDO ESTRUTURA DO PROJETO"
echo "====================================="

cd ~/vpn-docker || exit

echo "[+] Criando nova estrutura..."

mkdir -p volumes/nginx
mkdir -p volumes/portainer
mkdir -p volumes/wireguard

mkdir -p templates
mkdir -p scripts

echo "[+] Movendo dados do Nginx Proxy Manager..."

if [ -d "nginx/data" ]; then
    mv nginx/data volumes/nginx/
fi

if [ -d "nginx/letsencrypt" ]; then
    mv nginx/letsencrypt volumes/nginx/
fi

echo "[+] Movendo dados do Portainer..."

if [ -d "portainer" ]; then
    mv portainer/* volumes/portainer/ 2>/dev/null
fi

echo "[+] Movendo configs reais do WireGuard..."

if [ -d "wireguard/config" ]; then
    mv wireguard/config/* volumes/wireguard/ 2>/dev/null
fi

echo "[+] Movendo templates WireGuard..."

if [ -f "volumes/wireguard/wg_confs/wg0.conf.example" ]; then
    mv volumes/wireguard/wg_confs/wg0.conf.example templates/
fi

if [ -d "volumes/wireguard/peer-template.conf" ]; then
    mv volumes/wireguard/peer-template.conf/peer-template.conf templates/
    rm -rf volumes/wireguard/peer-template.conf
fi

echo "[+] Limpando diretórios antigos vazios..."

rm -rf nginx
rm -rf portainer
rm -rf wireguard/config

mkdir -p nginx
mkdir -p portainer
mkdir -p wireguard

echo "[+] Criando .gitignore..."

cat > .gitignore << 'EOF'
# Runtime volumes
volumes/

# Environment
.env

# Logs
*.log

# SQLite
*.sqlite

# Backups
backups/

# Sensitive docs
docs/logins.md

# Temporary
tmp/
.cache/
EOF

echo "[+] Estrutura final:"
tree -L 3

echo ""
echo "====================================="
echo " FINALIZADO COM SUCESSO"
echo "====================================="
echo ""
echo "IMPORTANTE:"
echo "Agora você PRECISA ajustar o docker-compose.yml"
echo ""
echo "Troque:"
echo "./nginx/data"
echo "por:"
echo "./volumes/nginx/data"
echo ""
echo "Troque:"
echo "./nginx/letsencrypt"
echo "por:"
echo "./volumes/nginx/letsencrypt"
echo ""
echo "Troque:"
echo "./portainer"
echo "por:"
echo "./volumes/portainer"
echo ""
echo "Troque:"
echo "./wireguard/config"
echo "por:"
echo "./volumes/wireguard"
echo ""
