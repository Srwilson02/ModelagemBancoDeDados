-- Versão: MySQL

-- Tabelas do modelo conceitual (aula 05, Slide 31)
CREATE DATABASE biblioteca;

Use biblioteca;

CREATE TABLE autor (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (30),
    nacionalidade VARCHAR (50)
);

CREATE TABLE livro (
	id INT AUTO_INCREMENT,
	isbn VARCHAR(20) PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
    ano_publicacao INT,
    editora VARCHAR(150),
	FOREIGN KEY	(id_autor)	REFERENCES autor (id)
);

CREATE TABLE exemplar (
    numero_tombo INT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    estado_conservacao VARCHAR(50),
    FOREIGN KEY (isbn) REFERENCES livro(isbn)
);

CREATE TABLE aluno (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email varchar(100),
    telefone INT,
    data_cadastro DATE DEFAULT(CURDATE())
);

CREATE TABLE emprestimo (
	id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    rgm VARCHAR(20) NOT NULL,
    numero_tombo INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_prevista DATE NOT NULL,
    data_real_devolucao DATE,
    FOREIGN KEY (rgm) REFERENCES aluno (rgm),
    FOREIGN KEY (numero_tombo) REFERENCES exemplar(numero_tombo)
);

CREATE TABLE livro_autor (
	id_livro_autor INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (isbn) REFERENCES livro(isbn),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
    UNIQUE (isbn, id_autor)
);

CREATE TABLE telefone_aluno (
	id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    rgm VARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (rgm) REFERENCES aluno(rgm)
);


select exemplar.isbn, numero_tombo from exemplar;
select isbn from exemplar
inner join livro on exemplar.isbn = livro.isbn;
