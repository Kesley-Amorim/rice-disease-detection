# ⚡ Publicar no GitHub - Guia Rápido

## 🎯 3 Formas de Publicar

---

## 1️⃣ FORMA MAIS FÁCIL: GitHub Desktop

### ✅ Vantagens
- Interface visual
- Sem comandos
- Ideal para iniciantes

### 📝 Passos

1. **Baixe e instale:** https://desktop.github.com/

2. **Faça login** com sua conta GitHub

3. **Crie repositório:**
   - File > New Repository
   - Name: `rice-disease-detection`
   - Local Path: Escolha a pasta do projeto
   - Create Repository

4. **Adicione arquivos:**
   - Copie todos os arquivos para a pasta
   - Escreva mensagem: `feat: projeto completo`
   - Clique "Commit to main"

5. **Publique:**
   - Clique "Publish repository"
   - Escolha Public ou Private
   - Publish!

✅ **Pronto!** Acesse: `github.com/seu-usuario/rice-disease-detection`

---

## 2️⃣ FORMA AUTOMÁTICA: Script

### ✅ Vantagens
- Automatizado
- Rápido
- Sem erros

### 📝 Passos

**Windows:**
```bash
# Execute o script
publicar.bat
```

**Linux/Mac:**
```bash
# Dê permissão
chmod +x publicar.sh

# Execute
./publicar.sh
```

Siga as instruções na tela!

---

## 3️⃣ FORMA MANUAL: Linha de Comando

### ✅ Vantagens
- Controle total
- Aprende Git
- Profissional

### 📝 Passos

```bash
# 1. Configure Git (primeira vez)
git config --global user.name "Seu Nome"
git config --global user.email "seu-email@exemplo.com"

# 2. Inicialize
git init

# 3. Adicione arquivos
git add .

# 4. Faça commit
git commit -m "feat: adiciona projeto completo de TCC"

# 5. Conecte ao GitHub (substitua SEU-USUARIO)
git remote add origin https://github.com/SEU-USUARIO/rice-disease-detection.git

# 6. Envie
git branch -M main
git push -u origin main
```

---

## 🔐 Autenticação

### Obter Personal Access Token

1. Acesse: https://github.com/settings/tokens
2. "Generate new token" > "Generate new token (classic)"
3. Marque: `repo` (todos)
4. "Generate token"
5. **COPIE O TOKEN!**

Quando pedir senha no git push, use o token!

---

## ✅ Checklist Antes de Publicar

- [ ] Conta no GitHub criada
- [ ] Git instalado
- [ ] Repositório criado no GitHub (https://github.com/new)
- [ ] Arquivos prontos
- [ ] Personal Access Token obtido

---

## 🎨 Depois de Publicar

### 1. Configure o About

No GitHub, clique na engrenagem ⚙️:
- **Description:** `Sistema de identificação de doenças em folhas de arroz usando Deep Learning - TCC 2023`
- **Topics:** `deep-learning`, `tensorflow`, `keras`, `agriculture`, `computer-vision`

### 2. Adicione Imagens

```bash
# Crie pasta
mkdir images

# Adicione suas imagens
# Depois:
git add images/
git commit -m "docs: adiciona imagens"
git push
```

### 3. Atualize Links

Edite README.md e substitua:
- `[usuario]` → seu username
- `[repositorio]` → `rice-disease-detection`

```bash
git add README.md
git commit -m "docs: atualiza links"
git push
```

---

## 🐛 Problemas Comuns

### "Permission denied"
**Solução:** Use Personal Access Token ao invés de senha

### "Repository not found"
**Solução:** Crie o repositório primeiro em https://github.com/new

### "Failed to push"
**Solução:** 
```bash
git pull origin main
git push
```

### Arquivo muito grande (>100MB)
**Solução:** Use Git LFS ou não versione o arquivo

---

## 📱 Compartilhar

Depois de publicar, compartilhe:

```
🎉 Acabei de publicar meu TCC no GitHub!

Sistema de identificação de doenças em folhas de arroz usando Deep Learning
✅ 98.93% de acurácia
✅ 7,123 imagens
✅ Código open-source

Confira: https://github.com/SEU-USUARIO/rice-disease-detection

#MachineLearning #DeepLearning #Agriculture #TensorFlow
```

---

## 🆘 Precisa de Ajuda?

1. **Guia Completo:** [GUIA_PUBLICACAO_GITHUB.md](GUIA_PUBLICACAO_GITHUB.md)
2. **GitHub Docs:** https://docs.github.com
3. **Vídeos:** YouTube "como usar git e github"

---

<div align="center">

**🚀 Boa sorte com a publicação!**

*Qualquer dúvida, consulte o guia completo*

</div>
