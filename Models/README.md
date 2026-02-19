# 🤖 Modelos Treinados

Esta pasta deve conter os modelos treinados do projeto.

---

## ⚠️ Modelos Não Incluídos

Devido ao tamanho dos arquivos (>500MB cada), os modelos treinados não estão incluídos neste repositório.

---

## 📥 Como Obter os Modelos

### Opção 1: Treinar Você Mesmo (Recomendado)

Execute o notebook `TCC.ipynb` para treinar o modelo do zero:

```bash
jupyter notebook TCC.ipynb
```

O treinamento levará aproximadamente:
- **Com GPU:** 30-60 minutos
- **Sem GPU:** 2-4 horas

Os modelos serão salvos automaticamente nesta pasta.

### Opção 2: Download dos Modelos Pré-treinados

Se você não quiser treinar, pode solicitar os modelos aos autores:

**Contato:**
- Kesley H. P. Amorim
- Lucas Ferrari da Silva

Ou abra uma [issue no GitHub](../../issues) solicitando acesso aos modelos.

---

## 📊 Modelos Disponíveis

### 1. TCC.keras
- **Arquitetura:** CNN Customizada
- **Acurácia:** 98.93%
- **Tamanho:** ~515 MB
- **Épocas:** 20
- **Dataset:** 7,123 imagens

### 2. TCC_0.13L_9820acc.keras
- **Arquitetura:** CNN Customizada (otimizada)
- **Acurácia:** 98.20%
- **Loss:** 0.13
- **Tamanho:** ~515 MB
- **Melhor modelo para produção**

---

## 🔧 Como Usar os Modelos

Após obter os modelos, coloque-os nesta pasta e use:

```python
import tensorflow as tf

# Carregar modelo
model = tf.keras.models.load_model('Models/TCC_0.13L_9820acc.keras')

# Fazer predição
prediction = model.predict(img_array)
```

---

## 📝 Estrutura Esperada

```
Models/
├── README.md (este arquivo)
├── TCC.keras (após treinar ou baixar)
└── TCC_0.13L_9820acc.keras (após treinar ou baixar)
```

---

## 💡 Alternativas

Se você tem limitações de armazenamento, considere:

1. **Usar apenas um modelo:** O `TCC_0.13L_9820acc.keras` é suficiente
2. **Treinar com menos épocas:** Reduz o tempo mas pode diminuir a acurácia
3. **Usar Transfer Learning:** O notebook `VGG16.ipynb` usa um modelo menor

---

## 🆘 Problemas?

Se tiver dificuldades para treinar ou obter os modelos:

1. Verifique os [requisitos de sistema](../INSTALL.md)
2. Consulte o [guia de início rápido](../QUICKSTART.md)
3. Abra uma [issue](../../issues) no GitHub

---

<div align="center">

**Bom treinamento! 🚀**

</div>
