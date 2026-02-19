# 🚀 Guia Completo: Como Publicar no GitHub

## Passo a Passo Simples

---

## 📋 Pré-requisitos

### 1. Criar Conta no GitHub

Se ainda não tem:
1. Acesse: https://github.com/signup
2. Preencha email, senha e username
3. Verifique seu email
4. ✅ Conta criada!

### 2. Instalar Git

**Windows:**
1. Baixe: https://git-scm.com/download/win
2. Execute o instalador
3. Use configurações padrão
4. Clique "Next" até finalizar

**Verificar instalação:**
```bash
git --version
```

---

## 🎯 Método 1: GitHub Desktop (Mais Fácil)

### Passo 1: Instalar GitHub Desktop

1. Baixe: https://desktop.github.com/
2. Instale e abra
3. Faça login com sua conta GitHub

### Passo 2: Criar Repositório

1. No GitHub Desktop, clique em **"File"** > **"New Repository"**
2. Preencha:
   - **Name:** `rice-disease-detection`
   - **Description:** `Sistema de identificação de doenças em folhas de arroz usando Deep Learning`
   - **Local Path:** Escolha onde está seu projeto
   - ✅ Initialize with README (desmarque, já temos)
   - ✅ Git ignore: Python
   - ✅ License: MIT

3. Clique **"Create Repository"**

### Passo 3: Adicionar Arquivos

1. Copie todos os arquivos do projeto para a pasta do repositório
2. No GitHub Desktop, você verá todos os arquivos na aba "Changes"
3. Escreva uma mensagem: `feat: adiciona projeto completo de TCC`
4. Clique **"Commit to main"**

### Passo 4: Publicar

1. Clique **"Publish repository"**
2. Escolha:
   - ✅ Public (para todos verem)
   - ou Private (só você e colaboradores)
3. Clique **"Publish Repository"**

🎉 **Pronto! Seu projeto está no GitHub!**

Acesse: `https://github.com/seu-usuario/rice-disease-detection`

---

## 🎯 Método 2: Linha de Comando (Tradicional)

### Passo 1: Configurar Git (Primeira vez)

```bash
# Configure seu nome
git config --global user.name "Seu Nome"

# Configure seu email (mesmo do GitHub)
git config --global user.email "seu-email@exemplo.com"

# Verifique
git config --list
```

### Passo 2: Criar Repositório no GitHub

1. Acesse: https://github.com/new
2. Preencha:
   - **Repository name:** `rice-disease-detection`
   - **Description:** `Sistema de identificação de doenças em folhas de arroz usando Deep Learning`
   - **Public** ou **Private**
   - ❌ NÃO marque "Add a README file"
   - ❌ NÃO adicione .gitignore (já temos)
   - ❌ NÃO escolha license (já temos)
3. Clique **"Create repository"**

### Passo 3: Inicializar Git Local

Abra o terminal na pasta do seu projeto:

```bash
# Navegue até a pasta do projeto
cd caminho/para/seu/projeto

# Inicialize o Git
git init

# Adicione todos os arquivos
git add .

# Faça o primeiro commit
git commit -m "feat: adiciona projeto completo de TCC"
```

### Passo 4: Conectar ao GitHub

```bash
# Adicione o repositório remoto (substitua SEU-USUARIO)
git remote add origin https://github.com/SEU-USUARIO/rice-disease-detection.git

# Renomeie a branch para main (se necessário)
git branch -M main

# Envie para o GitHub
git push -u origin main
```

🎉 **Pronto! Projeto publicado!**

---

## 🔐 Autenticação

### Opção 1: Personal Access Token (Recomendado)

1. Acesse: https://github.com/settings/tokens
2. Clique **"Generate new token"** > **"Generate new token (classic)"**
3. Preencha:
   - **Note:** `Token para rice-disease-detection`
   - **Expiration:** 90 days (ou No expiration)
   - **Scopes:** Marque `repo` (todos)
4. Clique **"Generate token"**
5. **COPIE O TOKEN** (não vai aparecer de novo!)

Quando pedir senha no git push, use o token ao invés da senha.

### Opção 2: SSH (Avançado)

```bash
# Gerar chave SSH
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Copiar chave pública
cat ~/.ssh/id_ed25519.pub

# Adicionar no GitHub:
# Settings > SSH and GPG keys > New SSH key
# Cole a chave e salve
```

---

## 📝 Comandos Git Essenciais

### Adicionar Mudanças

```bash
# Ver status
git status

# Adicionar arquivo específico
git add arquivo.txt

# Adicionar todos os arquivos
git add .

# Fazer commit
git commit -m "descrição da mudança"

# Enviar para GitHub
git push
```

### Ver Histórico

```bash
# Ver commits
git log

# Ver mudanças
git diff
```

### Atualizar do GitHub

```bash
# Baixar mudanças
git pull
```

---

## 🎨 Personalizar Repositório

### 1. Editar About

No GitHub, na página do repositório:
1. Clique na engrenagem ⚙️ ao lado de "About"
2. Preencha:
   - **Description:** `Sistema de identificação de doenças em folhas de arroz usando Deep Learning - TCC 2023`
   - **Website:** (se tiver)
   - **Topics:** `deep-learning`, `tensorflow`, `keras`, `agriculture`, `computer-vision`, `cnn`, `rice`, `disease-detection`, `machine-learning`, `python`
3. Salve

### 2. Adicionar Imagens

```bash
# Criar pasta para imagens
mkdir images

# Adicionar suas imagens
# Depois:
git add images/
git commit -m "docs: adiciona imagens do projeto"
git push
```

### 3. Atualizar README com Links

Edite o README.md e substitua:
- `[usuario]` → seu username do GitHub
- `[repositorio]` → `rice-disease-detection`

