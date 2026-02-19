#!/bin/bash

echo "========================================"
echo "  Publicar Projeto no GitHub"
echo "========================================"
echo ""

# Verificar se Git está instalado
if ! command -v git &> /dev/null; then
    echo "[ERRO] Git não está instalado!"
    echo "Instale com: sudo apt install git"
    exit 1
fi

echo "[OK] Git instalado!"
echo ""

# Pedir informações do usuário
read -p "Digite seu usuário do GitHub: " USUARIO
read -p "Digite o nome do repositório (rice-disease-detection): " REPO
REPO=${REPO:-rice-disease-detection}

echo ""
echo "========================================"
echo "  Configurando Git"
echo "========================================"
echo ""

# Configurar Git (se necessário)
if ! git config user.name &> /dev/null; then
    read -p "Digite seu nome: " NOME
    read -p "Digite seu email: " EMAIL
    git config --global user.name "$NOME"
    git config --global user.email "$EMAIL"
    echo "[OK] Git configurado!"
fi

echo ""
echo "========================================"
echo "  Inicializando Repositório"
echo "========================================"
echo ""

# Inicializar Git
if [ ! -d .git ]; then
    git init
    echo "[OK] Repositório inicializado!"
else
    echo "[OK] Repositório já existe!"
fi

echo ""
echo "========================================"
echo "  Adicionando Arquivos"
echo "========================================"
echo ""

# Adicionar todos os arquivos
git add .
echo "[OK] Arquivos adicionados!"

echo ""
echo "========================================"
echo "  Fazendo Commit"
echo "========================================"
echo ""

# Fazer commit
git commit -m "feat: adiciona projeto completo de TCC"
echo "[OK] Commit realizado!"

echo ""
echo "========================================"
echo "  Conectando ao GitHub"
echo "========================================"
echo ""

# Adicionar remote
git remote remove origin 2>/dev/null
git remote add origin https://github.com/$USUARIO/$REPO.git
echo "[OK] Conectado ao GitHub!"

echo ""
echo "========================================"
echo "  Enviando para GitHub"
echo "========================================"
echo ""

# Renomear branch para main
git branch -M main

# Push
echo "Enviando arquivos..."
echo ""
echo "IMPORTANTE: Quando pedir senha, use seu Personal Access Token!"
echo "Como obter: https://github.com/settings/tokens"
echo ""

if git push -u origin main; then
    echo ""
    echo "========================================"
    echo "  SUCESSO!"
    echo "========================================"
    echo ""
    echo "Seu projeto foi publicado no GitHub!"
    echo ""
    echo "Acesse: https://github.com/$USUARIO/$REPO"
    echo ""
    echo "Próximos passos:"
    echo "1. Configure o About do repositório"
    echo "2. Adicione topics"
    echo "3. Adicione imagens"
    echo "4. Compartilhe nas redes sociais!"
    echo ""
else
    echo ""
    echo "[ERRO] Falha ao enviar arquivos!"
    echo ""
    echo "Possíveis causas:"
    echo "1. Repositório não existe no GitHub"
    echo "2. Token/senha incorretos"
    echo "3. Sem permissão"
    echo ""
    echo "Solução:"
    echo "1. Crie o repositório em: https://github.com/new"
    echo "2. Use Personal Access Token: https://github.com/settings/tokens"
    echo ""
    exit 1
fi
