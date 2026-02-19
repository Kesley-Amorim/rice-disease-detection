# 📚 Documentação Acadêmica - TCC

## Identificação de Doenças em Folhas de Arroz Utilizando Redes Neurais Convolucionais

---

## 📖 Resumo

Este trabalho apresenta o desenvolvimento de um sistema de classificação automática de doenças em folhas de arroz utilizando técnicas de Deep Learning, especificamente Redes Neurais Convolucionais (CNNs). O modelo desenvolvido é capaz de identificar cinco categorias distintas: Bacterial Blight, Blast, Brownspot, Healthy e Tungro, alcançando uma acurácia de 98.93% no conjunto de validação.

**Palavras-chave:** Deep Learning, Redes Neurais Convolucionais, Visão Computacional, Agricultura de Precisão, Classificação de Imagens, Fitopatologia.

---

## 1. Introdução

### 1.1 Contextualização

O arroz (Oryza sativa) é um dos cereais mais importantes para a alimentação mundial, sendo a base da dieta de mais de metade da população global. No entanto, as plantações de arroz são suscetíveis a diversas doenças que podem causar perdas significativas na produção, afetando a segurança alimentar e a economia agrícola.

### 1.2 Problemática

A identificação manual de doenças em plantações de arroz apresenta diversos desafios:
- Requer conhecimento especializado em fitopatologia
- É um processo demorado e custoso
- Pode resultar em diagnósticos tardios
- Dificulta o monitoramento em larga escala

### 1.3 Justificativa

O desenvolvimento de sistemas automatizados de detecção de doenças utilizando técnicas de visão computacional e aprendizado profundo pode:
- Acelerar o processo de diagnóstico
- Reduzir custos operacionais
- Permitir intervenções mais rápidas e eficazes
- Democratizar o acesso a diagnósticos precisos
- Contribuir para a agricultura de precisão

### 1.4 Objetivos

#### Objetivo Geral
Desenvolver um sistema de classificação automática de doenças em folhas de arroz utilizando Redes Neurais Convolucionais.

#### Objetivos Específicos
1. Construir e organizar um dataset balanceado de imagens de folhas de arroz
2. Implementar e treinar modelos de CNN para classificação multiclasse
3. Avaliar o desempenho dos modelos desenvolvidos
4. Comparar diferentes arquiteturas (modelo customizado vs. transfer learning)
5. Validar a aplicabilidade prática do sistema

---

## 2. Fundamentação Teórica

### 2.1 Doenças do Arroz

#### 2.1.1 Bacterial Blight (Queima Bacteriana)
- **Agente:** Xanthomonas oryzae
- **Sintomas:** Lesões alongadas nas folhas, amarelamento
- **Impacto:** Redução de até 50% na produção

#### 2.1.2 Blast (Brusone)
- **Agente:** Magnaporthe oryzae
- **Sintomas:** Lesões em forma de losango, necrose
- **Impacto:** Uma das doenças mais destrutivas do arroz

#### 2.1.3 Brownspot (Mancha Parda)
- **Agente:** Bipolaris oryzae
- **Sintomas:** Manchas circulares marrons
- **Impacto:** Redução na qualidade dos grãos

#### 2.1.4 Tungro
- **Agente:** Vírus transmitido por cigarrinhas
- **Sintomas:** Amarelamento, nanismo
- **Impacto:** Perdas severas em regiões tropicais

### 2.2 Redes Neurais Convolucionais

#### 2.2.1 Conceitos Fundamentais
As CNNs são arquiteturas de redes neurais especializadas no processamento de dados com estrutura de grade, como imagens. Principais componentes:

- **Camadas Convolucionais:** Extraem características locais através de filtros
- **Pooling Layers:** Reduzem dimensionalidade mantendo informações relevantes
- **Camadas Densas:** Realizam a classificação final
- **Funções de Ativação:** Introduzem não-linearidade (ReLU, Softmax)

#### 2.2.2 Transfer Learning
Técnica que utiliza modelos pré-treinados em grandes datasets (como ImageNet) e os adapta para tarefas específicas, reduzindo tempo de treinamento e necessidade de dados.

### 2.3 Métricas de Avaliação

- **Acurácia:** Proporção de predições corretas
- **Loss (Perda):** Medida do erro do modelo
- **Precisão:** Proporção de verdadeiros positivos
- **Recall:** Capacidade de identificar todos os casos positivos
- **F1-Score:** Média harmônica entre precisão e recall

---

## 3. Metodologia

### 3.1 Dataset

#### 3.1.1 Composição
- **Total de Imagens:** 7,123 imagens
- **Classes:** 5 (balanceadas)
- **Resolução:** Variável, redimensionada para 300x300 pixels
- **Formato:** JPG

#### 3.1.2 Divisão dos Dados
```
Treinamento: 70% (4,986 imagens / 156 batches)
Validação:   20% (1,425 imagens / 44 batches)
Teste:       10% (712 imagens / 23 batches)
Batch Size:  32 imagens
```

### 3.2 Pré-processamento

1. **Carregamento:** Utilização de `tf.keras.utils.image_dataset_from_directory`
2. **Redimensionamento:** Todas as imagens para 300x300 pixels
3. **Normalização:** Divisão por 255 (escala 0-1)
4. **Codificação:** One-hot encoding para labels categóricas

```python
norm_data = data.map(lambda x, y: (x/255, y))
```

### 3.3 Arquiteturas Implementadas

#### 3.3.1 Modelo Customizado (TCC.ipynb)
Arquitetura CNN desenvolvida especificamente para o problema:
- Múltiplas camadas convolucionais
- Pooling layers para redução dimensional
- Dropout para regularização
- Camadas densas para classificação final
- Ativação Softmax na saída (5 classes)

