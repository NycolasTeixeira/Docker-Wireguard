# Self-Hosted VPN Docker Stack

Infraestrutura self-hosted utilizando Docker, WireGuard, Portainer e Nginx Proxy Manager para acesso remoto seguro via VPN, gerenciamento centralizado de containers e publicação controlada de serviços internos.

---

# Visão Geral

Este projeto foi criado com foco em:

* laboratório de redes
* estudos DevOps/SysAdmin
* infraestrutura self-hosted
* acesso remoto seguro
* gerenciamento de containers
* serviços internos protegidos por VPN
* documentação técnica
* futura expansão para monitoramento e automação

A stack foi desenvolvida inicialmente em Fedora Linux utilizando Docker Compose.

---

# Tecnologias Utilizadas

| Tecnologia          | Função                         |
| ------------------- | ------------------------------ |
| Docker              | Orquestração dos containers    |
| Docker Compose      | Gerenciamento da stack         |
| WireGuard           | VPN segura e leve              |
| Portainer           | Gerenciamento visual do Docker |
| Nginx Proxy Manager | Reverse proxy interno          |
| Fedora Linux        | Sistema operacional host       |
| IPv6                | Acesso remoto moderno          |
| Firewalld           | Controle de firewall           |
| SELinux             | Camada adicional de segurança  |

---

# Arquitetura

```text
                [ Internet ]
                      |
                      v
              [ IPv6 Público ]
                      |
                      v
              [ WireGuard VPN ]
                      |
                      v
              [ Docker Network ]
                 internal_net
                      |
        ┌─────────────┼─────────────┐
        │             │             │
        v             v             v
 [ Portainer ] [ NPM Proxy ] [ Serviços ]
                                      │
                         ┌────────────┼────────────┐
                         │            │            │
                         v            v            v
                    Nextcloud      Grafana      Zabbix
```

---

# Estrutura do Projeto

```bash
vpn-docker/
├── docker-compose.yml
├── .gitignore
├── README.md
├── docs/
├── scripts/
├── templates/
├── backups/
├── data/
└── volumes/
```

---

# Estrutura Detalhada

## docs/

Documentação técnica do ambiente.

| Arquivo                | Descrição                  |
| ---------------------- | -------------------------- |
| arquitetura.md         | Estrutura geral da stack   |
| firewall.md            | Configuração do firewall   |
| ipv6.md                | Configuração e testes IPv6 |
| nginx-proxy-manager.md | Configuração do proxy      |
| portainer.md           | Gerenciamento Docker       |
| SElinux.md             | Ajustes SELinux            |
| troubleshooting.md     | Problemas encontrados      |
| wireguard.md           | Configuração WireGuard     |

---

## templates/

Arquivos de exemplo para reutilização futura.

| Arquivo            | Função                            |
| ------------------ | --------------------------------- |
| wg0.conf.example   | Exemplo de configuração WireGuard |
| peer-template.conf | Template para novos peers         |

---

## volumes/

Armazena dados persistentes dos containers.

⚠️ Esta pasta NÃO deve ser enviada para o GitHub.

Ela contém:

* chaves privadas
* bancos SQLite
* certificados
* peers WireGuard
* logs
* configurações reais dos serviços

---

# Containers Ativos

## WireGuard

Container responsável pela VPN.

### Funções

* acesso remoto seguro
* criação de peers
* tunelamento interno
* isolamento dos serviços
* comunicação privada

### Porta utilizada

```text
51820/UDP
```

---

## Portainer

Interface gráfica para gerenciamento Docker.

### Funções

* gerenciamento de containers
* visualização de logs
* restart de serviços
* gerenciamento de volumes
* gerenciamento de redes Docker

### Acesso

O serviço fica protegido internamente via reverse proxy.

---

## Nginx Proxy Manager

Reverse proxy interno da infraestrutura.

### Funções

* roteamento HTTP/HTTPS
* proxy reverso interno
* gerenciamento SSL
* centralização de acesso
* publicação controlada de serviços

### Porta administrativa

```text
81/TCP
```

---

# Segurança

A stack foi estruturada priorizando:

* containers isolados
* acesso interno via VPN
* firewall ativo
* uso de SELinux
* separação de volumes persistentes
* serviços internos sem exposição direta
* documentação das alterações críticas

---

# IPv6

O ambiente utiliza conectividade IPv6 para acesso remoto.

## Benefícios

* acesso direto sem CGNAT
* melhor conectividade moderna
* facilidade de tunelamento
* laboratório de redes IPv6

---

# Firewall

O host utiliza Firewalld.

## Portas liberadas

| Porta     | Serviço       |
| --------- | ------------- |
| 22/TCP    | SSH           |
| 51820/UDP | WireGuard     |
| 80/TCP    | Reverse Proxy |
| 81/TCP    | Painel NPM    |
| 443/TCP   | HTTPS         |

---

# SELinux

O projeto utiliza volumes Docker compatíveis com SELinux utilizando:

```yaml
:Z
```

Isso permite:

* persistência segura
* isolamento de contexto
* compatibilidade com Fedora

---

# GitHub e Segurança

## Arquivos ignorados

O projeto utiliza `.gitignore` para evitar exposição de:

* peers WireGuard
* bancos de dados
* certificados
* logs
* arquivos temporários
* volumes persistentes

---

# Roadmap

## Próximas implementações

* [ ] Nextcloud
* [ ] Grafana
* [ ] Zabbix
* [ ] Backup automatizado
* [ ] Dashboard interno
* [ ] Autenticação centralizada
* [ ] Scripts automatizados
* [ ] CI/CD
* [ ] Monitoramento de containers
* [ ] Failover VPN

---

# Objetivo do Projeto

Este projeto serve como:

* laboratório pessoal
* ambiente de estudos
* infraestrutura self-hosted
* documentação técnica
* base para consultoria
* prática de DevOps/SysAdmin

---

# Troubleshooting

Diversos problemas e soluções encontrados durante a montagem foram documentados em:

```text
docs/troubleshooting.md
```

Incluindo:

* problemas de bind mount
* permissões SELinux
* comunicação Docker interna
* reverse proxy
* configuração IPv6
* resolução DNS interna
* troubleshooting WireGuard

---

# Requisitos

## Host

* Fedora Linux
* Docker
* Docker Compose
* Firewalld
* Kernel com suporte WireGuard

---

# Inicialização

## Subir stack

```bash
docker compose up -d
```

---

## Derrubar stack

```bash
docker compose down
```

---

## Verificar containers

```bash
docker ps
```

---

# Observações

Este projeto está em constante evolução.

A ideia principal é construir uma infraestrutura modular self-hosted focada em:

* segurança
* automação
* escalabilidade
* documentação
* gerenciamento remoto

---

# Autor

Nycolas Teixeira

Projeto desenvolvido para estudos, laboratório pessoal e evolução técnica em infraestrutura Linux, redes e ambientes self-hosted.

