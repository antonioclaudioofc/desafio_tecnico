### 1. Contexto

Esta etapa tem como objetivo preparar o ambiente de desenvolvimento para execução do projeto Phoenix, permitindo iniciar a implementação da interface utilizando LiveView.

---

### 2. Abordagem

Para realizar o setup inicial, segui a documentação oficial do Elixir e Phoenix, priorizando a instalação das ferramentas essenciais e a validação do funcionamento do ambiente antes de iniciar o desenvolvimento.

---

### 3. Implementação

A instalação do Elixir foi realizada seguindo as instruções disponíveis na documentação oficial:
https://elixir-lang.org/install.html

Após a instalação, foi feita a verificação do ambiente utilizando o comando `elixir -v`, com o objetivo de validar se a linguagem estava corretamente configurada no sistema.

---

### 4. Problemas Encontrados

Durante o processo, o comando `elixir -v` não foi reconhecido no terminal, mesmo após a instalação ter sido concluída com sucesso.

---

### 5. Análise e Decisões

A falha no reconhecimento do comando indicava que as variáveis de ambiente (PATH) não haviam sido atualizadas corretamente na sessão atual do sistema.

Considerando o comportamento do Windows em relação à propagação de variáveis de ambiente, identifiquei que esse tipo de problema pode ocorrer quando o terminal não é reiniciado após a instalação de novas ferramentas.

---

### 6. Comparações

Em ambientes baseados em Linux, a atualização do ambiente tende a ser mais imediata.

Já no Windows, alterações no PATH realizadas por instaladores podem exigir o reinício do sistema para serem aplicadas corretamente.

---

### 7. Trade-offs

A solução adotada (reinicialização do sistema) é simples e eficaz, porém interrompe o fluxo de desenvolvimento momentaneamente.

Alternativamente, seria possível reiniciar apenas o terminal ou configurar manualmente o PATH, mas a reinicialização garantiu a aplicação completa das variáveis de ambiente.

---

### 8. Próximos Passos

Com o ambiente configurado corretamente, os próximos passos são:

* Validar a instalação do Phoenix
* Criar e executar o projeto inicial
* Iniciar a exploração do funcionamento do LiveView

---
