# 🔧 Guia de Instalação

Este guia fornece instruções detalhadas para configurar o ambiente e executar o projeto.

---

## 📋 Pré-requisitos

### Sistema Operacional
- Windows 10/11
- Linux (Ubuntu 18.04+, Debian, etc.)
- macOS 10.14+

### Software Necessário
- Python 3.8 ou superior
- pip (gerenciador de pacotes Python)
- Git (opcional, para clonar o repositório)

### Hardware Recomendado
- **RAM:** Mínimo 8GB (16GB recomendado)
- **GPU:** NVIDIA com suporte CUDA (opcional, mas recomendado)
- **Espaço em Disco:** Mínimo 5GB livres

---

## 🚀 Instalação Rápida

### 1. Clone o Repositório

```bash
git clone https://github.com/[usuario]/[repositorio].git
cd [repositorio]
```

Ou baixe o ZIP e extraia.

### 2. Crie um Ambiente Virtual

#### Windows
```bash
python -m venv venv
venv\Scripts\activate
```

#### Linux/macOS
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Instale as Dependências

```bash
pip install -r requirements.txt
```

### 4. Verifique a Instalação

```bash
python -c "import tensorflow as tf; print('TensorFlow:', tf.__version__); print('GPU:', tf.config.list_physical_devices('GPU'))"
```

---

## 🎮 Configuração com GPU (NVIDIA)

### Windows

1. **Instale CUDA Toolkit**
   - Baixe: https://developer.nvidia.com/cuda-downloads
   - Versão recomendada: CUDA 11.8

2. **Instale cuDNN**
   - Baixe: https://developer.nvidia.com/cudnn
   - Extraia e copie arquivos para a pasta CUDA

3. **Instale TensorFlow com GPU**
   ```bash
   pip install tensorflow[and-cuda]
   ```

4. **Verifique**
   ```python
   import tensorflow as tf
   print(tf.config.list_physical_devices('GPU'))
   ```

### Linux

1. **Instale Drivers NVIDIA**
   ```bash
   sudo apt update
   sudo apt install nvidia-driver-525
   ```

2. **Instale CUDA Toolkit**
   ```bash
   wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
   sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
   sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
   sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"
   sudo apt update
   sudo apt install cuda
   ```

3. **Instale cuDNN**
   ```bash
   sudo apt install libcudnn8
   ```

4. **Configure Variáveis de Ambiente**
   ```bash
   echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
   echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
   source ~/.bashrc
   ```

---

## 📦 Instalação Detalhada

### Opção 1: Usando Conda (Recomendado)

```bash
# Crie ambiente conda
conda create -n rice-disease python=3.10
conda activate rice-disease

# Instale TensorFlow
conda install -c conda-forge tensorflow

# Instale outras dependências
pip install jupyter matplotlib numpy pillow
```

### Opção 2: Usando pip + venv

```bash
# Crie ambiente virtual
python -m venv venv

# Ative o ambiente
# Windows:
venv\Scripts\activate
# Linux/Mac:
source venv/bin/activate

# Atualize pip
python -m pip install --upgrade pip

# Instale dependências
pip install -r requirements.txt
```

### Opção 3: Google Colab (Sem Instalação Local)

1. Acesse: https://colab.research.google.com/
2. Faça upload dos notebooks (.ipynb)
3. Faça upload do dataset ou use Google Drive
4. Execute as células

```python
# No Colab, monte o Google Drive
from google.colab import drive
drive.mount('/content/drive')

# Navegue até a pasta do projeto
%cd /content/drive/MyDrive/[pasta-do-projeto]
```

---

## 🗂️ Estrutura de Pastas

Após a instalação, organize assim:

```
projeto/
├── venv/                          # Ambiente virtual (não commitar)
├── TCC - Data/                    # Dataset de treinamento
│   ├── Bacterialblight/
│   ├── Blast/
│   ├── Brownspot/
│   ├── Healthy/
│   └── Tungro/
├── Test Data/                     # Dataset de teste
├── Models/                        # Modelos salvos
├── logs/                          # Logs do TensorBoard
├── TCC.ipynb                      # Notebook principal
├── VGG16.ipynb                    # Notebook VGG16
├── requirements.txt               # Dependências
└── README.md                      # Documentação
```

