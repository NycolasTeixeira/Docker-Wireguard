# Arquitetura

Fedora Host
└── Docker
    ├── WireGuard
    ├── Portainer
    ├── Nextcloud
    └── Monitoring

Acesso externo:
Internet → WireGuard → VPN → Serviços internos
