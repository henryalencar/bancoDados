CREATE TABLE Aluguel (
idAluguel INT AUTO_INCREMENT PRIMARY KEY,
idCliente INT,
idFuncionario INT,
dataHoraRetirada DATETIME,
dataHoraDevolucao DATETIME,
valorAPagar DECIMAL(10,2),
valorPago DECIMAL(10,2),
pago BIT,
formaPagamento VARCHAR(45),
qtdVezes INT,

FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)

);

CREATE TABLE AluguelEquipamento (
idAluguelEquipamento INT AUTO_INCREMENT PRIMARY KEY,
idEquipamento INT,
idAluguel INT,
valorItem DECIMAL(10,2),
valorUnitario DECIMAL(10,2),
qtd INT,

FOREIGN KEY (idEquipamento) REFERENCES Equipamento(idEquipamento),
FOREIGN KEY (idAluguel) REFERENCES Aluguel(idAluguel)

);

CREATE TABLE Equipamento (
idEquipamento INT AUTO_INCREMENT PRIMARY KEY,
nomeEquipamento VARCHAR(50),
qtd INT, 
valorHora DECIMAL(10,2)
);

CREATE TABLE Funcionario (
idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
nomeFuncionario VARCHAR(50),
cpf CHAR(11),
celular VARCHAR(20)

);

CREATE TABLE Cliente (
idCliente INT AUTO_INCREMENT PRIMARY KEY,
nomeCliente VARCHAR(50),
cpf CHAR(11)

);