CREATE TABLE cliente(
	id int not null auto_increment primary key,
    nome varchar(45),
    sobrenome varchar(45),
    cpf varchar(11) unique,
    email varchar(80) unique,
    telefone varchar(45),
    data_nascimento date
);

CREATE TABLE enderecos(
	id int not null auto_increment primary key,
    rua varchar(45),
    numero varchar(20),
    complemento varchar(45),
    bairro varchar(45),
    uf varchar(2),
    cep varchar(8),
    cliente_id int not null,
    constraint endereco_cliente foreign key
		(cliente_id) references cliente(id)
);

CREATE TABLE reservas(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE,
    data_devolucao DATE,
    valor_reserva DOUBLE,
    cliente_id INT NOT NULL,
    CONSTRAINT reserva_cliente FOREIGN KEY
        (cliente_id) REFERENCES cliente(id)
);


CREATE TABLE reserva_filmes(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    filme_id INT NOT NULL,
    reserva_id INT NOT NULL,
    quantidade INT,
    CONSTRAINT reserva_filme FOREIGN KEY
        (filme_id) REFERENCES filmes(id),
    CONSTRAINT filme_reserva FOREIGN KEY
        (reserva_id) REFERENCES reservas(id)
);