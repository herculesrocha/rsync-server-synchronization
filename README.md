# Rsync Intranet FreeBSD

Projeto de sincronização de arquivos entre servidores FreeBSD utilizando **rsync**, com foco em:

- Confiabilidade
- Auditoria
- Rastreabilidade
- Boas práticas (ISO 27001 / ITIL)

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

No ambiente de Produção:

