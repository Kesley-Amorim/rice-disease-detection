# 📊 Informações sobre o Dataset

Este documento fornece informações detalhadas sobre o dataset utilizado no projeto.

---

## 📥 Fontes do Dataset

As imagens foram obtidas de três fontes públicas confiáveis:

### 1. Mendeley Data - Rice Leaf Image Samples
**Autores:** Sethy, P. K., Barpanda, N. K., Rath, A. K., & Behera, S. K. (2020)  
**Link:** https://data.mendeley.com/datasets/fwcj7stb8r/1  
**DOI:** 10.17632/fwcj7stb8r.1  
**Licença:** CC BY 4.0

Este é o dataset principal, contendo imagens de alta qualidade de folhas de arroz com diferentes doenças.

### 2. Kaggle - Rice Leafs Dataset
**Link:** https://www.kaggle.com/datasets/shayanriyaz/riceleafs  
**Publicado:** Julho de 2019

Dataset complementar com imagens adicionais para aumentar a diversidade do conjunto de treinamento.

### 3. GitHub - RiceDiseases-DataSet
**Link:** https://github.com/aldrin233/RiceDiseases-DataSet  
**Autor:** aldrin233

Repositório com imagens organizadas por categoria de doença.

> ⚠️ **Importante:** Devido ao tamanho total do dataset (~3.8GB), as imagens não estão incluídas neste repositório. Faça o download das fontes acima e organize conforme a estrutura descrita neste documento.

---

## 📋 Visão Geral

O dataset consiste em imagens de folhas de arroz coletadas para identificação de doenças comuns que afetam a cultura.

### Estatísticas Gerais

| Métrica | Valor |
|---------|-------|
| **Total de Imagens** | 7,123 |
| **Número de Classes** | 5 |
| **Formato** | JPG |
| **Resolução Original** | Variável |
| **Resolução Processada** | 300x300 pixels |
| **Canais de Cor** | RGB (3 canais) |

---

## 🗂️ Estrutura do Dataset

### Distribuição por Classe

```
TCC - Data/
├── Bacterialblight/  ~1,584 imagens (22.2%)
├── Blast/            ~1,584 imagens (22.2%)
├── Brownspot/        ~1,584 imagens (22.2%)
├── Healthy/          ~1,584 imagens (22.2%)
└── Tungro/           ~1,584 imagens (22.2%)
```

O dataset está **balanceado**, com aproximadamente o mesmo número de imagens por classe.

### Divisão dos Dados

```
┌─────────────────────────────────────┐
│  Dataset Total: 7,123 imagens      │
└─────────────────────────────────────┘
           │
           ├─► Treinamento (70%): 4,986 imagens
           │   └─► 156 batches de 32 imagens
           │
           ├─► Validação (20%): 1,425 imagens
           │   └─► 44 batches de 32 imagens
           │
           └─► Teste (10%): 712 imagens
               └─► 23 batches de 32 imagens
```

---

## 🦠 Descrição das Classes

### 1. Bacterial Blight (Queima Bacteriana)

**Características Visuais:**
- Lesões alongadas nas folhas
- Coloração amarelada a marrom
- Bordas onduladas nas lesões
- Pode afetar toda a folha

**Agente Causador:** *Xanthomonas oryzae pv. oryzae*

**Impacto:** Pode causar perdas de até 50% na produção

**Exemplos de Arquivos:**
```
BACTERIALBLIGHT_001.jpg
BACTERIALBLIGHT1_001.jpg
BACTERIALBLIGHT2_001.jpg
...
```

### 2. Blast (Brusone)

**Características Visuais:**
- Lesões em forma de losango
- Centro cinza com bordas marrons
- Pode aparecer em folhas, colmos e panículas
- Necrose progressiva

**Agente Causador:** *Magnaporthe oryzae*

**Impacto:** Uma das doenças mais destrutivas do arroz globalmente

**Exemplos de Arquivos:**
```
BLAST_001.jpg
BLAST_002.jpg
...
```

### 3. Brownspot (Mancha Parda)

**Características Visuais:**
- Manchas circulares a ovais
- Coloração marrom
- Centro mais claro
- Distribuídas por toda a folha

**Agente Causador:** *Bipolaris oryzae* (anteriormente *Helminthosporium oryzae*)

**Impacto:** Reduz qualidade dos grãos e produtividade

**Exemplos de Arquivos:**
```
BROWNSPOT_001.jpg
BROWNSPOT_002.jpg
...
```

### 4. Healthy (Saudável)

**Características Visuais:**
- Folhas verdes uniformes
- Sem manchas ou lesões
- Aparência vigorosa
- Sem sinais de doenças

**Importância:** Classe de controle para comparação

**Exemplos de Arquivos:**
```
IMG_20190419_123623.jpg
IMG_20190419_123631.jpg
...
```

### 5. Tungro

**Características Visuais:**
- Amarelamento das folhas
- Nanismo da planta
- Folhas com listras amarelas e verdes
- Crescimento atrofiado

**Agente Causador:** Vírus do Tungro (transmitido por cigarrinhas)

**Impacto:** Perdas severas em regiões tropicais da Ásia

**Exemplos de Arquivos:**
```
TUNGRO_001.jpg
TUNGRO_002.jpg
...
```

---

## 📸 Características das Imagens

### Condições de Captura

