CREATE TABLE paciente (
 
    idPaciente INT PRIMARY KEY AUTO_INCREMENT,
 
    nome VARCHAR(100) NOT NULL,
 
    email VARCHAR(100) NOT NULL,
 
    celular CHAR(11) NOT NULL,
 
    cpf CHAR(11) NOT NULL UNIQUE,
 
    cep CHAR(8) NOT NULL,
 
    tipoLog VARCHAR(50) NOT NULL,
 
    logradouro VARCHAR(100) NOT NULL,
 
    numero VARCHAR(6) NOT NULL,
 
    complemento VARCHAR(10),
 
    cidade VARCHAR(100) NOT NULL,
 
    uf CHAR(2) NOT NULL,
 
    dataNascimento DATETIME NOT NULL,  
 
    CONSTRAINT ch_uf_paciente CHECK (uf IN ('AC', 'AL', 'AP', 'AM', 'BA',
 
	'CE',	'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR',
 
	'PE', 'PI',	'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))
 
);
CREATE TABLE especialidade (
 
    idEspecialidade INT PRIMARY KEY AUTO_INCREMENT,
 
    nomeEspecialidade VARCHAR(100) NOT NULL
 
);
CREATE TABLE planoSaude (
 
    idPlanoSaude INT PRIMARY KEY AUTO_INCREMENT,
 
    nomePlanoSaude VARCHAR(100) NOT NULL
 
);
CREATE TABLE formaPagamento (
 
    idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
 
    nomeFormaPagamento VARCHAR(100) NOT NULL
 
);
CREATE TABLE Recepcionista (
 
    idRecepcionista INT PRIMARY KEY AUTO_INCREMENT,
 
    nome VARCHAR(100) NOT NULL,
 
    telefone VARCHAR(20),
 
    celular VARCHAR(20) NOT NULL,
 
    cep CHAR(8) NOT NULL,
 
    tipoLog VARCHAR(50) NOT NULL,
 
    logradouro VARCHAR(100) NOT NULL,
 
    numero VARCHAR(10) NOT NULL,
 
    complemento VARCHAR(50),
 
    cidade VARCHAR(50) NOT NULL,
 
    uf CHAR(2) NOT NULL,
 
    login VARCHAR(100) DEFAULT 'user',
 
    senha VARCHAR(255) DEFAULT '123',
 
    CONSTRAINT ch_uf_recep CHECK (uf IN ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))
 
);
CREATE TABLE medico (
 
    idMedico INT AUTO_INCREMENT PRIMARY KEY,
 
    idEspecialidade INT NOT NULL,
 
    nome VARCHAR(100) NOT NULL,
 
    crm VARCHAR(15) NOT NULL UNIQUE,
 
    CONSTRAINT fk_medicoEspecialidade FOREIGN KEY (idEspecialidade) REFERENCES especialidade(idEspecialidade)
 
);
CREATE TABLE contatoMedico (
 
    idContatoMedico INT PRIMARY KEY AUTO_INCREMENT,
 
    idMedico INT NOT NULL,
 
    tipoContato VARCHAR(50),
 
    contato VARCHAR(100),
 
    CONSTRAINT ch_tipoContato CHECK (tipoContato IN ('e-mail','cel','tel')),
 
    CONSTRAINT fk_contatoMedicoMedico FOREIGN KEY (idMedico) REFERENCES medico(idMedico)
 
);
CREATE TABLE consulta (
 
    idconsulta INT PRIMARY KEY AUTO_INCREMENT,
 
    idmedico INT NOT NULL,
 
    idrecepcionista INT NOT NULL,
 
    idpaciente INT NOT NULL,
 
    dataHoraConsulta DATETIME NOT NULL,
 
    observacao VARCHAR(255) DEFAULT NULL,
 
    prescricao VARCHAR(255) DEFAULT NULL,
 
    tipoConsulta VARCHAR(100) NOT NULL,
 
    temPlano TINYINT DEFAULT 1,
 
    valor DECIMAL(10,2),
 
    CONSTRAINT fk_consultaRecepcionista FOREIGN KEY (idRecepcionista) REFERENCES Recepcionista(idRecepcionista),
 
    CONSTRAINT fk_consultaPaciente FOREIGN KEY (idPaciente) REFERENCES paciente(idPaciente),
 
    CONSTRAINT fk_consultaMedico FOREIGN KEY (idMedico) REFERENCES medico(idMedico)
 
);
CREATE TABLE exame (
 
    idExame INT PRIMARY KEY AUTO_INCREMENT,
 
    idConsulta INT NOT NULL,
 
    tipoExame VARCHAR(100) NOT NULL,
 
    valor DECIMAL (10,2),
 
    dataHoraExame DATETIME NOT NULL,
 
    resultado TEXT,
 
    dataResultado DATETIME,
 
    dataRetirada DATETIME,
 
    CONSTRAINT fk_exame_consulta FOREIGN KEY (idConsulta) REFERENCES consulta(idconsulta)
 
);
senaclinhenry2
INSERT INTO contatomedico
(idmedico, tipocontato, contato)
VALUES
(1,'e-mail','henryalencar@uol.com.br'),
(1,'cel','13999887766'),
(2,'cel','13999887722'),
(3,'cel','13999887733');
SELECT * FROM medico;
 
INSERT INTO planoSaude (nomePlanoSaude)
VALUES
('Unimed'),
('Amil'),
('Bradesco Saúde'),
('SulAmérica Saúde'),
('Hapvida');

INSERT INTO medico (nome, idEspecialidade, crm) VALUES
 
('Dr. Henry Alencar', 1, '123456-SP'),
 
('Dr. Guilherme Souza', 2, '234567-SP'),
 
('Dr. Arley Mendes', 3, '345678-SP');

INSERT INTO Recepcionista (nome, celular, cep, tipoLog, logradouro, numero, cidade, uf)
 
VALUES ('Mariana', '13988557714', '11010000', 'Avenida', 'Ana Costa', '408', 'Santos', 'SP');
 

INSERT INTO paciente 
(nome, email, celular, cpf, cep, tipoLog, logradouro, numero, cidade, uf, dataNascimento)
 
VALUES
('João Silva','joao@gmail.com','13999887711','12345678901','11030000','Rua','Afonso Pena','45','Santos','SP','1985-03-15'),
 
('Ana Souza','ana@yahoo.com','11988776655','98765432100','11045000','Avenida','Conselheiro Nébias','120','Santos','SP','1992-08-20'),
 
('Carlos Mendes','carlos@outlook.com','13997775544','45612378910','11060000','Rua','XV de Novembro','300','Praia Grande','SP','1978-11-02'),
 
('Fernanda Lima','fernanda@gmail.com','11996668877','74185296300','11070000','Travessa','Dom Pedro','78','Guarujá','SP','2000-05-28');
 
SELECT idPaciente, nome FROM paciente;
 
INSERT INTO consulta 
(idmedico, idrecepcionista, idpaciente, dataHoraConsulta, observacao, prescricao, tipoConsulta, temPlano, valor)
 
VALUES 
(1, 1, 1, '2024-06-15 14:30:00', 'Dores nas costas', 'Repouso por 5 dias', 'Retorno', 1, 450.00),
 
(2, 1, 8, '2024-06-16 09:00:00', 'Febre e dor de garganta', 'Antibiótico por 7 dias', 'Primeira Consulta', 1, 300.00),
 
(3, 1, 9, '2024-06-17 10:15:00', 'Dor de cabeça constante', 'Realizar exames laboratoriais', 'Retorno', 0, 250.00),
 
(1, 1, 10, '2024-06-18 14:00:00', 'Pressão arterial elevada', 'Controle alimentar e exercícios', 'Primeira Consulta', 1, 400.00),
 
(2, 1, 11, '2024-06-19 16:30:00', 'Alergia na pele', 'Uso de pomada dermatológica', 'Retorno', 0, 180.00);
INSERT INTO medico (nome, idEspecialidade, crm)
VALUES
('Dr. Otavio', 4, '123000-SP');
/*t1*/
 
SELECT nome, nomeEspecialidade FROM medico
 
JOIN especialidade
 
ON especialidade.idEspecialidade = medico.idEspecialidade
 
WHERE nome LIKE '____G%'
/*T2 - Listar o nome de todos os médidos, sua especialidade e
 
seus meios contatos.*/
 
SELECT medico.nome, especialidade.nomeEspecialidade, contatomedico.tipocontato, contatomedico.contato
 
FROM medico
 
INNER JOIN especialidade
 
ON especialidade.idEspecialidade = medico.idEspecialidade
 
INNER JOIN contatomedico
 
ON contatomedico.idMedico = medico.idMedico;
/*T3 - Listar a data da consulta, o paciente que será atendido,
 
e qual a especialidade do médico que irá atendê-lo, da consulta
 
mais longe para a mais próxima.
 
*/
 
SELECT DATE_FORMAT(c.dataHoraConsulta, '%d/%m/%Y') as 'Data Consulta', p.nome as 'Paciente', e.nomeEspecialidade as 'Especialidade'
 
FROM  consulta AS c
JOIN medico AS m ON c.idmedico = m.idMedico
JOIN especialidade AS e ON m.idEspecialidade = e.idEspecialidade
JOIN paciente AS p ON c.idpaciente = p.idPaciente
ORDER BY dataHoraConsulta DESC;
/*Inserir um Dr a mais na tabela medicos,
 
como clínico geral, o Dr. Otávio Meirelles.
 
Listar o nome de todos os médicos e a data de suas consultas,
 
mesmo médicos sem consultas (Dr Otávio tem que aparecer). Inserindo o Dr. Otávio Meirelles*/
INSERT INTO medico (nome, idEspecialidade, crm)
 
VALUES ('Dr. Otávio Meirelles', 4, '999888-SP');
-- Listando todos os médicos (incluindo os sem consulta)
 
SELECT medico.nome, consulta.dataHoraConsulta
 
FROM medico
 
LEFT JOIN consulta  ON medico.idMedico = consulta.idMedico;

/*t5 Listar o nome de todos os medicos, sua especialidade e
 
todos os seus contatos apenas quando forem telefone*/
 
SELECT m.nome, e.nomeEspecialidade, c.contato
 
FROM medico m
 
INNER JOIN especialidade e ON m.idEspecialidade = e.idEspecialidade
 
INNER JOIN contatoMedico c ON m.idMedico = c.idMedico
 
WHERE c.tipoContato = 'tel' OR c.tipoContato = 'cel';
 

SELECT * FROM medico;
 
SELECT * FROM especialidade;
 
SELECT * FROM paciente;
 
SELECT * FROM recepcionista;
 
SELECT * FROM planosaude;
 
SELECT * FROM consulta;
 
SELECT * FROM contatomedico;

/* FUNCOES */
 
/* VALORES DO MAIRO AO MENOR */

SELECT MAX(idMedico) AS 'consulta mais cara' FROM consulta;
 
SELECT MIN(valor) AS 'consulta mais barata'

FROM consulta;
 
/* SOMA */

SELECT SUM(valor) AS 'total arrecadado das consultas'

FROM consulta

WHERE tipoConsulta = 'Primeira Consulta';
 
 
/*MEDIA*/
 
SELECT AVG(valor) AS 'consultas de valor arrecadados'

FROM consulta

WHERE YEAR(dataHoraConsulta)=2024;
 
SELECT AVG(valor) AS 'media do valor arrecadados'

FROM consulta

WHERE MONTH(dataHoraConsulta)=6;
 
/*CONTAR*/
 
SELECT COUNT(*) AS 'qtd de pacientes'

FROM paciente;
 
SELECT COUNT(*) AS 'qtd de pacientes - SANTOS SP'

FROM paciente

WHERE cidade = 'Santos';
 
SELECT ROUND(133.8888) -- AREDONDAR
 
/*AGREGACOES*/ 

/*QUANTOS MEDIOCS TEM POR ESPECIALIDADE*/

SELECT nomeEspecialidade, COUNT(*) AS 'qtd de medicos'

FROM medico

JOIN especialidade

ON medico.idEspecialidade = especialidade.idEspecialidade

GROUP BY nomeEspecialidade;
 
/*QUANTO ARRECADEI NAS CONSULTAS E REOTRNO DA PRIMERA VEZ*/

SELECT tipoConsulta SUM, (valor) AS 'valor total R$' FROM consulta 

GROUP BY tipoConsulta;
 
/*QUANTAS CONSULTAS NO MES DO ANO*/
 
SELECT MONTH(dataHoraConsulta) AS 'mes referencia',

COUNT(*) AS 'qtd consultas'

FROM consulta

WHERE YEAR (dataHoraConsulta)=2024

GROUP BY MONTH(dataHoraConsulta);
 
/*RELATORIOS*/

/* USO DE VIEWS E STORED PROCEDURES*/
 
/* RELATORIO DE CONSULTA

   NOME PACIENTE CEL EMAIL / DATA COSNULTA / NOME MEDICO / ESPECIALIDADE */
 
/*CRIANDO A VIEW*/

CREATE VIEW vw_RelatorioAvisoPacientes AS   

SELECT 

paciente. nome AS 'Paciente' ,

paciente. celular,

paciente. email,

consulta. dataHoraConsulta,

medico. nome AS 'Medico',

especialidade. nomeEspecialidade

FROM consulta

JOIN paciente 

ON consulta.idpaciente = paciente.idPaciente

JOIN medico 

ON medico.idmedico = consulta.idmedico

JOIN especialidade

ON especialidade.idEspecialidade = medico.idEspecialidade
 
/* UTILIZANDO A VIEW CRIADA*/

SELECT* FROM vw_RelatorioAvisoPacientes
 
 
 