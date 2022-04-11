# Estudos do mySQL

Entendendo alguns conceitos sobre relações e DB.

Durante as aulas foi visto como fazer um CRUD pelo próprio mySQL (bem legal)!

Também foi proposto um desafio

<br>


# Desafio

Nosso objetivo será gerar comandos para manipular um banco de dados sobre filmes.

O banco de dados é o arquivo [alimentacao-db-desafio.sql !](https://github.com/jguigo/aprendendo-mySQL/blob/main/alimentacao-db-desafio.sql)

E um modelo relacional!
![movies_erd](https://user-images.githubusercontent.com/83793609/162650351-21783e82-1661-44bc-a3b6-cc3e3c24fc1d.png)


1. Você deve criar um comando que liste todos os filmes cadastrados e seus
dados.
1. Você deve cadastrar uma nova linguagem que terá o código BR e o nome
Português(Brasil)
1. Você deverá cadastrar uma nova produtora de filme chamada: Lereby
Produções
1. Você deve cadastrar um novo filme com as seguintes informações:
* a. Nome do Filme: O Auto da Compadecida
* b. Estreia: 15 de setembro de 2000
* c. Resumo: As aventuras de João Grilo e Chicó, dois nordestinos
pobres que vivem de golpes para sobreviver. Eles estão sempre
enganando o povo de um pequeno vilarejo, inclusive o temido
cangaceiro Severino de Aracaju, que os persegue pela região.
* d. Popularidade : 2.157.166
* e. Tamanho: 157 min
* f. Receita R$ 11.496.994
* g. Produtora: Lereby Produções
* h. Linguagem Original Brasileira
* i. Gênero: comédia
* j. Os demais valores são nulos
5. Você deve atualizar o nome da linguagem com ID 24701 para
desconhecido
1. Você deve listar todas as pessoas ligadas ao cinema cadastrada com o
nome lee, independente se é sobrenome ou primeiro nome. Deve ter o
resultado de 965 pessoas.
1. você deve listar todos os filmes com duração maior de 130 minutos. Deve
ter o resultado de 527 filmes.
1. Você deve listar todos os filmes exibindo apenas seus nomes junto com as
empresas que criaram, também apenas o nome da empresa.
1. Você deve listar todos os filmes do gênero Fantasy: Deve ter o resultado
de 424 filmes
1.  Você deve listar o filme com a maior receita recebida. Deve exibir o filme
Avatar
1.  Você deve listar todos os filmes lançados antes do ano 1950.. Deve ser
listados 46 filmes;
1.  Você deve exibir todos os personagens interpretados pelo ator Tom Hanks.
Exibindo o nome dos personagens junto do ator. O resultado deve ser: 32
personagens.

<br>

Minha solução [alimentacao-db-desafio.sql !](https://github.com/jguigo/aprendendo-mySQL/blob/main/desafio-banco.sql)