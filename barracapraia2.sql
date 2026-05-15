CREATE TABLE Funcionario(

    idFuncionario int PRIMARY KEY AUTO_INCREMENT,

    nomeFuncionario varchar(50) not null,

    cpf char(11) not NULL unique,

    celular char(11) not null

);
 
CREATE TABLE Cliente(

idCliente INT PRIMARY KEY AUTO_INCREMENT,

nomeCliente VARCHAR(50) NOT NULL,

cpf CHAR(11) NOT NULL unique

);

CREATE TABLE Equipamento(

idEquipamento INT PRIMARY KEY AUTO_INCREMENT,

nomeEquipamento VARCHAR(50) NOT NULL UNIQUE,  

qtd INT NOT NULL,

valorHora DECIMAL(10,2) NOT NULL

);

CREATE TABLE Aluguel (

idAluguel INT AUTO_INCREMENT PRIMARY KEY,

idCliente INT NOT NULL,

idFuncionario INT NOT NULL,

dataHoraRetirada DATETIME DEFAULT NOW(),

dataHoraDevolucao DATETIME,

valorApagar DECIMAL(10,2),

valorPago DECIMAL(10,2),

pago BIT,

formaPagamento VARCHAR(50),

qtVezes INT DEFAULT 1,

CONSTRAINT FK_Aluguel_Cliente 

FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),

CONSTRAINT FK_Aluguel_Funcionario 

FOREIGN KEY (idFuncionario) REFERENCES funcionario

(idFuncionario) 

);

CREATE TABLE AluguelEquipamento(

idAluguelEquipamento INT PRIMARY KEY AUTO_INCREMENT,

idEquipamento INT NOT NULL,

idAluguel INT NOT NULL,

valorItem DECIMAL(10,2) NOT NULL,

valorUnitario DECIMAL(10,2) NOT NULL,

qtd INT DEFAULT 1,

FOREIGN KEY (idEquipamento) 

REFERENCES equipamento(idEquipamento),

FOREIGN KEY (idAluguel) 

REFERENCES aluguel(idAluguel)

);
 
SELECT * FROM funcionario
 
/*1*/

alter table cliente add COLUMN 

email varchar(150) unique not NULL;

alter table cliente add COLUMN 

cidade varchar(50) not null;

alter table cliente add COLUMN 

estado char(2) not NULL;

/*2*/

INSERT INTO  cliente (nomeCliente, cpf, email, cidade, estado)

VALUES

('Donald','41578029874',

'donald@uol','Santos',

'SP'),

('Margarida','02589641587',

'margarida@uol','São Vicente',

'SP'),

('Patinhas','36985472103',

'patinhas@uol','Florianópolis',

'SC'),

('Huguinho','01245789630',

'huguinho@gmail','Santos',

'SP'),

('Luizinho','45781029874',

'luizinho@gmail','Praia Grande',

'SP'),

('Zezinho','02158639742',

'zezinho@gmail','São Vicente',

'SP'),

('Pardal','03697841520',

'pardal@uol','Santos',

'SP'),

('Zé Carioca','02151024780',

'zecarioca@uol','Rio de Janeiro',

'RJ'),

('Mickey','02360120965',

'mickey@hotmail','Recife',

'PE'),

('Minie','02102450690',

'minie@gmail','Recife',

'PE'),

('Pateta','021020542102',

'pateta@gmail','Santos',

'SP'),

('Branca de Neve','01245810201',

'brancadeneve@hotmail','São Joaquim',

'SC'),

('Aladin','01245789520',

'aladin@gmail','Belém',

'PA'),

('Cinderela','01254876201',

'cinderela@hotmail','Goiania',

'GO'),

('Mulan','01245782501',

'mulan@gmail','Rio das Ostras',

'RJ'),

('Moana','01021054207',

'moana@gmail','Parati',

'RJ'),

('Asnésio','01202236541',

'asnesio@uol','Belo Horizonte',

'MG'),

('Maga Patalógica','01245784102',

'maga@gmail','Cubatão',

'SP'),

('Capitão Boeing','01201548741',

'capitaoboeing@uol','Manaus',

'AM'),

('Pão Duro Mac Money','01245852012',

'paoduro@ig','Osasco',

'SP');

/*3*/

INSERT INTO Funcionario (nomeFuncionario, cpf, celular) VALUES 

('Cebolinha', '11122233344', '13991111111'),

('Cascão', '55566677788', '13992222222'),

('Chico Bento', '99900011122', '13993333333');

/*4*/

INSERT INTO equipamento 

(nomeEquipamento, qtd, ValorHora) VALUES 

('Cadeiras 02 posições', 50, 2.00),

('Cadeiras 04 posições', 100, 3.50),

('Guarda Sol P', 40, 2.00),

('Guarda Sol G', 60, 3.00),

('Mesinha', 30, 1.50);

/*5*/

insert into

    aluguel (

        idCliente,

        idFuncionario,

        dataHoraRetirada

    )

values (11, 1, '2024-12-08');

insert into

    aluguelEquipamento (

        idEquipamento,

        idAluguel,

        valorItem,

        valorUnitario,

        qtd

    )

values (1, LAST_INSERT_ID() , 2.00, 2.00, 1);

update equipamento set qtd = (qtd - 1) 

where idEquipamento = 1;

/*6*/

INSERT INTO aluguel 

(idCliente, idFuncionario, dataHoraRetirada) values

(9,3,'2024-12-10'); 

INSERT INTO aluguelequipamento 

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES (2,2,7.00,3.50,2);

INSERT INTO aluguelequipamento 

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES (4,2,3.0,3.0,1);

UPDATE equipamento SET qtd = qtd - 2 

WHERE idEquipamento = 2;

UPDATE equipamento SET qtd = qtd - 1 

WHERE idEquipamento = 4; 

/*7*/

/* aluguel 3*/

INSERT INTO aluguel 

(idCliente, idFuncionario, dataHoraRetirada)

VALUES (15,1,'2024-12-27'); 

INSERT INTO aluguelequipamento 

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES (3,3,2.00,2.00,1);

UPDATE equipamento SET qtd = qtd - 1 

WHERE idEquipamento = 3;

/* aluguel 4*/

INSERT INTO aluguel 

(idCliente, idFuncionario, dataHoraRetirada)

VALUES (14,1,'2024-12-27');

INSERT INTO aluguelequipamento 

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES (3,4,2.00,2.00,1);

UPDATE equipamento SET qtd = qtd - 1 

WHERE idEquipamento = 3;

/* aluguel 5*/

INSERT INTO aluguel 

(idCliente, idFuncionario, dataHoraRetirada)

VALUES (10,1,'2024-12-27');

INSERT INTO aluguelequipamento 

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES (3,5,2.00,2.00,1);

UPDATE equipamento SET qtd = qtd - 1 

WHERE idEquipamento = 3;

/*8*/
 


/*9*/

select nomeCliente, email from cliente 

order by nomeCliente;

/*10*/

SELECT nomeFuncionario, celular FROM funcionario

ORDER BY nomeFuncionario
 
INSERT INTO aluguel

(idCliente, idFuncionario, dataHoraRetirada)

-- Os valores dos aluguéis

UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 2.00,
    pago = 1,
    formaPagamento = 'Pix'
WHERE idAluguel = 1;


UPDATE aluguel
SET valorApagar = 10.00,
    valorPago = 10.00,
    pago = 1,
    formaPagamento = 'Cartao'
WHERE idAluguel = 2;


UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 0.00,
    pago = 0,
    formaPagamento = NULL
WHERE idAluguel = 3;


UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 2.00,
    pago = 1,
    formaPagamento = 'Dinheiro'
WHERE idAluguel = 4;


UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 2.00,
    pago = 1,
    formaPagamento = 'Pix'
WHERE idAluguel = 5;


UPDATE aluguel
SET valorApagar = 1.50,
    valorPago = 0.00,
    pago = 0,
    formaPagamento = NULL
WHERE idAluguel = 6;


