# 🔧 Como Mudar Usuário no Git

## 📋 Guia Rápido

---

## 🎯 Método 1: Mudar Globalmente (Todos os Projetos)

### Ver Configuração Atual

```bash
# Ver nome atual
git config --global user.name

# Ver email atual
git config --global user.email

# Ver todas as configurações
git config --global --list
```

### Mudar Usuário

```bash
# Mudar nome
git config --global user.name "Seu Novo Nome"

# Mudar email
git config --global user.email "seu-novo-email@exemplo.com"
```

### Verificar Mudança

```bash
git config --global user.name
git config --global user.email
```

✅ **Pronto!** Agora todos os commits usarão o novo usuário.

---

## 🎯 Método 2: Mudar Apenas para Este Projeto

### Configurar Usuário Local

```bash
# Na pasta do projeto
cd seu-projeto

# Configurar nome (só para este projeto)
git config user.name "Nome Específico"

# Configurar email (só para este projeto)
git config user.email "email-especifico@exemplo.com"
```

### Verificar

```bash
# Ver configuração local
git config user.name
git config user.email

# Ver todas as configurações (local + global)
git config --list
```

---

## 🔄 Método 3: Mudar Credenciais do GitHub

### Windows

#### Opção 1: Credential Manager

1. Abra o **Gerenciador de Credenciais**
   - Pressione `Win + R`
   - Digite: `control /name Microsoft.CredentialManager`
   - Enter

2. Clique em **"Credenciais do Windows"**

3. Procure por:
   - `git:https://github.com`
   - ou `github.com`

4. Clique em **"Remover"**

5. No próximo `git push`, vai pedir novas credenciais

#### Opção 2: Linha de Comando

```bash
# Remover credenciais salvas
git credential-manager-core erase
# ou
git credential reject
```

### Linux/Mac

```bash
# Remover credenciais salvas
git config --global --unset credential.helper

# Ou limpar cache
git credential-cache exit
```

---

## 🔐 Método 4: Usar Personal Access Token

### Passo 1: Criar Token

1. Acesse: https://github.com/settings/tokens
2. Clique **"Generate new token"** > **"Generate new token (classic)"**
3. Preencha:
   - **Note:** `Token para rice-disease-detection`
   - **Expiration:** 90 days
   - **Scopes:** Marque `repo` (todos)
4. Clique **"Generate token"**
5. **COPIE O TOKEN!** (não vai aparecer de novo)

### Passo 2: Usar Token

Quando fizer `git push`, use:
- **Username:** seu-usuario-github
- **Password:** cole-o-token-aqui

### Passo 3: Salvar Token (Opcional)

```bash
# Salvar credenciais
git config --global credential.helper store

# Próximo push vai salvar automaticamente
git push
```

---

## 🎯 Método 5: Mudar Remote URL

### Ver URL Atual

```bash
git remote -v
```

### Mudar para Incluir Usuário

```bash
# Formato: https://USUARIO@github.com/USUARIO/REPO.git
git remote set-url origin https://seu-usuario@github.com/seu-usuario/rice-disease-detection.git
```

### Verificar

```bash
git remote -v
```

---

## 🔄 Método 6: Usar SSH (Recomendado)

### Passo 1: Gerar Chave SSH

```bash
# Gerar chave
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Pressione Enter 3 vezes (aceita padrões)
```

### Passo 2: Copiar Chave Pública

**Windows:**
```bash
type %USERPROFILE%\.ssh\id_ed25519.pub
```

**Linux/Mac:**
```bash
cat ~/.ssh/id_ed25519.pub
```

Copie a saída completa!

### Passo 3: Adicionar no GitHub

1. Acesse: https://github.com/settings/keys
2. Clique **"New SSH key"**
3. Preencha:
   - **Title:** `Meu Computador`
   - **Key:** Cole a chave pública
4. Clique **"Add SSH key"**

### Passo 4: Mudar Remote para SSH

```bash
# Ver remote atual
git remote -v

# Mudar para SSH
git remote set-url origin git@github.com:seu-usuario/rice-disease-detection.git

# Verificar
git remote -v
```

### Passo 5: Testar

```bash
# Testar conexão SSH
ssh -T git@github.com

# Deve aparecer: "Hi seu-usuario! You've successfully authenticated..."
```

---

## 📝 Exemplos Práticos

