CREATE TABLE cliente(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    email VARCHAR(70) NOT NULL UNIQUE, 
    senha VARCHAR(20) NOT NULL, 
    cpf VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE departamento(
    numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT
);

CREATE TABLE endereco(
    num_seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(5) NOT NULL,
    logradouro VARCHAR(50) NOT NULL ,
    numero INTEGER,
    compl VARCHAR(20),
    bairro VARCHAR(30),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10),
    id_cliente INTEGER NOT NULL,
    CONSTRAINT endereco_cliente FOREIGN KEY
        (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE pedido(
    numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(1) NOT NULL,
    data_pedido DATE,
    valor_bruto DOUBLE DEFAULT 0,
    desconto DOUBLE,
    valor_liq DOUBLE,
    id_cliente INTEGER NOT NULL,
    CONSTRAINT cliente_pedido FOREIGN KEY
        (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE produto(
    codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DOUBLE,
    estoque INTEGER,
    link_foto VARCHAR(255),
    numero_depto INTEGER NOT NULL,
    CONSTRAINT produto_depto FOREIGN KEY
        (numero_depto) REFERENCES departamento(numero)
);

CREATE TABLE item_pedido(
    seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantidade INTEGER,
    preco_unitario DOUBLE,
    preco_final DOUBLE,
    codigo_produto INTEGER NOT NULL,
    numero_pedido INTEGER NOT NULL,

    CONSTRAINT item_produto FOREIGN KEY
        (codigo_produto) REFERENCES produto(codigo),

    CONSTRAINT item_pedido FOREIGN KEY
        (numero_pedido) REFERENCES pedido(numero)
);



----------//-----------------//-----------------//------------//------

INSERT INTO departamento(codigo, nome, descricao) VALUES
	(1, "Tecnologia", "Produtos para computadores");
    
INSERT INTO departamento VALUES (null, 'Eletronicos', 'Tudo que não é computador e liga na tomada');

INSERT INTO departamento VALUES
	(null, 'Games', 'Para jogadores Hard level'),
    (null, 'Acessórios', 'Cabos e conectores que a gente sempre perde'),
    (null, 'Alimentação', 'Porque DEV não vive só de dogão');

select * from produto;

INSERT INTO produto VALUES
	(null, 'Computador', 'Computador cheio de led top de linha', 2500.0, 3, './imagens/computador.png', 10);


----------//-----------------//-----------------//------------//------

select * from departamento;

select * from produto;

update departamento set nome ="Informatica e Tecnologia" where numero=1;

select * from produto;

delete from produto where codigo = 1;
delete from departamento where codigo = 1;




------------------------ consultas --------------------------------------
-- recuperar todos os produtos
select * from produto;

-- buscar produtos por alguma palavra-chave -> se fizer uso de % quer dizer que pode ser utilizado pra buscar palavras que apareçam antes ou depois!
-- exemplo -> textoAntes USB textoDepois ----> se quisermos que ele procure a palavra que possa estar entre textoAntes e textoDepois utilizamos a %(antes e depois
-- da palavra-chave)
select * from produto where nome like "%USB%";


-- recuperando o total faturado (sem critério algum)
select sum(valor_final) from pedido;

-- recuperando todos os pedidos!
select * from pedido;

-- quero saber quantos clientes eu tenho
select count(id) from cliente;

-- a mesma consulta acima, mudando o titulo da coluna
select count(id) as 'total de clientes' from cliente;

-- selecionando tudo
select * from cliente;

-- selecionado algumas colunas
select id, nome, cpf, senha from cliente;

-- buscando através de um critério
select * from cliente where id = 1;

-- ordenando clientes pelo nome (ordem crescente);
select * from cliente order by nome asc



-- como saber quantos produtos há em cada departamento
select * from produto;

-- recuperando quantos produtos há em cada um dos departamentos
select departamento_codigo, count(codigo) from produto
	group by departamento_codigo;
    
-- recupernado a somatoria dos protudos por departamento
select departamento_codigo, sum(preco*estoque) from produto
	group by departamento_codigo;


------------- junções 2 tabelas----------------------------------------
-- junção simples como produto cartesiano
select * from produto inner join departamento;

--  junção fazendo a relação entre produto e departamento
select * from produto inner join departamento
	on produto.departamento_codigo = departamento.codigo;
    
-- recuperar todos os clientes e seus respectivos endereços
select * from cliente inner join endereco
	on endereco.cliente_id = cliente.id;



----------------------------- junções 3 ou mais tabelas ---------------------------
-- passo 1: a partir dos pedidos, faço a junção com os itens de pedido
-- passo 2: fazer a junção com produto
-- passo 3: fazer a junção com cliente
select * from pedido
	inner join item_pedido on pedido.numero = item_pedido.pedido_numero
	inner join produto on produto.codigo = item_pedido.produto_codigo
    inner join cliente on pedido.cliente_id = cliente.id;
    
-- a mesma consulta anterior, porém buscando todos os dados do pedido + nome do cliente + o nome do produto comprado
select pedido.numero, pedido.data_pedido, pedido.valor_bruto, pedido.desconto, pedido.valor_final, cliente.nome, produto.nome from pedido
	inner join item_pedido on pedido.numero = item_pedido.pedido_numero
	inner join produto on produto.codigo = item_pedido.produto_codigo
    inner join cliente on pedido.cliente_id = cliente.id
    order by pedido.numero;
    
-- quero totais de pedidos por cliente (inclusive com o nome deles)
select cliente.nome, pedido.cliente_id, sum(pedido.valor_final) from pedido
	inner join cliente on pedido.cliente_id = cliente.id
    group by pedido.cliente_id;
    
--------------------- junção externa ----------------------------------------------
-- solução para isso: usar uma junção externa (outer join)
select * from departamento left outer join produto
	on departamento.codigo = produto.departamento_codigo;
    
-- agora usando right outer join
select * from produto right outer join departamento
	on departamento.codigo = produto.departamento_codigo;


------------------- subconsultas --------------------------------------------------

-- gostaria de buscar todos os pedidos que possuem o produto mais caro neles

-- como saber qual o produto mais caro?
select * from produto order by preco desc limit 1;
-- no caso do having é usado para tratar com dados calculados
select * from produto having max(preco);
-- e essa ultima já é utilizando subconsultas
select * from produto where preco = (select max(preco) from produto);

-- mas na verdade eu quero os pedidos que contem este produto
select * from pedido inner join item_pedido 
	on item_pedido.pedido_numero = pedido.numero
    where item_pedido.produto_codigo = 
    (select codigo from produto having max(preco));

-- caso eu queria o(s) cliente(s) que compraram este produto mais caro, basta fazer na consulta externa uma junção com cliente
-- e recuperar seu nome
select * from cliente inner join pedido on cliente.id = pedido.cliente_id
	inner join item_pedido on item_pedido.pedido_numero = pedido.numero
    where item_pedido.produto_codigo = (select codigo from produto having max(preco));

------------------------ AULAS --------------------------------

-- caso não queira seguir a ordem, poderia utilizar
INSERT INTO departamento(duracao, nome, ano_lancamento) VALUES (120, "Eu Robo", 206);

-- usando o LEFT JOIN trazemos todos os filmes mesmo aqueles que não tem nenhuma
-- relação com as tabales filmes_generos e generos!
SELECT filmes.*, generos.nome AS 'Nome do Genero' FROM filmes
    LEFT JOIN filmes_generos on filmes.id = filmes_generos.filme_id
    LEFT JOIN generos on filmes_generos.genero_id = generos.id;