UPDATE aluguel
SET valorApagar = 1.50,
    valorPago = 1.50,
    pago = 1,
    formaPagamento = 'Cartao'
WHERE idAluguel = 7; 
 
SELECT * FROM cliente

SELECT * FROM aluguel

SELECT * FROM funcionario

SELECT * FROM equipamento

SELECT * FROM aluguelequipamento
 
SELECT * FROM aluguel 9

SELECT * FROM funcionario

SELECT * FROM cliente 1 e 9

SELECT * FROM equipamento 5

INSERT INTO aluguel

(idCliente, idFuncionario,dataHoraRetirada)

VALUES(1, 3, '2026-04-27');


INSERT INTO aluguelequipamento

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES(5, 6, 1.50, 1.50, 1);

UPDATE equipamento SET qtd = qtd - 1

WHERE idEquipamento = 5;

INSERT INTO aluguel

(idCliente, idFuncionario,dataHoraRetirada)

VALUES(9, 3, '2026-04-27');

INSERT INTO aluguelequipamento

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES(5, 7, 1.50, 1.50, 1);

UPDATE equipamento SET qtd = qtd - 1

WHERE idEquipamento = 5;

-- EX 2

INSERT INTO aluguel

(idCliente, idFuncionario,dataHoraRetirada)

VALUES(7, 2, '2025-11-20');

INSERT INTO aluguelequipamento

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES(5, 8, 1.50, 1.50, 1);

UPDATE equipamento SET qtd = qtd - 1

WHERE idEquipamento = 5;

-- EX 3

INSERT INTO aluguel

(idCliente, idFuncionario,dataHoraRetirada)

VALUES(8, 2, '2025-12-29');

INSERT INTO aluguelequipamento

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES(3, 9, 2.0, 2.0, 1);

UPDATE equipamento SET qtd = qtd - 1

WHERE idEquipamento = 3;

INSERT INTO aluguelequipamento

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES(1, 9, 2.0, 2.0, 2);

UPDATE equipamento SET qtd = qtd - 2

WHERE idEquipamento = 1;

INSERT INTO aluguelequipamento

(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)

VALUES(5, 9, 1.50, 1.50, 1);

UPDATE equipamento SET qtd = qtd - 1

WHERE idEquipamento = 5;

-- EX 4

SELECT nomeCliente, email FROM Cliente

WHERE cidade = 'Santos'

ORDER BY nomeCliente ASC;

-- EX 5


SELECT * FROM cliente

WHERE estado in ('SP', 'RJ', 'ES', 'MG');
 
 
-- EX 6
 
SELECT * FROM cliente

WHERE idcliente >=5 AND idcliente <=10;
 
-- EX 7

SELECT * FROM equipamento

order by qtd DESC;
 
-- EX 8

SELECT * FROM aluguel

order by dataHoraRetirada DESC;
 
-- EX 9

UPDATE equipamento 

SET valorHora = valorHora * 0.90

WHERE idEquipamento = '1'
 
UPDATE equipamento 

SET valorHora = valorHora * 0.90

WHERE idEquipamento = '2'
 
-- EX 10

SELECT distinct cidade FROM cliente
SELECT * FROM aluguel

   /*Atividade Geral - SQL */ 
   

-- 1 Listar todos os clientes cadastrados
SELECT * FROM cliente;


-- 2 Exibir nome dos clientes e data de retirada dos aluguéis

SELECT cliente.nomeCliente,
aluguel.dataHoraRetirada
FROM cliente
JOIN aluguel
ON cliente.idCliente = aluguel.idCliente;


-- 3 Mostrar o nome dos equipamentos alugados e a quantidade alugada em cada aluguel

SELECT equipamento.nomeEquipamento,
aluguelequipamento.qtd
FROM equipamento
JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento;


-- 4 Listar o nome dos funcionários e a data em que realizaram os aluguéis

SELECT funcionario.nomeFuncionario,
aluguel.dataHoraRetirada
FROM funcionario
JOIN aluguel
ON funcionario.idFuncionario = aluguel.idFuncionario;
 
 
--  5 Listar a quantidade de clientes que existem no sistema.

