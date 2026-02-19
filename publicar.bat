@echo off
echo ========================================
echo   Publicar Projeto no GitHub
echo ========================================
echo.

REM Verificar se Git está instalado
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Git nao esta instalado!
    echo Baixe em: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [OK] Git instalado!
echo.

REM Pedir informações do usuário
set /p USUARIO="Digite seu usuario do GitHub: "
set /p REPO="Digite o nome do repositorio (rice-disease-detection): "
if "%REPO%"=="" set REPO=rice-disease-detection

echo.
echo ========================================
echo   Configurando Git
echo ========================================
echo.

REM Configurar Git (se necessário)
git config user.name >nul 2>&1
if errorlevel 1 (
    set /p NOME="Digite seu nome: "
    set /p EMAIL="Digite seu email: "
    git config --global user.name "%NOME%"
    git config --global user.email "%EMAIL%"
    echo [OK] Git configurado!
)

echo.
echo ========================================
echo   Inicializando Repositorio
echo ========================================
echo.

REM Inicializar Git
if not exist .git (
    git init
    echo [OK] Repositorio inicializado!
) else (
    echo [OK] Repositorio ja existe!
)

echo.
echo ========================================
echo   Adicionando Arquivos
echo ========================================
echo.

REM Adicionar todos os arquivos
git add .
echo [OK] Arquivos adicionados!

echo.
echo ========================================
echo   Fazendo Commit
echo ========================================
echo.

REM Fazer commit
git commit -m "feat: adiciona projeto completo de TCC"
echo [OK] Commit realizado!

echo.
echo ========================================
echo   Conectando ao GitHub
echo ========================================
echo.

REM Adicionar remote
git remote remove origin >nul 2>&1
git remote add origin https://github.com/%USUARIO%/%REPO%.git
echo [OK] Conectado ao GitHub!

echo.
echo ========================================
echo   Enviando para GitHub
echo ========================================
echo.

REM Renomear branch para main
git branch -M main

REM Push
echo Enviando arquivos...
echo.
echo IMPORTANTE: Quando pedir senha, use seu Personal Access Token!
echo Como obter: https://github.com/settings/tokens
echo.
git push -u origin main

if errorlevel 1 (
    echo.
    echo [ERRO] Falha ao enviar arquivos!
    echo.
    echo Possiveis causas:
    echo 1. Repositorio nao existe no GitHub
    echo 2. Token/senha incorretos
    echo 3. Sem permissao
    echo.
    echo Solucao:
    echo 1. Crie o repositorio em: https://github.com/new
    echo 2. Use Personal Access Token: https://github.com/settings/tokens
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   SUCESSO!
echo ========================================
echo.
echo Seu projeto foi publicado no GitHub!
echo.
echo Acesse: https://github.com/%USUARIO%/%REPO%
echo.
echo Proximos passos:
echo 1. Configure o About do repositorio
echo 2. Adicione topics
echo 3. Adicione imagens
echo 4. Compartilhe nas redes sociais!
echo.
pause