### Exemplo 1: Trocar de Conta Pessoal para Trabalho

```bash
# Ver configuração atual
git config --global user.name
git config --global user.email

# Mudar para conta de trabalho
git config --global user.name "Seu Nome Profissional"
git config --global user.email "voce@empresa.com"

# Limpar credenciais antigas
git credential reject

# Próximo push vai pedir novas credenciais
```

### Exemplo 2: Usar Conta Diferente em Projeto Específico

```bash
# Entrar na pasta do projeto
cd meu-projeto-especial

# Configurar usuário só para este projeto
git config user.name "Nome Alternativo"
git config user.email "email-alternativo@exemplo.com"

# Verificar
git config user.name  # Mostra nome local
git config --global user.name  # Mostra nome global
```

### Exemplo 3: Corrigir Último Commit com Usuário Errado

```bash
# Mudar autor do último commit
git commit --amend --author="Nome Correto <email-correto@exemplo.com>"

# Forçar push (cuidado!)
git push --force
```

---

## 🔍 Verificar Configurações

### Ver Todas as Configurações

```bash
# Configurações globais
git config --global --list

# Configurações locais (projeto atual)
git config --local --list

# Todas as configurações
git config --list --show-origin
```

### Ver Onde Está Configurado

```bash
# Mostra de onde vem cada configuração
git config --list --show-origin | grep user
```

---

## 🐛 Solução de Problemas

### Problema: "Permission denied"

**Causa:** Credenciais antigas ou incorretas

**Solução:**
```bash
# Windows
# Remover do Gerenciador de Credenciais

# Linux/Mac
git config --global --unset credential.helper
git credential-cache exit
```

### Problema: "Author identity unknown"

**Causa:** Git não sabe quem você é

**Solução:**
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### Problema: Commits com Usuário Errado

**Solução 1: Corrigir Último Commit**
```bash
git commit --amend --author="Nome Correto <email@correto.com>"
```

**Solução 2: Corrigir Múltiplos Commits**
```bash
# CUIDADO: Reescreve histórico!
git filter-branch --env-filter '
OLD_EMAIL="email-errado@exemplo.com"
CORRECT_NAME="Nome Correto"
CORRECT_EMAIL="email-correto@exemplo.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
```

---

## 📊 Resumo dos Comandos

### Configuração Básica

```bash
# Ver usuário atual
git config user.name
git config user.email

# Mudar globalmente
git config --global user.name "Novo Nome"
git config --global user.email "novo@email.com"

# Mudar localmente (só este projeto)
git config user.name "Nome Local"
git config user.email "email@local.com"

# Remover configuração
git config --global --unset user.name
git config --global --unset user.email
```

### Credenciais

```bash
# Ver remote
git remote -v

# Mudar remote
git remote set-url origin https://novo-usuario@github.com/usuario/repo.git

# Limpar credenciais
git credential reject

# Salvar credenciais
git config --global credential.helper store
```

---

## ✅ Checklist

- [ ] Configurei nome correto
- [ ] Configurei email correto
- [ ] Limpei credenciais antigas
- [ ] Testei com `git config --list`
- [ ] Fiz commit de teste
- [ ] Push funcionou com novo usuário

---

## 🎯 Dica Pro

### Usar Múltiplas Contas

Crie arquivo `~/.gitconfig`:

```ini
[user]
    name = Nome Padrão
    email = email-padrao@exemplo.com

[includeIf "gitdir:~/trabalho/"]
    path = ~/.gitconfig-trabalho

[includeIf "gitdir:~/pessoal/"]
    path = ~/.gitconfig-pessoal
```

Crie `~/.gitconfig-trabalho`:
```ini
[user]
    name = Nome Trabalho
    email = voce@empresa.com
```

Crie `~/.gitconfig-pessoal`:
```ini
[user]
    name = Nome Pessoal
    email = pessoal@email.com
```

Agora cada pasta usa configuração diferente automaticamente!

---

## 📚 Recursos

- **Git Docs:** https://git-scm.com/docs/git-config
- **GitHub Docs:** https://docs.github.com/en/authentication
- **SSH Guide:** https://docs.github.com/en/authentication/connecting-to-github-with-ssh

---

<div align="center">

**✅ Usuário Alterado com Sucesso!**

*Agora você pode fazer commits com o usuário correto*

</div>
