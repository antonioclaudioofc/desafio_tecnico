### 1. Contexto

Esta etapa tem como objetivo registrar o entendimento inicial sobre a linguagem Elixir e o funcionamento do Phoenix LiveView, considerando que se trata do meu primeiro contato prático com essa stack.

---

### 2. Primeiras Impressões do Elixir

Durante o primeiro contato com Elixir, percebi que a linguagem segue fortemente o paradigma de programação funcional, com características como imutabilidade de dados, uso intensivo de funções e ausência de orientação a objetos tradicional.

Essa abordagem se mostrou semelhante a conceitos estudados anteriormente em programação funcional, especialmente utilizando Haskell, como o foco em transformação de dados e ausência de estados mutáveis.

Apesar da sintaxe ser inicialmente diferente do ecossistema JavaScript, a consistência do modelo funcional facilita a compreensão após o entendimento dos conceitos básicos.

---

### 3. Comparação com JavaScript/TypeScript

Ao comparar com JavaScript/TypeScript, algumas diferenças importantes ficaram evidentes:

* Em JavaScript, é comum o uso de estado mutável e programação orientada a objetos, enquanto em Elixir os dados são imutáveis e o foco está em funções puras.
* A manipulação de dados em Elixir ocorre principalmente através de transformações encadeadas (pipe operator), enquanto em JavaScript isso costuma ser feito com chamadas de funções aninhadas ou métodos encadeados.
* O pattern matching em Elixir substitui diversas estruturas condicionais comuns em JavaScript, oferecendo uma abordagem mais declarativa.

---

### 4. Entendimento do Phoenix LiveView

O Phoenix LiveView apresenta um modelo de desenvolvimento onde o estado da aplicação é mantido no servidor, sendo sincronizado com o cliente em tempo real por meio de WebSockets.

Nesse modelo:

* O servidor é responsável por gerenciar o estado da interface
* O cliente atua principalmente como camada de renderização
* Eventos do usuário são enviados ao servidor, que processa e retorna apenas as atualizações necessárias

Esse comportamento reduz a necessidade de JavaScript no cliente e simplifica parte da lógica de interface.

---

### 5. Comparação com React

Comparando com o modelo tradicional de SPA utilizando React:

* `useState` → substituído por `assigns` no LiveView
* Eventos como `onClick` → substituídos por `phx-click`
* Lógica de estado no cliente → centralizada no servidor
* Re-renderização no cliente → diffs enviados pelo servidor

Enquanto o React oferece maior controle no lado do cliente, o LiveView simplifica o gerenciamento de estado ao concentrar a lógica no servidor.

---

### 6. Trade-offs Observados

A abordagem do LiveView apresenta alguns trade-offs relevantes:

**Vantagens:**

* Redução da complexidade no front-end
* Menor necessidade de gerenciar estado no cliente
* Atualizações eficientes via diffs

**Desvantagens:**

* Dependência de conexão persistente (WebSocket)
* Possível impacto de latência em interações
* Menor controle direto sobre o comportamento no cliente

---

### 7. Decisões de Abordagem

Considerando o escopo do desafio e meu perfil focado em front-end, optei por:

* Priorizar a construção da interface e a experiência do usuário
* Utilizar o LiveView como ferramenta de renderização e gerenciamento de estado
* Evitar aprofundamento em conceitos avançados de Elixir que não são essenciais para o desafio

---

### 8. Próximos Passos

Com o entendimento inicial consolidado, os próximos passos serão:

* Construção do layout base do painel
* Definição de componentes reutilizáveis
* Implementação de interações utilizando eventos do LiveView
* Simulação de dados para validar a reatividade da interface