SELECT COUNT(*) AS' qtdClientes'
FROM cliente;


-- 6 Contar quantos aluguéis cada cliente realizou

SELECT cliente.nomeCliente,
COUNT(aluguel.idAluguel) AS 'qtdAlugueis'
FROM cliente
JOIN aluguel
ON cliente.idCliente = aluguel.idCliente
GROUP BY cliente.nomeCliente;


-- 7 Mostrar o maior valor de aluguel registrado

SELECT MAX(valorApagar) AS 'maiorValorAluguel'
FROM aluguel;

SELECT *FROM aluguel 


-- 8 Mostrar o menor valor de aluguel registrado

SELECT MIN(valorApagar) AS 'menorValorAluguel'
FROM aluguel;

-- 9 Calcular o valor médio dos aluguéis realizados.

SELECT AVG (valorApagar) AS 'mediaValorAluguel' 
FROM aluguel;

-- 10 Calcular o total arrecadado com aluguéis até o dia de hoje.
 
SELECT SUM(valorPago) AS 'totalArrecadado em R$'
FROM aluguel
WHERE pago = 1;

-- 11 Listar o nome dos equipamentos com quantidade em estoque maior que 40

SELECT nomeEquipamento, qtd
FROM equipamento
WHERE qtd > 40;

-- 12 Mostrar a data do aluguel e o valor gasto, apenas dos aluguéis pagos via cartão

SELECT dataHoraRetirada,
valorPago
FROM aluguel
WHERE formaPagamento = 'Cartao'; 

SELECT *FROM aluguel

-- 13 Exibir o nome dos clientes e quantos aluguéis realizaram mas apenas dos que realizaram mais de 2 aluguéis

SELECT cliente.nomeCliente,
COUNT(aluguel.idAluguel) AS 'qtdAlugueis'
FROM cliente
JOIN aluguel
ON cliente.idCliente = aluguel.idCliente
GROUP BY cliente.nomeCliente
HAVING COUNT(aluguel.idAluguel) > 1; -- Usei UM(1) PORUQE A QTD DOS ALGUEIS DOS CLIENTES ERAM TODOS UM...

SELECT *FROM aluguel

--  14 Listar a quantidade total do valor arrecadado nos aluguéis por tipo de equipamento.

SELECT equipamento.nomeEquipamento,
SUM(aluguelequipamento.valorItem) AS 'totalArrecadado'
FROM equipamento
JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento
GROUP BY equipamento.nomeEquipamento;


-- 15. Mostrar o valor total movimentado por cliente

SELECT cliente.nomeCliente,
SUM(aluguel.valorPago) AS 'totalMovimentado'
FROM cliente
JOIN aluguel
ON cliente.idCliente = aluguel.idCliente
GROUP BY cliente.nomeCliente;


-- 16 Exibir os equipamentos com valor/hora acima da média

SELECT nomeEquipamento,
valorHora
FROM equipamento
WHERE valorHora >
(
SELECT AVG(valorHora)
FROM equipamento
);

-- 17 Mostrar o funcionário que realizou mais aluguéis

SELECT funcionario.nomeFuncionario,
COUNT(aluguel.idAluguel) AS 'qtdAlugueis'
FROM funcionario
JOIN aluguel
ON funcionario.idFuncionario = aluguel.idFuncionario
GROUP BY funcionario.nomeFuncionario
ORDER BY qtdAlugueis DESC
LIMIT 1;


-- 18 Exibir a data dos aluguéi scujo valor total seja maior que R$ 100,00

SELECT dataHoraRetirada,
SUM(valorApagar) AS 'totalAluguel'
FROM aluguel
GROUP BY dataHoraRetirada
HAVING SUM(valorApagar) > 100.00;
 
-- 19  Mostrar o total de valor pago por forma de pagamento.

SELECT formaPagamento,
SUM(valorPago) AS 'totalPago'
FROM aluguel
WHERE pago = 1
GROUP BY formaPagamento;

-- 20  Exibir o nome dos equipamentos alugados mais de 3 vezes. 

