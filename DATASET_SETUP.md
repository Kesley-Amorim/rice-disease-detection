# 📥 Como Configurar o Dataset

Este guia explica como baixar e organizar o dataset para usar com o projeto.

---

## ⚠️ Importante

Devido ao tamanho do dataset (~3.8GB), as imagens **não estão incluídas** neste repositório. Você precisa baixá-las das fontes originais e organizá-las conforme descrito abaixo.

---

## 📋 Passo a Passo

### 1. Baixar os Datasets

Faça o download das imagens das seguintes fontes:

#### Opção A: Mendeley Data (Recomendado)
```
🔗 Link: https://data.mendeley.com/datasets/fwcj7stb8r/1
📦 Tamanho: ~2.5GB
✅ Mais completo e organizado
```

1. Acesse o link acima
2. Clique em "Download all files"
3. Extraia o arquivo ZIP

#### Opção B: Kaggle
```
🔗 Link: https://www.kaggle.com/datasets/shayanriyaz/riceleafs
📦 Tamanho: ~1.2GB
```

1. Faça login no Kaggle
2. Clique em "Download"
3. Extraia o arquivo ZIP

#### Opção C: GitHub
```
🔗 Link: https://github.com/aldrin233/RiceDiseases-DataSet
📦 Tamanho: Variável
```

1. Clone o repositório ou baixe como ZIP
2. Extraia se necessário

---

### 2. Organizar as Pastas

Após baixar, organize as imagens na seguinte estrutura:

```
seu-projeto/
├── TCC - Data/
│   ├── Bacterialblight/
│   │   ├── BACTERIALBLIGHT_001.jpg
│   │   ├── BACTERIALBLIGHT_002.jpg
│   │   └── ...
│   ├── Blast/
│   │   ├── BLAST_001.jpg
│   │   ├── BLAST_002.jpg
│   │   └── ...
│   ├── Brownspot/
│   │   ├── BROWNSPOT_001.jpg
│   │   ├── BROWNSPOT_002.jpg
│   │   └── ...
│   ├── Healthy/
│   │   ├── HEALTHY_001.jpg
│   │   ├── HEALTHY_002.jpg
│   │   └── ...
│   └── Tungro/
│       ├── TUNGRO_001.jpg
│       ├── TUNGRO_002.jpg
│       └── ...
│
└── Test Data/
    ├── Bacterialblight/
    ├── Blast/
    ├── Brownspot/
    ├── Healthy/
    └── Tungro/
```

---

### 3. Verificar a Estrutura

Execute este script Python para verificar se tudo está correto:

```python
import os

# Verificar estrutura do dataset
base_dirs = ['TCC - Data', 'Test Data']
classes = ['Bacterialblight', 'Blast', 'Brownspot', 'Healthy', 'Tungro']

for base_dir in base_dirs:
    print(f"\n📁 {base_dir}/")
    if not os.path.exists(base_dir):
        print(f"   ❌ Pasta não encontrada!")
        continue
    
    for class_name in classes:
        class_path = os.path.join(base_dir, class_name)
        if os.path.exists(class_path):
            num_images = len([f for f in os.listdir(class_path) 
                            if f.endswith(('.jpg', '.jpeg', '.png'))])
            print(f"   ✅ {class_name}: {num_images} imagens")
        else:
            print(f"   ❌ {class_name}: Pasta não encontrada")

print("\n✨ Verificação concluída!")
```

---

### 4. Distribuição Esperada

Após organizar, você deve ter aproximadamente:

| Classe | Treinamento | Teste | Total |
|--------|-------------|-------|-------|
| Bacterial Blight | ~1,400 | ~184 | ~1,584 |
| Blast | ~1,400 | ~184 | ~1,584 |
| Brownspot | ~1,400 | ~184 | ~1,584 |
| Healthy | ~1,400 | ~184 | ~1,584 |
| Tungro | ~1,400 | ~184 | ~1,584 |
| **Total** | **~7,000** | **~920** | **~7,920** |

---

## 🔄 Alternativa: Usar Seus Próprios Dados

Se você quiser usar suas próprias imagens:

1. Tire fotos de folhas de arroz
2. Organize nas mesmas 5 categorias
3. Mantenha a estrutura de pastas
4. Recomendado: pelo menos 200 imagens por classe

### Dicas para Coleta de Imagens:

- ✅ Boa iluminação natural
- ✅ Fundo uniforme (preferencialmente branco)
- ✅ Folha centralizada na imagem
- ✅ Diferentes ângulos e distâncias
- ✅ Resolução mínima: 300x300 pixels
- ❌ Evite imagens borradas
- ❌ Evite sombras fortes

---

## 🐛 Problemas Comuns

### Erro: "FileNotFoundError"
**Solução:** Verifique se as pastas estão nomeadas exatamente como mostrado acima (case-sensitive).

### Erro: "Insufficient data"
**Solução:** Certifique-se de ter pelo menos 100 imagens por classe.

### Imagens não carregam
**Solução:** Verifique se as imagens estão em formato JPG, JPEG ou PNG.

---

## 📚 Referências dos Datasets

### Citação Mendeley Data
```
Sethy, P. K., Barpanda, N. K., Rath, A. K., & Behera, S. K. (2020). 
Rice Leaf Image Samples. Mendeley Data, V1. 
DOI: 10.17632/fwcj7stb8r.1
```

### Citação Kaggle
```
Shayan Riyaz. (2019). Rice Leafs Dataset. 
Kaggle. https://www.kaggle.com/datasets/shayanriyaz/riceleafs
```

---

## 💡 Dicas

1. **Use SSD:** Para melhor performance durante o treinamento
2. **Backup:** Mantenha uma cópia de segurança do dataset
3. **Augmentation:** O código já inclui data augmentation, não precisa duplicar imagens manualmente
4. **GPU:** Recomendado para treinar com todo o dataset

---

## 🆘 Precisa de Ajuda?

Se tiver problemas para configurar o dataset:

1. Verifique a [documentação completa](DATASET.md)
2. Consulte as [referências](REFERENCES.md)
3. Abra uma [issue](../../issues) no GitHub

---

<div align="center">

**Pronto para começar? Execute o notebook `TCC.ipynb`!** 🚀

</div>
