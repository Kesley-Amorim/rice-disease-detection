# 🤝 Guia de Contribuição

Obrigado por considerar contribuir com este projeto! Este documento fornece diretrizes para contribuições.

## 📋 Código de Conduta

Este projeto segue um código de conduta. Ao participar, você concorda em manter um ambiente respeitoso e colaborativo.

## 🚀 Como Contribuir

### 1. Reportar Bugs

Se você encontrou um bug:
1. Verifique se já não existe uma issue aberta sobre o problema
2. Abra uma nova issue usando o template de bug report
3. Forneça o máximo de detalhes possível
4. Inclua passos para reproduzir o problema

### 2. Sugerir Funcionalidades

Para sugerir novas funcionalidades:
1. Verifique se a funcionalidade já não foi sugerida
2. Abra uma issue usando o template de feature request
3. Explique claramente o problema que a funcionalidade resolve
4. Descreva a solução proposta

### 3. Contribuir com Código

#### Preparação do Ambiente

```bash
# Clone o repositório
git clone https://github.com/Kesley-Amorim/rice-disease-detection.git
cd [repositorio]

# Crie um ambiente virtual
python -m venv venv
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate  # Windows

# Instale as dependências
pip install -r requirements.txt
```

#### Workflow de Desenvolvimento

1. **Fork o Repositório**
   - Clique em "Fork" no GitHub

2. **Crie uma Branch**
   ```bash
   git checkout -b feature/nome-da-feature
   # ou
   git checkout -b fix/nome-do-bug
   ```

3. **Faça suas Alterações**
   - Escreva código limpo e bem documentado
   - Siga as convenções de estilo do projeto
   - Adicione comentários quando necessário

4. **Teste suas Alterações**
   ```bash
   # Execute os notebooks
   jupyter notebook
   
   # Verifique se não há erros
   python -m py_compile *.py
   ```

5. **Commit suas Alterações**
   ```bash
   git add .
   git commit -m "feat: adiciona nova funcionalidade X"
   ```

   **Convenção de Commits:**
   - `feat:` Nova funcionalidade
   - `fix:` Correção de bug
   - `docs:` Alterações na documentação
   - `style:` Formatação, ponto e vírgula, etc
   - `refactor:` Refatoração de código
   - `test:` Adição de testes
   - `chore:` Tarefas de manutenção

6. **Push para o GitHub**
   ```bash
   git push origin feature/nome-da-feature
   ```

7. **Abra um Pull Request**
   - Vá para o repositório original no GitHub
   - Clique em "New Pull Request"
   - Selecione sua branch
   - Preencha o template de PR

## 📝 Diretrizes de Código

### Python

```python
# Use docstrings para funções
def processar_imagem(img_path):
    """
    Processa uma imagem de folha de arroz.
    
    Args:
        img_path (str): Caminho para a imagem
        
    Returns:
        np.array: Imagem processada
    """
    pass

# Use type hints quando possível
def classificar(imagem: np.ndarray) -> str:
    pass

# Mantenha funções pequenas e focadas
# Siga PEP 8
```

### Jupyter Notebooks

- Mantenha células organizadas e com propósito claro
- Adicione markdown cells para explicar o código
- Limpe outputs antes de commitar (opcional)
- Use nomes descritivos para variáveis

### Documentação

- Atualize o README.md se necessário
- Adicione docstrings em funções novas
- Comente código complexo
- Mantenha a documentação sincronizada com o código

## 🧪 Testes

Antes de submeter um PR:

1. **Teste o Notebook Completo**
   - Execute todas as células
   - Verifique se não há erros

2. **Teste com Diferentes Imagens**
   - Teste com imagens de cada classe
   - Verifique predições

3. **Verifique Performance**
   - Monitore uso de memória
   - Verifique tempo de execução

## 📦 Estrutura de Pull Request

Seu PR deve incluir:

```markdown
## Descrição
Breve descrição das alterações

## Tipo de Mudança
- [ ] Bug fix
- [ ] Nova funcionalidade
- [ ] Breaking change
- [ ] Documentação

## Como Testar
Passos para testar as alterações

## Checklist
- [ ] Código segue as diretrizes do projeto
- [ ] Documentação atualizada
- [ ] Testes passando
- [ ] Sem warnings
```

## 🎯 Áreas para Contribuição

### Prioridade Alta
- [ ] Implementar data augmentation
- [ ] Adicionar mais métricas de avaliação
- [ ] Criar interface web/mobile
- [ ] Melhorar documentação

### Prioridade Média
- [ ] Adicionar testes unitários
- [ ] Implementar Grad-CAM para explicabilidade
- [ ] Otimizar modelo para mobile
- [ ] Adicionar suporte para mais doenças

### Prioridade Baixa
- [ ] Melhorar visualizações
- [ ] Adicionar mais exemplos
- [ ] Traduzir documentação
- [ ] Criar tutoriais em vídeo

## 💬 Comunicação

- **Issues:** Para bugs e features
- **Pull Requests:** Para contribuições de código
- **Discussions:** Para perguntas e discussões gerais

## 📄 Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença do projeto.

## 🙏 Agradecimentos

Obrigado por contribuir para tornar este projeto melhor!

---

**Dúvidas?** Abra uma issue ou entre em contato com os mantenedores.