#### 3.3.2 Transfer Learning - VGG16 (VGG16.ipynb)
```python
Base Model: VGG16 (ImageNet)
- Parâmetros Totais: 14,717,253
- Parâmetros Treináveis: 2,565
- Parâmetros Congelados: 14,714,688
- Dropout: 0.2
- Camada de Saída: Dense(5) + Softmax
```

### 3.4 Treinamento

#### Configuração
- **Otimizador:** Adam
- **Loss Function:** Categorical Crossentropy
- **Métricas:** Accuracy
- **Épocas:** 20 (modelo principal)
- **Hardware:** GPU (CUDA-enabled)

#### Callbacks
- TensorBoard para visualização de métricas
- Logging de treino e validação

---

## 4. Resultados e Discussão

### 4.1 Desempenho do Modelo Principal

#### Métricas Finais (Época 20)
```
Training Accuracy:    99.44%
Training Loss:        0.0142
Validation Accuracy:  98.93%
Validation Loss:      0.0568
```

#### Evolução do Treinamento

| Época | Train Acc | Train Loss | Val Acc | Val Loss |
|-------|-----------|------------|---------|----------|
| 1     | 57.75%    | 1.3200     | 71.80%  | 0.7919   |
| 5     | 90.48%    | 0.2726     | 93.96%  | 0.1970   |
| 10    | 98.88%    | 0.0341     | 98.51%  | 0.0927   |
| 15    | 98.92%    | 0.0334     | 98.79%  | 0.0320   |
| 20    | 99.44%    | 0.0142     | 98.93%  | 0.0568   |

### 4.2 Análise dos Resultados

#### 4.2.1 Convergência
O modelo apresentou convergência rápida e estável:
- Melhoria significativa nas primeiras 5 épocas
- Estabilização após época 10
- Ausência de overfitting significativo

#### 4.2.2 Generalização
A diferença mínima entre acurácia de treino (99.44%) e validação (98.93%) indica boa capacidade de generalização.

#### 4.2.3 Comparação com Literatura
A acurácia alcançada (98.93%) está alinhada ou superior a trabalhos similares na área de detecção de doenças em plantas.

### 4.3 Modelo Salvo

```
Arquivo: Models/TCC_0.13L_9820acc.keras
Loss: 0.13
Accuracy: 98.20%
```

---

## 5. Conclusões

### 5.1 Principais Contribuições

1. **Desenvolvimento de Sistema Eficaz:** Modelo com 98.93% de acurácia para classificação de doenças em arroz

2. **Aplicabilidade Prática:** Sistema pode ser integrado em aplicações móveis ou sistemas de monitoramento

3. **Metodologia Replicável:** Código e arquitetura podem ser adaptados para outras culturas

4. **Contribuição para Agricultura de Precisão:** Ferramenta para diagnóstico rápido e preciso

### 5.2 Limitações

1. **Dataset Limitado:** Imagens coletadas em condições controladas
2. **Variabilidade Ambiental:** Necessidade de testes em diferentes condições de campo
3. **Estágios da Doença:** Modelo pode ter desempenho variável em diferentes estágios
4. **Recursos Computacionais:** Requer GPU para treinamento eficiente

### 5.3 Trabalhos Futuros

#### Curto Prazo
- Implementar data augmentation para aumentar robustez
- Testar em imagens de campo (condições reais)
- Desenvolver interface web/mobile

#### Médio Prazo
- Expandir para outras doenças e pragas
- Implementar detecção em tempo real
- Integrar com drones para monitoramento aéreo

#### Longo Prazo
- Sistema de recomendação de tratamentos
- Previsão de progressão de doenças
- Integração com IoT e sensores de campo

---

## 6. Referências Bibliográficas

### Artigos Científicos

1. **LeCun, Y., Bengio, Y., & Hinton, G.** (2015). Deep learning. Nature, 521(7553), 436-444.

2. **Simonyan, K., & Zisserman, A.** (2014). Very deep convolutional networks for large-scale image recognition. arXiv preprint arXiv:1409.1556.

3. **Mohanty, S. P., Hughes, D. P., & Salathé, M.** (2016). Using deep learning for image-based plant disease detection. Frontiers in plant science, 7, 1419.

4. **Ferentinos, K. P.** (2018). Deep learning models for plant disease detection and diagnosis. Computers and Electronics in Agriculture, 145, 311-318.

### Frameworks e Bibliotecas

5. **Abadi, M., et al.** (2016). TensorFlow: A system for large-scale machine learning. 12th USENIX symposium on operating systems design and implementation.

6. **Chollet, F., et al.** (2015). Keras. GitHub repository. https://github.com/fchollet/keras

### Recursos Online

7. **TensorFlow Documentation.** https://www.tensorflow.org/
8. **Keras Documentation.** https://keras.io/
9. **ImageNet.** http://www.image-net.org/

---

## 7. Apêndices

### Apêndice A - Código Principal

Ver arquivo: `TCC.ipynb`

### Apêndice B - Transfer Learning

Ver arquivo: `VGG16.ipynb`

### Apêndice C - Histórico de Treinamento

Ver arquivo: `HIST.txt`

### Apêndice D - Visualizações

Ver pasta: `Images for TCC/`

---

## 8. Informações do Trabalho

**Instituição:** [Nome da Instituição]  
**Curso:** [Nome do Curso]  
**Disciplina:** Trabalho de Conclusão de Curso (TCC)  
**Ano:** 2023  

**Autores:**
- Kesley H. P. Amorim
- Lucas Ferrari da Silva

**Orientadores:**
- Prof. José Guilherme Picolo
- Prof. Silvio Petroli Neto

---

<div align="center">

**Este documento foi gerado como parte do Trabalho de Conclusão de Curso**

*Todos os direitos reservados aos autores*

</div>
