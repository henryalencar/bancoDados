CREATE TABLE Aluno(
idAluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL, 
email VARCHAR (100) NOT NULL,
senha VARCHAR (50) NOT null 
);
SELECT * FROM aluno
INSERT INTO aluno (nome, email, senha)
VALUES ('Henry', 'henry@gmail.com', 'abcdefgh123')

CREATE TABLE Produtos (
idProdutos INT PRIMARY KEY AUTO_INCREMENT,
nomeProduto VARCHAR(100) NOT NULL,
qtd INT NOT NULL,
valor DECIMAL(10,2) NOT NULL
);

INSERT INTO Produtos (nomeProduto, qtd, valor)
VALUES ('coxinha', 100, 10.00), 
('maravilha', 100, 8.00),  
('kibe', 100, 10.00),
('queijo', 100, 9.00),
('empada', 100, 7.00),

('coca', 100, 6.00),
('fanta', 100, 6.00),
('suco Laranja', 100, 8.00), 
('água', 100, 6.00), 
('monster', 100, 15.00),
('baly', 100, 6.00),

('bolos', 100, 9.00),
('chup-chup', 100, 6.00),
('chocolate', 100, 6.00),
('pao de mel ', 100, 7.00),
('doce de leite', 100, 6.00);

SELECT * FROM produtos;
  

create table FormaPagamento(
idFormaPagamento int primary key AUTO_INCREMENT,
tipoPagamento VARCHAR(100) NOT null
);
SELECT * FROM formapagamento
INSERT INTO formapagamento(tipoPagamento) 
VALUES ('Dinheiro'), ('Débito'), ('Crédito'), ('Pix');

CREATE TABLE Pedido (
idPedido INT PRIMARY KEY AUTO_INCREMENT,

idAluno INT NOT NULL,
CONSTRAINT fk_Aluno FOREIGN KEY (idAluno) References aluno(idAluno),

idFormaPagamento INT NOT NULL,
CONSTRAINT fk_FormaPagamento FOREIGN KEY (idFormaPagamento) REFERENCES formapagamento(idFormaPagamento),

dataHoraRetirada DATETIME NOT NULL,
valorTotal DECIMAL(10,2) NOT NULL,
qtd INT NOT NULL
 
);

INSERT INTO pedido(idAluno, idFormaPagamento, dataHoraRetirada, valorTotal)
VALUES(1, 2, 2026-04-23, 8.00);
 SELECT * FROM pedido

CREATE TABLE ProdutoPedido(
idProdutoPedido int PRIMARY KEY AUTO_INCREMENT,

idProdutos INT NOT NULL,
CONSTRAINT fk_Produtos FOREIGN KEY (idProdutos) REFERENCES Produtos(idProdutos),

idPedido INT NOT NULL,
CONSTRAINT fk_Pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
qtd INT NOT null
);

INSERT INTO produtopedido(idProdutos,idPedido, qtd)
VALUES (2, 2, 1),
UPDATE produtos SET qtd = qtd - 1
WHERE idProdutos = 2;


