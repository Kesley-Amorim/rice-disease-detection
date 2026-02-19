# 🚀 Guia de Configuração do GitHub

Este guia mostra como configurar seu repositório GitHub de forma profissional.

---

## 📋 Checklist de Configuração

### Antes de Publicar

- [ ] Revisar todos os arquivos de documentação
- [ ] Atualizar links com seu usuário/repositório
- [ ] Adicionar screenshots e imagens
- [ ] Testar todos os comandos
- [ ] Verificar ortografia
- [ ] Remover informações sensíveis

### Arquivos Essenciais

- [x] README.md
- [x] LICENSE
- [x] .gitignore
- [x] requirements.txt
- [x] CONTRIBUTING.md
- [x] CHANGELOG.md

---

## 🎨 Estrutura Recomendada do Repositório

```
seu-repositorio/
│
├── 📄 README.md                    # Documentação principal
├── 📄 LICENSE                      # Licença MIT
├── 📄 .gitignore                   # Arquivos ignorados
├── 📄 requirements.txt             # Dependências Python
│
├── 📁 .github/                     # Configurações GitHub
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── pull_request_template.md
│
├── 📁 docs/                        # Documentação adicional
│   ├── DOCUMENTACAO_ACADEMICA.md
│   ├── INSTALL.md
│   ├── QUICKSTART.md
│   ├── DATASET.md
│   ├── CONTRIBUTING.md
│   ├── CITATION.md
│   ├── CHANGELOG.md
│   ├── BADGES.md
│   ├── EXECUTIVE_SUMMARY.md
│   └── GITHUB_SETUP.md
│
├── 📁 notebooks/                   # Jupyter Notebooks
│   ├── TCC.ipynb
│   └── VGG16.ipynb
│
├── 📁 Models/                      # Modelos treinados
│   ├── TCC.keras
│   └── TCC_0.13L_9820acc.keras
│
├── 📁 data/                        # Dados (opcional)
│   ├── TCC - Data/
│   └── Test Data/
│
├── 📁 images/                      # Imagens para docs
│   ├── logo.png
│   ├── banner.png
│   ├── architecture.png
│   └── results/
│
└── 📁 scripts/                     # Scripts auxiliares
    ├── train.py
    ├── predict.py
    └── evaluate.py
```

---

## 🎯 Passo a Passo

### 1. Criar Repositório no GitHub

1. Acesse https://github.com/new
2. Preencha:
   - **Repository name:** `rice-disease-detection`
   - **Description:** `Sistema de identificação de doenças em folhas de arroz usando Deep Learning`
   - **Public** ou **Private**
   - ✅ Add README file (depois substituir)
   - ✅ Add .gitignore (Python)
   - ✅ Choose a license (MIT)

### 2. Clonar Repositório

```bash
git clone https://github.com/[seu-usuario]/rice-disease-detection.git
cd rice-disease-detection
```

### 3. Organizar Arquivos

```bash
# Mover documentação para pasta docs/
mkdir docs
mv DOCUMENTACAO_ACADEMICA.md docs/
mv INSTALL.md docs/
mv QUICKSTART.md docs/
mv DATASET.md docs/
mv CONTRIBUTING.md docs/
mv CITATION.md docs/
mv CHANGELOG.md docs/
mv BADGES.md docs/
mv EXECUTIVE_SUMMARY.md docs/
mv GITHUB_SETUP.md docs/

# Mover notebooks para pasta notebooks/
mkdir notebooks
mv TCC.ipynb notebooks/
mv VGG16.ipynb notebooks/

# Criar pasta para imagens
mkdir images
mkdir images/results
```

### 4. Atualizar README.md

Substitua `[usuario]` e `[repositorio]` pelos seus valores:

```bash
# Linux/Mac
sed -i 's/\[usuario\]/seu-usuario/g' README.md
sed -i 's/\[repositorio\]/rice-disease-detection/g' README.md

# Windows (PowerShell)
(Get-Content README.md) -replace '\[usuario\]', 'seu-usuario' | Set-Content README.md
(Get-Content README.md) -replace '\[repositorio\]', 'rice-disease-detection' | Set-Content README.md
```

### 5. Adicionar Badges

Edite o README.md e adicione no topo:

```markdown
<div align="center">

# 🌾 Identificação de Doenças em Folhas de Arroz

![Status](https://img.shields.io/badge/Status-Concluído-success)
![TensorFlow](https://img.shields.io/badge/TensorFlow-2.x-FF6F00?logo=tensorflow)
![Python](https://img.shields.io/badge/Python-3.8+-3776AB?logo=python&logoColor=white)
![Accuracy](https://img.shields.io/badge/Accuracy-98.93%25-success)
![License](https://img.shields.io/badge/License-MIT-green)

*Sistema de classificação automática usando Deep Learning*

[Demo](#) • [Documentação](docs/DOCUMENTACAO_ACADEMICA.md) • [Instalação](docs/INSTALL.md) • [Contribuir](docs/CONTRIBUTING.md)

</div>
```

### 6. Adicionar Imagens

Crie um banner/logo para o projeto:

```bash
# Adicione suas imagens
cp caminho/para/banner.png images/
cp caminho/para/logo.png images/
cp caminho/para/results/* images/results/
```

Atualize README.md:

```markdown
![Banner](images/banner.png)
```

### 7. Commit Inicial

```bash
git add .
git commit -m "feat: adiciona documentação completa do projeto"
git push origin main
```

---

## ⚙️ Configurações do Repositório

### 1. Configurar About

No GitHub, vá em **Settings** > **General**:

- **Description:** `Sistema de identificação de doenças em folhas de arroz usando Deep Learning - TCC 2023`
- **Website:** (se tiver)
- **Topics:** `deep-learning`, `tensorflow`, `keras`, `agriculture`, `computer-vision`, `cnn`, `rice`, `disease-detection`, `machine-learning`, `python`

