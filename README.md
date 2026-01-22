# Rsync em servidores FreeBSD

Projeto utilizado em abiente de produção, para sincronização de arquivos entre servidores FreeBSD utilizando **rsync**, com foco em:

- Confiabilidade
- Auditoria
- Rastreabilidade
- Boas práticas

O projeto contempla:
- Sincronização via **SSH (sem daemon)**
- Backup automático de arquivos deletados
- Compactação e retenção
- Logs auditáveis
- Monitoramento via Zabbix

Neste ambienete não foi cogitado o Rsync Daemon, mesmo com a boa performace, foi levado em conta a falta de Criptografia e uso desse recurso fora do ambiente interno.
---

## 📌 Arquitetura

| Papel | Descrição |
|-----|-----------|
| Server Principal | Origem dos arquivos |
| Server Secundário | Destino da sincronização |

Ambiente de Produção:
Server Principal → Server Secundário

---

## 📖 Documentação Completa (Wiki)

A documentação detalhada está disponível na **Wiki do projeto**:

👉[runbook-rsync](https://github.com/herculesrocha/rsync-server-synchronization/wiki/Runbook-%E2%80%93-Sincroniza%C3%A7%C3%A3o-de-Arquivos-com-Rsync-(FreeBSD))

 Conteúdo da Wiki:
- Instalação
- Configuração rsync
- Scripts comentados
- Cron
- Monitoramento
- Troubleshooting
- Restore

---

## 🚀 Scripts Disponíveis

| Script | Descrição |
|-----|-----------|
| `rsync-ssh.sh` | Sincronização via SSH (sem daemon) |

---

## 🔐 Segurança & Compliance

- Princípio do menor privilégio
- Logs versionados
- Backup antes de deleção
- Retenção configurável
- Separação Origem x Destino

---

## 🧾 Autor

**Hercules Rocha**  
Infraestrutura / Sistemas  
FreeBSD • Linux • Automação • Monitoramento
