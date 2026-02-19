# ⚡ Guia Rápido de Início

Este guia vai te ajudar a começar a usar o projeto em poucos minutos!

---

## 🚀 Início Rápido (5 minutos)

### 1️⃣ Instale as Dependências

```bash
pip install tensorflow numpy matplotlib jupyter
```

### 2️⃣ Abra o Notebook

```bash
jupyter notebook TCC.ipynb
```

### 3️⃣ Execute as Células

Pressione `Shift + Enter` em cada célula sequencialmente.

---

## 🎯 Uso Básico

### Carregar Modelo Treinado

```python
import tensorflow as tf

# Carregar modelo
model = tf.keras.models.load_model('Models/TCC_0.13L_9820acc.keras')
```

### Fazer Predição em Uma Imagem

```python
import numpy as np
from tensorflow.keras.preprocessing import image

# Carregar imagem
img_path = 'caminho/para/sua/imagem.jpg'
img = image.load_img(img_path, target_size=(300, 300))
img_array = image.img_to_array(img) / 255.0
img_array = np.expand_dims(img_array, axis=0)

# Predição
prediction = model.predict(img_array)

# Classes
classes = ['Bacterial Blight', 'Blast', 'Brownspot', 'Healthy', 'Tungro']
predicted_class = classes[np.argmax(prediction)]
confidence = np.max(prediction) * 100

print(f"Doença: {predicted_class}")
print(f"Confiança: {confidence:.2f}%")
```

### Visualizar Resultado

```python
import matplotlib.pyplot as plt

# Mostrar imagem
plt.figure(figsize=(10, 5))

plt.subplot(1, 2, 1)
plt.imshow(img)
plt.title(f'Imagem Original')
plt.axis('off')

plt.subplot(1, 2, 2)
plt.bar(classes, prediction[0])
plt.title('Probabilidades')
plt.xticks(rotation=45, ha='right')
plt.ylabel('Probabilidade')
plt.tight_layout()
plt.show()

print(f"\n🎯 Resultado: {predicted_class}")
print(f"📊 Confiança: {confidence:.2f}%")
```

---

## 📊 Treinar Novo Modelo

### Preparar Dados

```python
import tensorflow as tf

# Carregar dataset
data_dir = 'TCC - Data'
data = tf.keras.utils.image_dataset_from_directory(
    data_dir,
    label_mode='categorical',
    image_size=(300, 300),
    batch_size=32
)

# Normalizar
norm_data = data.map(lambda x, y: (x/255, y))

# Dividir dados
train_size = int(len(norm_data) * 0.7)
val_size = int(len(norm_data) * 0.2)

train = norm_data.take(train_size)
validation = norm_data.skip(train_size).take(val_size)
test = norm_data.skip(train_size + val_size)
```

### Criar Modelo Simples

```python
from tensorflow.keras import layers, models

model = models.Sequential([
    layers.Conv2D(32, (3, 3), activation='relu', input_shape=(300, 300, 3)),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(64, (3, 3), activation='relu'),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(64, (3, 3), activation='relu'),
    layers.Flatten(),
    layers.Dense(64, activation='relu'),
    layers.Dropout(0.5),
    layers.Dense(5, activation='softmax')
])

model.compile(
    optimizer='adam',
    loss='categorical_crossentropy',
    metrics=['accuracy']
)
```

### Treinar

```python
history = model.fit(
    train,
    epochs=10,
    validation_data=validation
)
```

### Salvar Modelo

```python
model.save('meu_modelo.keras')
```

---

## 📈 Visualizar Métricas

### Gráfico de Acurácia

```python
import matplotlib.pyplot as plt

plt.figure(figsize=(12, 4))

# Acurácia
plt.subplot(1, 2, 1)
plt.plot(history.history['accuracy'], label='Treino')
plt.plot(history.history['val_accuracy'], label='Validação')
plt.title('Acurácia do Modelo')
plt.xlabel('Época')
plt.ylabel('Acurácia')
plt.legend()
plt.grid(True)

# Loss
plt.subplot(1, 2, 2)
plt.plot(history.history['loss'], label='Treino')
plt.plot(history.history['val_loss'], label='Validação')
plt.title('Loss do Modelo')
plt.xlabel('Época')
plt.ylabel('Loss')
plt.legend()
plt.grid(True)

plt.tight_layout()
plt.show()
```

---

## 🔍 Avaliar Modelo

### Matriz de Confusão

