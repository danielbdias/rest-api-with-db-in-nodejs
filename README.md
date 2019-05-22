# Rest API with DB in Node.js

Este código mostra exemplos de estrutura de aplicações em Node.js modeladas como APIs com interação a banco de dados.

Algumas histórias que iremos modelar nestas APIs são:

````
- "O sistema deve ter um cadastro com os nomes de usuários dele"
- "O endereço deve ser usado no GPS para conseguir calcular a rota"
- "Eu devo poder salvar meu endereço de casa e do trabalho no aplicativo"
- "Um endereço é único no sistema e deve ter um logradouro, número, CEP, cidade e tipo (residência ou trabalho)"
- "Uma rota é um conjunto de instruções ordenadas, que descrevem a direção a seguir para o destino"
- "Um histórico de pesquisa deve ser armazenado no sistema para auditoria, contendo os dados da rota e o usuário que a pediu"
````

Os requisitos para rodar este código são:
- Node.js 12 ([como instalar?](https://github.com/backend-br/como-instalar-xyz/tree/master/tutoriais/nodejs))
- Yarn package manager ([como instalar?](https://yarnpkg.com/pt-BR/docs/install#alternatives-stable))
- Docker, com o docker-compose ([como instalar?](https://github.com/backend-br/como-instalar-xyz/tree/master/tutoriais/docker))

### Como iniciar um dos exemplos?

1. Acesse a pasta de um dos exemplos (01-beginner, 02-intermediate, 03-advanced)
2. Rode o comando `yarn install` na pasta raiz do exemplo para instalar as dependências;
3. Inicie o banco de dados postgres em um container docker com `docker-compose up -d`
4. Crie as tabelas iniciais do banco de dados com `yarn db:create`
5. Inicie a aplicação com `yarn start`

### Observações

Este código é um exemplo de como escrever APIs utilizando um projeto Node.js / Javascript, com algumas adaptações pertinentes a linguagem.

Sinta-se a vontade para contactar no caso de quaisquer dúvidas em [@danielbdias](https://twitter.com/danielbdias)