### 2. Configurar GitHub Pages (Opcional)

**Settings** > **Pages**:
- **Source:** Deploy from a branch
- **Branch:** main
- **Folder:** /docs

Acesse: `https://[seu-usuario].github.io/rice-disease-detection`

### 3. Habilitar Issues

**Settings** > **General** > **Features**:
- ✅ Issues
- ✅ Projects
- ✅ Discussions (opcional)

### 4. Configurar Branch Protection

**Settings** > **Branches** > **Add rule**:
- **Branch name pattern:** `main`
- ✅ Require pull request reviews before merging
- ✅ Require status checks to pass before merging

### 5. Adicionar Colaboradores

**Settings** > **Collaborators**:
- Adicione seu colega de TCC
- Adicione orientadores (opcional)

---

## 📝 Criar Releases

### 1. Criar Tag

```bash
git tag -a v1.0.0 -m "Release inicial - TCC 2023"
git push origin v1.0.0
```

### 2. Criar Release no GitHub

1. Vá em **Releases** > **Create a new release**
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
   - Dataset completo
   
   ### 📚 Documentação
   - [README](README.md)
   - [Instalação](docs/INSTALL.md)
   - [Guia Rápido](docs/QUICKSTART.md)
   ```
3. Anexe arquivos (modelos, dataset zip)
4. Clique em **Publish release**

---

## 🎨 Personalização Visual

### 1. Criar Logo

Use ferramentas como:
- Canva (https://canva.com)
- Figma (https://figma.com)
- GIMP (gratuito)

Dimensões recomendadas:
- Logo: 200x200px
- Banner: 1200x400px
- Screenshots: 1920x1080px

### 2. Criar Banner

Inclua:
- Nome do projeto
- Tagline
- Badges principais
- Screenshot do resultado

### 3. Adicionar Screenshots

```markdown
## 📸 Screenshots

### Interface de Predição
![Predição](images/results/prediction.png)

### Matriz de Confusão
![Confusion Matrix](images/results/confusion_matrix.png)

### Gráficos de Treinamento
![Training](images/results/training_plots.png)
```

---

## 📊 GitHub Actions (CI/CD)

Crie `.github/workflows/test.yml`:

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.10'
    
    - name: Install dependencies
      run: |
        pip install -r requirements.txt
    
    - name: Run tests
      run: |
        python -m pytest tests/
```

---

## 🌟 Melhorar Visibilidade

### 1. README Atrativo

- ✅ Banner visual no topo
- ✅ Badges informativos
- ✅ GIFs demonstrativos
- ✅ Seções bem organizadas
- ✅ Links para documentação

### 2. Descrição Completa

- ✅ Problema que resolve
- ✅ Como funciona
- ✅ Resultados alcançados
- ✅ Como usar
- ✅ Como contribuir

### 3. Topics Relevantes

Adicione topics no repositório:
```
deep-learning, tensorflow, keras, python, agriculture, 
computer-vision, cnn, machine-learning, rice, disease-detection,
image-classification, transfer-learning, vgg16, jupyter-notebook
```

### 4. Social Preview

**Settings** > **Social preview**:
- Upload uma imagem 1280x640px
- Aparecerá quando compartilhar o link

---

## 📢 Divulgação

### 1. Redes Sociais

Compartilhe em:
- LinkedIn (perfil profissional)
- Twitter/X (hashtags: #MachineLearning #Agriculture #AI)
- Reddit (r/MachineLearning, r/agriculture)
- Dev.to (artigo técnico)

### 2. Comunidades

Poste em:
- Kaggle (compartilhe dataset/notebook)
- Papers with Code
- Fóruns de ML/DL
- Grupos de agricultura

### 3. Artigo/Blog

Escreva sobre:
- Desafios enfrentados
- Lições aprendidas
- Resultados obtidos
- Aplicações práticas

---

## ✅ Checklist Final

Antes de considerar completo:

### Documentação
- [ ] README.md completo e atualizado
- [ ] Todos os links funcionando
- [ ] Screenshots adicionados
- [ ] Badges configurados
- [ ] Licença definida

### Código
- [ ] Código comentado
- [ ] Notebooks executáveis
- [ ] Requirements.txt atualizado
- [ ] .gitignore configurado
- [ ] Sem dados sensíveis

### GitHub
- [ ] Repositório público/privado conforme desejado
- [ ] About configurado
- [ ] Topics adicionados
- [ ] Issues habilitados
- [ ] Templates configurados

### Extras
- [ ] Release criado
- [ ] GitHub Pages (opcional)
- [ ] CI/CD (opcional)
- [ ] Social preview

---

## 🎓 Dicas Profissionais

1. **Mantenha Atualizado:** Responda issues e PRs
2. **Seja Receptivo:** Agradeça contribuições
3. **Documente Mudanças:** Use CHANGELOG.md
4. **Versione Corretamente:** Siga Semantic Versioning
5. **Teste Antes:** Sempre teste antes de commitar
6. **Commits Claros:** Use mensagens descritivas
7. **Branch Strategy:** Use branches para features
8. **Code Review:** Revise PRs cuidadosamente

---

## 📚 Recursos Úteis

- [GitHub Docs](https://docs.github.com)
- [Markdown Guide](https://www.markdownguide.org)
- [Shields.io](https://shields.io)
- [Choose a License](https://choosealicense.com)
- [Semantic Versioning](https://semver.org)
- [Keep a Changelog](https://keepachangelog.com)

---

**Pronto! Seu repositório está configurado profissionalmente! 🎉**

Agora é só compartilhar e receber estrelas! ⭐