```python
from sklearn.metrics import confusion_matrix, classification_report
import seaborn as sns

# Fazer predições no conjunto de teste
y_true = []
y_pred = []

for images, labels in test:
    predictions = model.predict(images)
    y_true.extend(np.argmax(labels.numpy(), axis=1))
    y_pred.extend(np.argmax(predictions, axis=1))

# Matriz de confusão
cm = confusion_matrix(y_true, y_pred)

plt.figure(figsize=(10, 8))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=classes,
            yticklabels=classes)
plt.title('Matriz de Confusão')
plt.ylabel('Verdadeiro')
plt.xlabel('Predito')
plt.tight_layout()
plt.show()

# Relatório de classificação
print("\nRelatório de Classificação:")
print(classification_report(y_true, y_pred, target_names=classes))
```

---

## 🎨 Exemplos Práticos

### Exemplo 1: Processar Múltiplas Imagens

```python
import os

# Diretório com imagens
image_dir = 'Test Data/Healthy'
results = []

for img_name in os.listdir(image_dir)[:5]:  # Primeiras 5 imagens
    img_path = os.path.join(image_dir, img_name)
    
    # Carregar e processar
    img = image.load_img(img_path, target_size=(300, 300))
    img_array = image.img_to_array(img) / 255.0
    img_array = np.expand_dims(img_array, axis=0)
    
    # Predição
    pred = model.predict(img_array, verbose=0)
    predicted_class = classes[np.argmax(pred)]
    confidence = np.max(pred) * 100
    
    results.append({
        'imagem': img_name,
        'classe': predicted_class,
        'confianca': confidence
    })
    
    print(f"{img_name}: {predicted_class} ({confidence:.2f}%)")
```

### Exemplo 2: Salvar Predições em CSV

```python
import pandas as pd

# Criar DataFrame
df = pd.DataFrame(results)

# Salvar
df.to_csv('predicoes.csv', index=False)
print("\nPredições salvas em 'predicoes.csv'")
```

### Exemplo 3: Visualizar Predições Incorretas

```python
# Encontrar predições incorretas
incorrect = []

for images, labels in test.take(10):
    predictions = model.predict(images, verbose=0)
    
    for i in range(len(images)):
        true_label = np.argmax(labels[i])
        pred_label = np.argmax(predictions[i])
        
        if true_label != pred_label:
            incorrect.append({
                'image': images[i],
                'true': classes[true_label],
                'predicted': classes[pred_label],
                'confidence': np.max(predictions[i]) * 100
            })

# Visualizar
if incorrect:
    plt.figure(figsize=(15, 5))
    for i, item in enumerate(incorrect[:3]):
        plt.subplot(1, 3, i+1)
        plt.imshow(item['image'])
        plt.title(f"Real: {item['true']}\nPredito: {item['predicted']}\n({item['confidence']:.1f}%)")
        plt.axis('off')
    plt.tight_layout()
    plt.show()
else:
    print("Nenhuma predição incorreta encontrada!")
```

---

## 🛠️ Dicas Úteis

### Verificar GPU

```python
import tensorflow as tf
print("GPU disponível:", tf.config.list_physical_devices('GPU'))
```

### Limitar Uso de Memória GPU

```python
gpus = tf.config.list_physical_devices('GPU')
if gpus:
    tf.config.experimental.set_memory_growth(gpus[0], True)
```

### Usar TensorBoard

```python
# Durante o treinamento
tensorboard_callback = tf.keras.callbacks.TensorBoard(log_dir='./logs')

history = model.fit(
    train,
    epochs=10,
    validation_data=validation,
    callbacks=[tensorboard_callback]
)

# Visualizar
# No terminal: tensorboard --logdir=logs
```

---

## 🆘 Problemas Comuns

### Erro: "Out of Memory"

```python
# Reduza o batch size
data = tf.keras.utils.image_dataset_from_directory(
    data_dir,
    batch_size=16  # Ao invés de 32
)
```

### Erro: "Module not found"

```bash
pip install [nome-do-modulo]
```

### Modelo muito lento

```python
# Use GPU ou reduza tamanho da imagem
data = tf.keras.utils.image_dataset_from_directory(
    data_dir,
    image_size=(150, 150)  # Ao invés de 300x300
)
```

---

## 📚 Próximos Passos

1. ✅ Experimente com diferentes arquiteturas
2. ✅ Implemente data augmentation
3. ✅ Teste com suas próprias imagens
4. ✅ Crie uma interface web
5. ✅ Leia a [documentação completa](README.md)

---

## 🔗 Links Úteis

- [README Completo](README.md)
- [Guia de Instalação](INSTALL.md)
- [Documentação Acadêmica](DOCUMENTACAO_ACADEMICA.md)
- [Como Contribuir](CONTRIBUTING.md)

---

**Pronto para começar? Abra o notebook e divirta-se! 🚀**
