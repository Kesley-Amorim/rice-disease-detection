# 📝 Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

---

## [1.0.0] - 2023-10-XX

### 🎉 Lançamento Inicial

#### ✨ Adicionado
- Modelo CNN customizado para classificação de doenças em arroz
- Implementação de Transfer Learning com VGG16
- Dataset com 7,123 imagens de 5 classes diferentes
- Notebooks Jupyter para treinamento e avaliação
- Acurácia de 98.93% no conjunto de validação
- Suporte para GPU (CUDA)
- Logging com TensorBoard
- Documentação completa em português
- README.md com instruções detalhadas
- Guia de instalação (INSTALL.md)
- Documentação acadêmica completa
- Templates para issues e pull requests
- Guia de contribuição

#### 🔧 Configuração
- Normalização de imagens (0-1)
- Data splitting: 70% treino, 20% validação, 10% teste
- Batch size: 32
- Otimizador: Adam
- Loss function: Categorical Crossentropy

#### 📊 Modelos Salvos
- `Models/TCC.keras` - Modelo principal
- `Models/TCC_0.13L_9820acc.keras` - Melhor modelo (98.20% acc)

#### 📚 Documentação
- README.md - Documentação principal
- DOCUMENTACAO_ACADEMICA.md - Documentação acadêmica detalhada
- INSTALL.md - Guia de instalação
- CONTRIBUTING.md - Guia de contribuição
- CITATION.md - Como citar o trabalho
- CHANGELOG.md - Este arquivo

---

## [Unreleased]

### 🚧 Em Desenvolvimento

#### 🎯 Planejado
- [ ] Interface web para upload e classificação de imagens
- [ ] API REST para integração
- [ ] Aplicativo mobile (Android/iOS)
- [ ] Data augmentation para melhorar robustez
- [ ] Suporte para detecção em tempo real
- [ ] Integração com drones
- [ ] Explicabilidade com Grad-CAM
- [ ] Suporte para mais doenças
- [ ] Testes unitários
- [ ] CI/CD pipeline

#### 💡 Ideias Futuras
- Sistema de recomendação de tratamentos
- Previsão de progressão de doenças
- Integração com IoT
- Dashboard de monitoramento
- Modo offline para uso em campo
- Suporte multilíngue
- Exportação para TensorFlow Lite (mobile)
- Quantização do modelo

---

## Tipos de Mudanças

- `✨ Adicionado` - para novas funcionalidades
- `🔧 Modificado` - para mudanças em funcionalidades existentes
- `🗑️ Depreciado` - para funcionalidades que serão removidas
- `🔥 Removido` - para funcionalidades removidas
- `🐛 Corrigido` - para correções de bugs
- `🔒 Segurança` - para correções de vulnerabilidades

---

## Versionamento

Este projeto usa [Semantic Versioning](https://semver.org/):

- **MAJOR** (X.0.0): Mudanças incompatíveis na API
- **MINOR** (0.X.0): Novas funcionalidades compatíveis
- **PATCH** (0.0.X): Correções de bugs compatíveis

---

## Links

- [Repositório](https://github.com/[usuario]/[repositorio])
- [Issues](https://github.com/[usuario]/[repositorio]/issues)
- [Pull Requests](https://github.com/[usuario]/[repositorio]/pulls)

---

**Última atualização:** 2023-10-XX
