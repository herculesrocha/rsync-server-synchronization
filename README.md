# Rsync em servidores FreeBSD

Projeto utilizado em abiente de produção, para sincronização de arquivos entre servidores FreeBSD utilizando **rsync**, com foco em:

- Confiabilidade
- Auditoria
- Rastreabilidade
- Boas práticas

O projeto contempla:
- Sincronização via **rsync daemon**
- Sincronização via **SSH (sem daemon)**
- Backup automático de arquivos deletados
- Compactação e retenção
- Logs auditáveis
- Monitoramento via Zabbix

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

[runbook-rsync](/rsync-server-synchronization/wiki/runbook-rsync.md)

👉 **https://github.com/SEU-USUARIO/rsync-intranet-freebsd/wiki**

Conteúdo da Wiki:
- Instalação
- Configuração rsync daemon
- Configuração rsync via SSH
- Scripts comentados
- Cron
- Monitoramento
- Troubleshooting
- Restore
- Conformidade ISO / ITIL

---

## 🚀 Scripts Disponíveis

| Script | Descrição |
|-----|-----------|
| `rsync-daemon.sh` | Sincronização via rsync daemon |
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