SELECT equipamento.nomeEquipamento,
COUNT(aluguelequipamento.idEquipamento) AS qtdAlugada
FROM equipamento
JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento
GROUP BY equipamento.nomeEquipamento
HAVING COUNT(aluguelequipamento.idEquipamento) > 3;

SELECT * FROM aluguelequipamento

/* ATIVIDADE DE VIW E PROCEDURE*/

/* 01) Criar uma view que traga a data do alugel, o nome do funcionário que alugou e o cliente*/

CREATE VIEW vw_AluguelFuncionarioCliente AS
SELECT 
aluguel.dataHoraRetirada,
cliente.nomeCliente,
funcionario.nomeFuncionario
FROM aluguel

JOIN cliente
ON aluguel.idCliente = cliente.idCliente

JOIN funcionario
ON aluguel.idFuncionario = funcionario.idFuncionario;

SELECT * FROM vw_AluguelFuncionarioCliente; -- PRA VISUALAZAR




/* 02) Criar uma procedure que traga todos os aluguéis de determinado dia. 
Deve aparecer no aluguel a data do aluguel, o nome do cliente, o funcionário, e o equipamento alugado 
de acordo com uma data passada como parâmetro */



CREATE PROCEDURE ps_AluguelPorData
(
IN dataPesquisa DATE
)

SELECT 
aluguel.dataHoraRetirada,
cliente.nomeCliente,
funcionario.nomeFuncionario,
equipamento.nomeEquipamento

FROM aluguel

JOIN cliente
ON aluguel.idCliente = cliente.idCliente

JOIN funcionario
ON aluguel.idFuncionario = funcionario.idFuncionario

JOIN aluguelequipamento
ON aluguel.idAluguel = aluguelequipamento.idAluguel

JOIN equipamento
ON aluguelequipamento.idEquipamento = equipamento.idEquipamento

WHERE DATE(aluguel.dataHoraRetirada) = dataPesquisa;


/* USANDO A PROCEDURE QUE FOI CRIADA */

CALL ps_AluguelPorData('2024-12-27');


/* 03) Criar uma procedure ou view para trazer a quantidade de aluguéis 
realizadas separadas por forma de pagamento. É melhor usar procedure ou view? Justifique.
Ex.:
PIX       67
CRÉDITO  177
*/

/*JUSTIFATIVA; PORUE VAMOS UTILIZAR PQ VAMOS CONSULTAR DADOS E NAO PREICA DOS PARAMENTROS, TBM DARIA PA USAR PROCEDURE*/

CREATE VIEW vw_QtdAluguelFormaPagamento AS

SELECT 
formaPagamento,
COUNT(idAluguel) AS 'qtdAlugueis'

FROM aluguel
WHERE formaPagamento IS NOT NULL
GROUP BY formaPagamento;


/* VISUALIZANDO A VIEW */  

SELECT * FROM vw_qtdaluguelformapagamento; 



/* 04) Criar uma procedure que permita reajustar em X percentual
toda a tabela de equipamentos. */


CREATE PROCEDURE ps_ReajusteEquipamento
(
IN percentual DECIMAL(5,2)
)

UPDATE equipamento
SET valorHora = valorHora + (valorHora * percentual / 100);


/* USANDO A PROCEDURE */

/* VAI AUMENTAR 10%% */
CALL ps_ReajusteEquipamento(10);

/* VAI DAR DESCONTO DE 5% */
CALL ps_ReajusteEquipamento(-5);


/* VISUALIZAR  */

SELECT * FROM equipamento;


/* 05) Criar uma procedure ou view para trazer a quantidade de aluguéis 
realizadas de acordo com a forma de pagamento informada. 
É melhor usar procedure ou view? Justifique.
*/

/* JUSTIFCATIVA: É MELHOR PROCEDUREPQ PRECISA RECEBER UM PARAMETRO*/

CREATE PROCEDURE ps_QtdAluguelFormaPagamento
(
IN formaPgto VARCHAR(50)
)

