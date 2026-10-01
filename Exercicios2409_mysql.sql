CREATE DATABASE ads_46580069 ;
USE ads_46580069;

CREATE TABLE cliente (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nome   VARCHAR(120) NOT NULL,
    cidade VARCHAR(60),
    email  VARCHAR(120)
);

CREATE TABLE vendedor (
    id    INT AUTO_INCREMENT PRIMARY KEY,
    nome  VARCHAR(120) NOT NULL,
    setor VARCHAR(40)
);

CREATE TABLE vendas (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    produto	VARCHAR(80) NOT NULL,
    quantidade	INT,
    valor	DECIMAL(10, 2),
    data_venda	DATE,
    id_cliente	INT,
    id_vendedor	INT,
    FOREIGN KEY	(id_cliente)	REFERENCES cliente (id),
    FOREIGN KEY	(id_vendedor)	REFERENCES vendedor (id)
);

INSERT INTO cliente (nome, cidade, email) VALUES
    ('Marina Costa',   'Itu',        'marina.costa@email.com'),
    ('Rafael Moreira', 'Salto',      'rafael.moreira@email.com'),
    ('Juliana Barros', 'Sorocaba',   'juliana.barros@email.com'),
    ('Tiago Fontes',   'Indaiatuba', 'tiago.fontes@email.com'),
    ('Patricia Alves', 'Itu',        'patricia.alves@email.com');
    
INSERT INTO vendas (produto, quantidade, valor, data_venda, id_cliente, id_vendedor) VALUES
    ('Notebook',   1, 3200.00, '2026-03-02', 1, 1),
    ('Mouse',      2,   89.90, '2026-03-05', 2, 1),
    ('Monitor',    1,  980.00, '2026-03-11', 3, 2),
    ('Teclado',    3,  175.50, '2026-03-18', 4, 3),
    ('Impressora', 1, 1240.00, '2026-04-02', 5, 2);

INSERT INTO vendedor (nome, setor) VALUES
    ('Carlos Menezes', 'Balcao'),
    ('Beatriz Ramos',  'Externo'),
    ('Diego Sampaio',  'Balcao'),
    ('Leticia Duarte', 'Online'),
    ('Marcos Vieira',  'Externo');



select 1 from cliente where id = 2;

select * from vendedor;

select * from vendas;

delete from vendedor where coluna = numero_desejado;

SELECT 
	vendas.produto,
    cliente.nome AS nome_cliente,
    vendedor.nome AS nome_vendedor
FROM vendas

JOIN cliente ON vendas.id_cliente = cliente.id
JOIN vendedor ON vendas.id_vendedor = vendedor.id;

delete from vendas where id_vendedor = 1;
delete from vendedor where id = 11;

select * from vendedor;

INSERT INTO vendedor (nome, setor) VALUES
    ('Carlos Menezes', 'Balcao'),
    ('Diego Sampaio',  'Balcao');
    
INSERT INTO vendas (produto, quantidade, valor, data_venda, id_cliente, id_vendedor) VALUES
	('Notebook',   1, 3200.00, '2026-03-02', 1, 12),
	('Mouse',      2,   89.90, '2026-03-05', 2, 12);
    
SELECT 
	vendas.produto,
    cliente.nome AS nome_cliente,
    vendedor.nome AS nome_vendedor
FROM vendas

JOIN cliente ON vendas.id_cliente = cliente.id
JOIN vendedor ON vendas.id_vendedor = vendedor.id;
    
select * from vendedor;
