# Erro

Permission denied em /config

# Causa

SELinux bloqueando bind mount Docker

# Solução

Adicionar :Z no volume no docker-compose


# Troubleshooting — Nginx Proxy Manager não acessava o Portainer

## Cenário

Objetivo:
- acessar o Portainer através do Nginx Proxy Manager
- utilizando hostname interno:
  
```txt
portainer.internal


Solução aplicada
Ajuste do docker-compose.yml

Antes:

ports:
  - 81:81

Depois:

ports:
  - 80:80
  - 81:81
  - 443:443
Recriação dos containers

Comandos:

docker compose down
docker compose up -d
Verificação das portas publicadas

Comando:

docker ps

Resultado esperado:

0.0.0.0:80->80/tcp
0.0.0.0:81->81/tcp
0.0.0.0:443->443/tcp
Configuração do Proxy Host

No NPM:

Domain Name
portainer.internal
Forward Hostname
portainer
Forward Port
9000
Ajuste do /etc/hosts

Arquivo:

/etc/hosts

Linha adicionada:

127.0.0.1 portainer.internal

Erro encontrado anteriormente:

192.168.8.1 portainer internal

Problema:

espaço separava os hostnames
criava:
portainer
internal

e não:

portainer.internal
Validação final
Teste de resolução DNS local
getent hosts portainer.internal

Resultado:

127.0.0.1 portainer.internal
Teste HTTP final
curl http://portainer.internal

Resultado:

<a href="/timeout.html">Temporary Redirect</a>

Conclusão:

reverse proxy funcional
hostname interno funcional
comunicação Docker validada
Portainer acessível via proxy
Conceitos aprendidos
diferença entre:
expose
ports
funcionamento do:
reverse proxy
Docker networking
importância da:
porta 80
porta 443
utilização de:
hostnames internos
resolução local via /etc/hosts
troubleshooting de:
comunicação entre containers
publicação de portas
resolução DNS local
Estado final da arquitetura
Cliente
   ↓
portainer.internal
   ↓
Nginx Proxy Manager (80/443)
   ↓
Portainer (9000)