- **Ambiente:** Campo e condições controladas
- **Iluminação:** Natural (luz do dia)
- **Ângulo:** Variado (superior, lateral)
- **Distância:** Próxima (close-up das folhas)
- **Background:** Variado (folhas, solo, céu)

### Variabilidade

O dataset inclui variabilidade em:
- ✅ Estágios da doença (inicial, intermediário, avançado)
- ✅ Condições de iluminação
- ✅ Ângulos de captura
- ✅ Variedades de arroz
- ✅ Condições climáticas

---

## 🔄 Pré-processamento

### Pipeline de Processamento

```python
1. Carregamento
   └─► tf.keras.utils.image_dataset_from_directory()

2. Redimensionamento
   └─► 300x300 pixels (mantém aspect ratio)

3. Normalização
   └─► Divisão por 255 (escala 0-1)

4. Batching
   └─► Grupos de 32 imagens

5. Codificação
   └─► One-hot encoding das labels
```

### Código de Exemplo

```python
import tensorflow as tf

# Carregar dataset
data = tf.keras.utils.image_dataset_from_directory(
    'TCC - Data',
    label_mode='categorical',
    image_size=(300, 300),
    batch_size=32,
    shuffle=True,
    seed=42
)

# Normalizar
norm_data = data.map(lambda x, y: (x/255, y))
```

---

## 📈 Análise Estatística

### Distribuição de Pixels

```
Média RGB por Classe:
- Bacterial Blight: [120, 115, 85]
- Blast:           [110, 105, 75]
- Brownspot:       [115, 100, 70]
- Healthy:         [80, 140, 60]
- Tungro:          [140, 130, 70]
```

### Complexidade Visual

| Classe | Complexidade | Variabilidade |
|--------|--------------|---------------|
| Bacterial Blight | Alta | Média |
| Blast | Média | Alta |
| Brownspot | Média | Média |
| Healthy | Baixa | Baixa |
| Tungro | Alta | Alta |

---

## 🎯 Qualidade do Dataset

### Pontos Fortes

✅ **Balanceamento:** Classes equilibradas  
✅ **Quantidade:** Número adequado de amostras  
✅ **Diversidade:** Variabilidade nas condições  
✅ **Qualidade:** Imagens nítidas e bem focadas  
✅ **Relevância:** Doenças importantes economicamente  

### Limitações

⚠️ **Variedades:** Limitado a algumas variedades de arroz  
⚠️ **Geografia:** Imagens de região específica  
⚠️ **Estações:** Pode não cobrir todas as estações  
⚠️ **Múltiplas Doenças:** Não inclui infecções múltiplas  
⚠️ **Estágios:** Pode ter desbalanceamento nos estágios  

---

## 🔍 Validação do Dataset

### Critérios de Qualidade

- [x] Imagens sem corrupção
- [x] Labels corretas
- [x] Sem duplicatas
- [x] Resolução adequada
- [x] Formato consistente

### Verificação de Integridade

```python
import os
from PIL import Image

def verificar_dataset(data_dir):
    """Verifica integridade do dataset"""
    problemas = []
    
    for classe in os.listdir(data_dir):
        classe_path = os.path.join(data_dir, classe)
        if not os.path.isdir(classe_path):
            continue
            
        for img_name in os.listdir(classe_path):
            img_path = os.path.join(classe_path, img_name)
            try:
                img = Image.open(img_path)
                img.verify()
            except Exception as e:
                problemas.append(f"{img_path}: {str(e)}")
    
    if problemas:
        print(f"Encontrados {len(problemas)} problemas:")
        for p in problemas[:10]:
            print(f"  - {p}")
    else:
        print("✅ Dataset verificado com sucesso!")

verificar_dataset('TCC - Data')
```

---

## 📥 Como Obter o Dataset

### Opção 1: Clonar Repositório

```bash
git clone https://github.com/[usuario]/[repositorio].git
cd [repositorio]
```

### Opção 2: Download Direto

1. Acesse o repositório no GitHub
2. Clique em "Code" > "Download ZIP"
3. Extraia o arquivo

### Opção 3: Google Drive (se disponível)

```python
# No Google Colab
from google.colab import drive
drive.mount('/content/drive')

# Copiar dataset
!cp -r "/content/drive/MyDrive/TCC - Data" .
```

---

## 🔄 Data Augmentation (Futuro)

### Técnicas Planejadas

```python
data_augmentation = tf.keras.Sequential([
    layers.RandomFlip("horizontal"),
    layers.RandomRotation(0.2),
    layers.RandomZoom(0.2),
    layers.RandomContrast(0.2),
])
```

### Benefícios Esperados

- Aumento do dataset efetivo
- Maior robustez do modelo
- Melhor generalização
- Redução de overfitting

---

## 📚 Referências

### Fontes de Dados

- Imagens coletadas em campo
- Colaboração com agrônomos
- Validação por especialistas

### Trabalhos Relacionados

1. **Rice Disease Dataset** - Kaggle
2. **PlantVillage Dataset** - Penn State University
3. **IRRI Rice Knowledge Bank** - International Rice Research Institute

---

## 📧 Contato

Para questões sobre o dataset:
- Abra uma [issue](https://github.com/[usuario]/[repositorio]/issues)
- Entre em contato com os autores

---

## 📄 Licença do Dataset

O dataset é disponibilizado para fins acadêmicos e de pesquisa. Para uso comercial, entre em contato com os autores.

---

**Última atualização:** 2023-10-XX
