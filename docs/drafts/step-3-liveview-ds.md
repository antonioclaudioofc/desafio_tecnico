# Passo 3: O Painel de Controle (Visualização Real-time)

## 1. O que foi feito
Criamos a tela onde o operador da fábrica consegue ver tudo o que está acontecendo. Usamos os componentes que criamos (Botões, Campos de texto e Cartões) para deixar a visualização.

## 2. Tela que "Pisca" em Tempo Real
Graças ao LiveView, a tela atua como um "espelho" do que acontece no servidor. Se uma tarefa nova entra (ou um sensor manda um alerta), o operador vê isso imediatamente sem precisar apertar o botão de atualizar (F5) na página.

## 3. Componentes Reutilizáveis
Criamos um "Design System" próprio. Isso significa que, se precisarmos de uma tela nova para outro tipo de sensor, já temos as peças prontas, o que agiliza muito o desenvolvimento.