```bash
git add README.md
git commit -m "docs: atualiza links do README"
git push
```

---

## 📊 Organizar Arquivos (Opcional)

### Mover Documentação para Pasta docs/

```bash
# Criar pasta docs
mkdir docs

# Mover arquivos
move DOCUMENTACAO_ACADEMICA.md docs/
move INSTALL.md docs/
move QUICKSTART.md docs/
move DATASET.md docs/
move CONTRIBUTING.md docs/
move CITATION.md docs/
move CHANGELOG.md docs/
move BADGES.md docs/
move EXECUTIVE_SUMMARY.md docs/
move GITHUB_SETUP.md docs/
move INDEX.md docs/
move SUMMARY.md docs/
move GUIA_PUBLICACAO_GITHUB.md docs/

# Commit
git add .
git commit -m "docs: organiza documentação em pasta docs/"
git push
```

### Atualizar Links no README

Depois de mover, atualize os links:
```markdown
[Documentação](docs/DOCUMENTACAO_ACADEMICA.md)
[Instalação](docs/INSTALL.md)
```

---

## 🚀 Criar Release

### Passo 1: Criar Tag

```bash
git tag -a v1.0.0 -m "Release inicial - TCC 2023"
git push origin v1.0.0
```

### Passo 2: Criar Release no GitHub

1. Vá em **"Releases"** > **"Create a new release"**
2. Preencha:
   - **Tag:** v1.0.0
   - **Title:** v1.0.0 - Release Inicial
   - **Description:**
   ```markdown
   ## 🎉 Release Inicial - TCC 2023
   
   ### ✨ Funcionalidades
   - Modelo CNN com 98.93% de acurácia
   - Transfer Learning com VGG16
   - Dataset com 7,123 imagens
   - Documentação completa
   
   ### 📦 Arquivos
   - Modelos treinados (.keras)
   - Notebooks Jupyter
   - Documentação completa
   ```
3. Anexe arquivos (modelos, se quiser)
4. Clique **"Publish release"**

---

## 🔄 Workflow Diário

### Fazer Mudanças

```bash
# 1. Ver o que mudou
git status

# 2. Adicionar mudanças
git add .

# 3. Fazer commit
git commit -m "feat: adiciona nova funcionalidade"

# 4. Enviar para GitHub
git push
```

### Tipos de Commit

Use prefixos:
- `feat:` - Nova funcionalidade
- `fix:` - Correção de bug
- `docs:` - Documentação
- `style:` - Formatação
- `refactor:` - Refatoração
- `test:` - Testes
- `chore:` - Manutenção

Exemplos:
```bash
git commit -m "feat: adiciona suporte para mais doenças"
git commit -m "fix: corrige erro no carregamento de imagens"
git commit -m "docs: atualiza README com novos exemplos"
```

---

## 🐛 Solução de Problemas

### Erro: "Permission denied"

**Solução:** Use Personal Access Token ao invés de senha

### Erro: "Repository not found"

**Solução:** Verifique se o URL está correto:
```bash
git remote -v
git remote set-url origin https://github.com/SEU-USUARIO/rice-disease-detection.git
```

### Erro: "Failed to push"

**Solução:** Atualize antes de enviar:
```bash
git pull origin main
git push
```

### Arquivos Grandes

GitHub tem limite de 100MB por arquivo.

**Solução:** Use Git LFS:
```bash
# Instalar Git LFS
git lfs install

# Rastrear arquivos grandes
git lfs track "*.keras"
git lfs track "*.h5"

# Commit
git add .gitattributes
git commit -m "chore: adiciona Git LFS"
git push
```

---

## ✅ Checklist Final

Antes de considerar publicado:

- [ ] Repositório criado no GitHub
- [ ] Todos os arquivos enviados
- [ ] README.md atualizado com links corretos
- [ ] About configurado (descrição + topics)
- [ ] Imagens adicionadas (logo, screenshots)
- [ ] .gitignore configurado
- [ ] LICENSE presente
- [ ] Release criada (opcional)
- [ ] Colaboradores adicionados (colega de TCC)
- [ ] Repositório público/privado conforme desejado

---

## 🎯 Próximos Passos

### 1. Compartilhar

```markdown
🎉 Acabei de publicar meu TCC no GitHub!

Sistema de identificação de doenças em folhas de arroz usando Deep Learning
✅ 98.93% de acurácia
✅ 7,123 imagens
✅ Código open-source

Confira: https://github.com/SEU-USUARIO/rice-disease-detection

#MachineLearning #DeepLearning #Agriculture #TensorFlow #AI
```

### 2. Adicionar ao LinkedIn

1. Vá em **"Add profile section"** > **"Projects"**
2. Preencha:
   - **Project name:** Identificação de Doenças em Arroz com Deep Learning
   - **Description:** Sistema de classificação automática...
   - **Project URL:** Link do GitHub

### 3. Manter Atualizado

```bash
# Sempre que fizer mudanças:
git add .
git commit -m "descrição"
git push
```

---

## 📚 Recursos Úteis

- **GitHub Docs:** https://docs.github.com
- **Git Cheat Sheet:** https://education.github.com/git-cheat-sheet-education.pdf
- **GitHub Desktop:** https://desktop.github.com/
- **Git Tutorial:** https://git-scm.com/docs/gittutorial

---

## 🆘 Precisa de Ajuda?

1. **GitHub Community:** https://github.community/
2. **Stack Overflow:** https://stackoverflow.com/questions/tagged/git
3. **YouTube:** Procure "como usar git e github"

---

<div align="center">

**🎉 Parabéns! Seu projeto está no GitHub!**

*Agora o mundo pode ver seu trabalho!*

[⭐ Dê uma estrela no seu próprio repo!](https://github.com/SEU-USUARIO/rice-disease-detection)

</div>
