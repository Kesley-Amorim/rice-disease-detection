# 🌾 Identificação de Doenças em Folhas de Arroz usando CNNs

<div align="center">

![Rice Disease Detection](https://img.shields.io/badge/Accuracy-98.93%25-success)
![TensorFlow](https://img.shields.io/badge/TensorFlow-2.x-orange)
![Keras](https://img.shields.io/badge/Keras-Deep%20Learning-red)
![Python](https://img.shields.io/badge/Python-3.x-blue)

*Sistema de classificação automática de doenças em folhas de arroz utilizando Redes Neurais Convolucionais*

</div>

---

## 📋 Sobre o Projeto

Este projeto foi desenvolvido como Trabalho de Conclusão de Curso (TCC) e implementa um sistema de visão computacional para identificação automática de doenças em folhas de arroz. Utilizando técnicas de Deep Learning, especificamente Redes Neurais Convolucionais (CNNs), o modelo é capaz de classificar folhas em 5 categorias diferentes com alta precisão.

### 🎯 Objetivo

Desenvolver uma solução automatizada para auxiliar agricultores e agrônomos na detecção precoce de doenças em plantações de arroz, permitindo intervenções mais rápidas e eficazes.

### 👥 Equipe

**Integrantes:**
- Kesley H. P. Amorim
- Lucas Ferrari da Silva

**Orientadores:**
- José Guilherme Picolo
- Silvio Petroli Neto

---

## 🦠 Doenças Classificadas

O modelo é capaz de identificar as seguintes condições:

1. **Bacterial Blight** (Queima Bacteriana)
2. **Blast** (Brusone)
3. **Brownspot** (Mancha Parda)
4. **Healthy** (Saudável)
5. **Tungro** (Tungro)

---

## 🏗️ Arquitetura do Modelo

### Modelo Principal (TCC.ipynb)
- **Arquitetura:** CNN Customizada
- **Acurácia Final:** 98.93%
- **Loss Final:** 0.0568
- **Épocas de Treinamento:** 20
- **Tamanho de Entrada:** 300x300 pixels

### Modelo VGG16 (Transfer Learning)
- **Arquitetura Base:** VGG16 pré-treinada (ImageNet)
- **Camadas Treináveis:** Camadas superiores customizadas
- **Dropout:** 0.2
- **Parâmetros Totais:** 14,717,253
- **Parâmetros Treináveis:** 2,565

---

## 📊 Resultados

### Desempenho do Modelo Principal

| Métrica | Treinamento | Validação |
|---------|-------------|-----------|
| **Acurácia** | 99.44% | 98.93% |
| **Loss** | 0.0142 | 0.0568 |

### Evolução do Treinamento

```
Época 1:  Acc: 57.75% | Val Acc: 71.80%
Época 5:  Acc: 90.48% | Val Acc: 93.96%
Época 10: Acc: 98.88% | Val Acc: 98.51%
Época 15: Acc: 98.92% | Val Acc: 98.79%
Época 20: Acc: 99.44% | Val Acc: 98.93%
```

---

## 🗂️ Estrutura do Dataset

```
TCC - Data/
├── Bacterialblight/  (~1,584 imagens)
├── Blast/            (~1,584 imagens)
├── Brownspot/        (~1,584 imagens)
├── Healthy/          (~1,584 imagens)
└── Tungro/           (~1,584 imagens)

Test Data/
├── Bacterialblight/
├── Blast/
├── Brownspot/
├── Healthy/
└── Tungro/
```

**Total de Imagens:** 7,123 imagens de treinamento

### 📥 Fontes do Dataset

As imagens foram obtidas das seguintes fontes públicas:

1. **Mendeley Data** - Rice Leaf Image Samples  
   - Autores: Sethy, P. K., Barpanda, N. K., Rath, A. K., & Behera, S. K. (2020)
   - 🔗 [Download Dataset](https://data.mendeley.com/datasets/fwcj7stb8r/1)
   - DOI: `10.17632/fwcj7stb8r.1`

2. **Kaggle** - Rice Leafs Dataset  
   - 🔗 [Download Dataset](https://www.kaggle.com/datasets/shayanriyaz/riceleafs)

3. **GitHub** - RiceDiseases-DataSet  
   - 🔗 [Download Dataset](https://github.com/aldrin233/RiceDiseases-DataSet)

> 💡 **Nota:** Devido ao tamanho do dataset (~3.8GB), as imagens não estão incluídas neste repositório. Faça o download das fontes acima e organize conforme a estrutura mostrada.

Para mais detalhes, consulte [DATASET.md](DATASET.md) e [REFERENCES.md](REFERENCES.md).

### Divisão dos Dados
- **Treinamento:** 70% (156 batches)
- **Validação:** 20% (44 batches)
- **Teste:** 10% (23 batches)
- **Tamanho do Batch:** 32 imagens

---

## 🛠️ Tecnologias Utilizadas

- **Python 3.x**
- **TensorFlow 2.x** - Framework de Deep Learning
- **Keras** - API de alto nível para redes neurais
- **NumPy** - Computação numérica
- **Matplotlib** - Visualização de dados
- **Jupyter Notebook** - Ambiente de desenvolvimento

---

## 🚀 Como Usar

### Pré-requisitos

```bash
pip install tensorflow numpy matplotlib jupyter
```

### 📥 Configurar o Dataset

**Importante:** As imagens não estão incluídas neste repositório devido ao tamanho (~3.8GB).

Siga o guia completo: **[DATASET_SETUP.md](DATASET_SETUP.md)**

Resumo rápido:
1. Baixe as imagens de uma das fontes listadas em [REFERENCES.md](REFERENCES.md)
2. Organize nas pastas `TCC - Data/` e `Test Data/`
3. Verifique a estrutura conforme descrito no guia

### Verificar GPU (Opcional)

```python
import tensorflow as tf
print(tf.config.list_physical_devices('GPU'))
```

### Executar o Modelo

1. **Clone o repositório**
```bash
git clone [seu-repositorio]
cd [nome-do-repositorio]
```

2. **Abra o Jupyter Notebook**
```bash
jupyter notebook TCC.ipynb
```

3. **Execute as células sequencialmente**

### Fazer Predições

```python
# Carregar modelo treinado
model = tf.keras.models.load_model('Models/TCC_0.13L_9820acc.keras')

# Carregar e preprocessar imagem
img = tf.keras.preprocessing.image.load_img('caminho/imagem.jpg', target_size=(300, 300))
img_array = tf.keras.preprocessing.image.img_to_array(img) / 255.0
img_array = np.expand_dims(img_array, axis=0)

# Fazer predição
prediction = model.predict(img_array)
class_labels = ['Bacterial Blight', 'Blast', 'Brownspot', 'Healthy', 'Tungro']
predicted_class = class_labels[np.argmax(prediction)]

print(f"Doença detectada: {predicted_class}")
print(f"Confiança: {np.max(prediction)*100:.2f}%")
```

---

## 📁 Estrutura do Projeto

```
.
├── TCC.ipynb                          # Notebook principal com modelo customizado
├── VGG16.ipynb                        # Notebook com Transfer Learning
├── HIST.txt                           # Histórico de treinamento
├── TCC - Data/                        # Dataset de treinamento
├── Test Data/                         # Dataset de teste
├── Models/
│   ├── TCC.keras                      # Modelo treinado
│   └── TCC_0.13L_9820acc.keras       # Melhor modelo (98.20% acc)
├── logs/                              # TensorBoard logs
│   ├── train/
│   └── validation/
├── vgg_logs/                          # Logs do modelo VGG16
├── Images for TCC/                    # Imagens para documentação
└── README.md                          # Este arquivo
```

---

## 📈 Visualização com TensorBoard

Para visualizar as métricas de treinamento:

```bash
tensorboard --logdir=logs
```

Acesse: `http://localhost:6006`

---

## 🔬 Metodologia

### 1. Pré-processamento
- Redimensionamento para 300x300 pixels
- Normalização (divisão por 255)
- Codificação one-hot das labels

### 2. Arquitetura CNN
- Camadas convolucionais para extração de features
- Pooling layers para redução dimensional
- Dropout para regularização
- Camadas densas para classificação

### 3. Treinamento
- Otimizador: Adam
- Loss Function: Categorical Crossentropy
- Métricas: Accuracy
- Callbacks: TensorBoard logging

### 4. Avaliação
- Validação cruzada
- Análise de matriz de confusão
- Métricas de precisão, recall e F1-score

---

## 🎓 Aplicações

- **Agricultura de Precisão:** Monitoramento automatizado de plantações
- **Diagnóstico Precoce:** Detecção rápida de doenças
- **Redução de Perdas:** Intervenção antes da propagação
- **Educação:** Ferramenta de ensino para agronomia
- **Pesquisa:** Base para estudos em fitopatologia

---

## 📝 Trabalhos Futuros

- [ ] Implementar detecção em tempo real via webcam/drone
- [ ] Expandir dataset com mais variedades de arroz
- [ ] Desenvolver aplicativo mobile
- [ ] Adicionar geolocalização das detecções
- [ ] Integrar com sistemas de irrigação inteligente
- [ ] Implementar explicabilidade (Grad-CAM)

---

## 📄 Licença

Este projeto foi desenvolvido para fins acadêmicos.

---

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abrir um Pull Request

---

## 📧 Contato

Para dúvidas ou sugestões sobre o projeto, entre em contato com os desenvolvedores.

---

## 🙏 Agradecimentos

- Orientadores pela dedicação e suporte
- Instituição de ensino
- Comunidade open-source de Machine Learning
- Agricultores que contribuíram com conhecimento sobre as doenças

---

<div align="center">

**Desenvolvido com 💚 para a agricultura sustentável**

⭐ Se este projeto foi útil, considere dar uma estrela!

</div>