SELECT 
formaPagamento,
COUNT(idAluguel) AS 'qtdAlugueis'

FROM aluguel
WHERE formaPagamento = formaPgto
GROUP BY formaPagamento;


/* USANDO A PROCEDURE */

CALL ps_QtdAluguelFormaPagamento('Pix');

CALL ps_QtdAluguelFormaPagamento('Cartao');

CALL ps_QtdAluguelFormaPagamento('Dinheiro');



DELIMITER $$

CREATE PROCEDURE ps_CriarAluguel
(
IN p_idCliente INT,
IN p_idFuncionario INT,
IN p_idEquipamento INT,
IN p_qtd INT,
IN p_formaPagamento VARCHAR(50)
)

BEGIN

DECLARE v_valorUnitario DECIMAL(10,2);
DECLARE v_valorTotal DECIMAL(10,2);
DECLARE v_idAluguel INT;

    
/* BUSCA O VALOR DO EQUIPAMENTO */
    
SELECT valorHora
INTO v_valorUnitario
FROM equipamento
WHERE idEquipamento = p_idEquipamento;

    
/* CALCULA O VALOR TOTAL */
    
SET v_valorTotal = v_valorUnitario * p_qtd;

    
/* CRIA O ALUGUEL */
    
INSERT INTO aluguel
(
idCliente,
idFuncionario,
dataHoraRetirada,
valorApagar,
valorPago,
pago,
formaPagamento
)
    
VALUES
(
p_idCliente,
p_idFuncionario,
NOW(),
v_valorTotal,
 v_valorTotal,
1,
p_formaPagamento
);

    
/* PEGA O IDD DO ALUGUEL */
    
SET v_idAluguel = LAST_INSERT_ID();

    
/* INSERE QUAL VAI SER O EQUIPAMENTO */
    
INSERT INTO aluguelequipamento
(
idEquipamento,
idAluguel,
valorItem,
valorUnitario,
qtd
)
    
VALUES
(
p_idEquipamento,
v_idAluguel,
v_valorTotal,
v_valorUnitario,
p_qtd
);

    
/* ATUALIZAA O ESTOQUE */
    
UPDATE equipamento
SET qtd = qtd - p_qtd
WHERE idEquipamento = p_idEquipamento;

END $$

DELIMITER ; -- DELIMITER SERVE PARA FALAR PRO SQL Q TERMNOU A PROCEUDRE $$


/*TESTAR*/
SELECT * FROM aluguel
ORDER BY idAluguel DESC;


CALL ps_CriarAluguel(6, 2, 3, 2, 'Pix');

CALL ps_CriarAluguel(1, 3, 3, 2, 'Dinheiro');

CALL ps_CriarAluguel(5, 2, 4, 3, 'Cartao');

CALL ps_CriarAluguel(7, 3, 2, 2, 'Dinheiro');

/* Transection */

START TRANSACTION 

INSERT INTO aluguel 

(idCliente,idFuncionario,dataHoraRetirada,valorApagar,valorPago,pago,

formaPagamento)

VALUES

(1,1,NOW(),10,0,0,null);
 
INSERT INTO aluguelequipamento(

idEquipamento,idAluguel,valorItem,valorUnitario,qtd)

VALUES

(1,LAST_INSERT_ID(),10,10,1);
 
UPDATE equipamento

SET qtd = qtd - 1

WHERE idEquipamento = 1;

COMMIT 

ROLLBACK 

SELECT * FROM aluguel
SELECT * FROM equipamento
SELECT * FROM aluguelequipamento
 

/* Transection */

INSERT INTO aluguel
(idCliente,idFuncionario,dataHoraRetirada,valorApagar,valorPago,pago,
formaPagamento)
VALUES (1,1,NOW(),10,0,0,null);
 
INSERT INTO aluguelequipamento(
idEquipamento,idAluguel,valorItem,valorUnitario,qtd)
VALUES
(1,LAST_INSERT_ID(),10,10,1);
 
UPDATE equipamento
SET qtd = qtd - 1
WHERE idEquipamento = 1;
 
COMMIT 
ROLLBACK 