---

## 🧪 Testando a Instalação

### 1. Teste Básico

```python
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

print("TensorFlow version:", tf.__version__)
print("Num GPUs Available:", len(tf.config.list_physical_devices('GPU')))
print("Numpy version:", np.__version__)
```

### 2. Teste de GPU

```python
import tensorflow as tf

# Verifica GPU
gpus = tf.config.list_physical_devices('GPU')
if gpus:
    print(f"GPU detectada: {gpus[0].name}")
    # Teste simples
    with tf.device('/GPU:0'):
        a = tf.constant([[1.0, 2.0], [3.0, 4.0]])
        b = tf.constant([[1.0, 1.0], [0.0, 1.0]])
        c = tf.matmul(a, b)
        print("Teste de GPU bem-sucedido!")
else:
    print("Nenhuma GPU detectada. Usando CPU.")
```

### 3. Teste de Carregamento de Imagem

```python
from tensorflow.keras.preprocessing import image
import numpy as np

# Carregue uma imagem de teste
img_path = 'TCC - Data/Healthy/IMG_20190419_123623.jpg'
img = image.load_img(img_path, target_size=(300, 300))
img_array = image.img_to_array(img)
print(f"Imagem carregada com sucesso! Shape: {img_array.shape}")
```

---

## 🐛 Solução de Problemas

### Problema: "No module named 'tensorflow'"

**Solução:**
```bash
pip install tensorflow
# ou para GPU:
pip install tensorflow[and-cuda]
```

### Problema: GPU não detectada

**Solução:**
1. Verifique drivers NVIDIA: `nvidia-smi`
2. Reinstale CUDA e cuDNN
3. Verifique compatibilidade: https://www.tensorflow.org/install/source#gpu

### Problema: Erro de memória (OOM)

**Solução:**
```python
# Limite uso de memória GPU
gpus = tf.config.list_physical_devices('GPU')
if gpus:
    tf.config.experimental.set_memory_growth(gpus[0], True)
```

### Problema: Jupyter não encontra kernel

**Solução:**
```bash
python -m ipykernel install --user --name=venv
```

### Problema: Importação lenta do TensorFlow

**Solução:**
```bash
# Desabilite otimizações na primeira execução
export TF_CPP_MIN_LOG_LEVEL=2
```

---

## 📚 Recursos Adicionais

### Documentação Oficial
- TensorFlow: https://www.tensorflow.org/install
- Keras: https://keras.io/getting_started/
- CUDA: https://docs.nvidia.com/cuda/

### Tutoriais
- TensorFlow Tutorials: https://www.tensorflow.org/tutorials
- Keras Examples: https://keras.io/examples/

### Comunidade
- TensorFlow Forum: https://discuss.tensorflow.org/
- Stack Overflow: https://stackoverflow.com/questions/tagged/tensorflow

---

## ✅ Checklist de Instalação

- [ ] Python 3.8+ instalado
- [ ] Ambiente virtual criado e ativado
- [ ] Dependências instaladas (`requirements.txt`)
- [ ] TensorFlow funcionando
- [ ] GPU detectada (se aplicável)
- [ ] Jupyter Notebook funcionando
- [ ] Dataset organizado nas pastas corretas
- [ ] Teste de carregamento de imagem bem-sucedido

---

## 🆘 Precisa de Ajuda?

Se você encontrou problemas não listados aqui:

1. Verifique as [Issues](https://github.com/[usuario]/[repositorio]/issues) existentes
2. Abra uma nova issue com:
   - Sistema operacional
   - Versão do Python
   - Mensagem de erro completa
   - Passos para reproduzir

---

**Instalação concluída com sucesso? Vá para o [README.md](README.md) para começar a usar o projeto!**
