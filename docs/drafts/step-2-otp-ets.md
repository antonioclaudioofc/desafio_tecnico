# Passo 2: O Fluxo de Dados (Simulador via Todo List)

## 1. O que foi feito
Nesta fase, usamos a estrutura de **Lista de Tarefas** para simular como os sensores mandam informações. Cada tarefa criada representa um "alerta" ou "batimento" de um sensor da fábrica.

## 2. Armazenamento Rápido
Para garantir que o sistema não trave com muita informação, pensamos em uma estrutura que salva os dados primeiro de forma rápida e depois confirma no banco de dados. Isso garante que o sistema esteja sempre "ouvindo" a fábrica.

## 3. Por que simular com Tarefas?
A tarefa é o exemplo perfeito de um evento industrial: ela tem um ID, uma descrição e um momento em que aconteceu (Data/Hora). Validar isso em uma tela simples nos permite garantir que a lógica de "não perder eventos" esteja funcionando.
