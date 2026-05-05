PASSO 1 — Entrar no container
docker exec -it nginx-proxy-manager bash
PASSO 2 — Resetar usuário admin

Rode:

npm install bcryptjs
node
PASSO 3 — Dentro do node

Cole:

require('bcryptjs').hash('NovaSenhaAqui', 10).then(console.log)

Exemplo:

require('bcryptjs').hash('Senha123!', 10).then(console.log)

Ele retornará um hash.

PASSO 4 — Abrir SQLite

Ainda dentro do container:

sqlite3 /data/database.sqlite
PASSO 5 — Atualizar senha
UPDATE user
SET password = 'HASH_GERADO'
WHERE id = 1;
PASSO 6 — Sair
.quit
PASSO 7 — Reiniciar container
exit
docker restart nginx-proxy-manager
E aí logar novamente

Email:

admin@example.com

Senha:

a nova que definiu
