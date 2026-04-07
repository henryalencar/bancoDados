CREATE TABLE paciente(
idPaciente INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(100) NOT NULL, 
email VARCHAR(100) NOT NULL,
celular CHAR(11) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cep CHAR(8) NOT NULL,
tipolog VARCHAR(50) NOT NULL,
logadouro VARCHAR(100) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10),
cidade VARCHAR(100) NOT NULL,
uf CHAR(2) NOT NULL,
dataNascimento DATETIME NOT NULL,
CONSTRAINT ch_uf CHECK (uf IN ('AC', 'AL', 'AP', 'AM', 'BA',
 'CE', 'DF', 'ES', 'GO', 'MA',
 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 
 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))

);

CREATE TABLE especialidade (
idEspecialidade INT PRIMARY KEY AUTO_INCREMENT, 
NomeEspecialidade VARCHAR(100) NOT NULL

);

CREATE TABLE medico (
idMedico INT AUTO_INCREMENT, 
idEspecialidade INT NOT NULL, 
nome VARCHAR(100) NOT NULL,
crm VARCHAR(6) NOT NULL UNIQUE, 
CONSTRAINT pk_medico PRIMARY KEY (idMedico),
CONSTRAINT fk_medicoEspecialidade FOREIGN KEY (idEspecialidade)
REFERENCES especialidade(idEspecialidade)

);

CREATE TABLE ContatoMedico (
idContatoMedico INT PRIMARY KEY AUTO_INCREMENT,
idMedico INT NOT NULL,
tipoContato VARCHAR(50) NOT NULL,
contato VARCHAR(100) NOT NULL,
#CONSTRAINT ch_tipoContato CHECK (tipoContato IN 'email','cel', 'tel'),
#CONSTRAINT fk_contatoMedicoMedico FOREING KEY (idMedico) REFERENCES medico (idMedico)

FOREIGN KEY (idMedico) REFERENCES Medico(idMedico)
);


CREATE TABLE consulta (
  idConsulta INT PRIMARY KEY AUTO_INCREMENT,
  idPaciente INT NOT NULL,
  idMedico INT NOT NULL,
  idRecepecionista INT NOT NULL, 
  tipoConsulta VARCHAR(150),
  valor DECIMAL(10,2),
  dataHoraConsulta DATETIME,
  Obeservacao VARCHAR(255),
  prescricao VARCHAR(255),
  temPlano BIT NOT NULL
);

CREATE TABLE Recepcionista (
idRecepcionista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
telefone VARCHAR(20),
celular VARCHAR(20) NOT NULL,
cep CHAR(8) NOT NULL,
logradouro VARCHAR(100) NOT NULL,
numero VARCHAR(10) NOT NULL,
complemento VARCHAR(50),
cidade VARCHAR(50) NOT NULL,
uf CHAR(2) NOT NULL,
senha VARCHAR(255) NOT NULL,
CONSTRAINT ch_uf CHECK (uf IN ('AC', 'AL', 'AP', 'AM', 'BA',
 'CE', 'DF', 'ES', 'GO', 'MA',
 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 
 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))

);

);

CREATE TABLE FormaPagamento (
idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
nomeFormaPagamento VARCHAR(100) NOT NULL

);

CREATE TABLE ConsultaFormaPagamento (
idConsultaFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
idFormaPagamento INT NOT NULL,
valor DECIMAL(10,2) NOT NULL,
ativo BIT NOT NULL DEFAULT 1,

FOREIGN KEY (idConsulta) REFERENCES Consulta(idConsulta), #chamando outra tabela (REFERENCIA)
FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento(idFormaPagamento)

);

CREATE TABLE planoSaude(
idPlanoSaude INT PRIMARY KEY AUTO_INCREMENT,
nomePlanoSaude VARCHAR(100) NOT NULL

);

CREATE TABLE categoriaPlano(
idCategoriaPlano INT PRIMARY KEY AUTO_INCREMENT,
idPlanoSaude INT NOT NULL,
nomeCategoriaPlano VARCHAR(100) NOT NULL,

FOREIGN KEY (idPlanoSaude) REFERENCES PlanoSaude(idPlanoSaude) #chamando outra tabela (REFERENCIA)

);

CREATE TABLE ConsultaPlano (
idConsultaPlano INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
idPlanoSaude INT NOT NULL,

FOREIGN KEY (idConsulta) REFERENCES Consulta(idConsulta), #chamando outra tabela (REFERENCIA)
FOREIGN KEY (idPlanoSaude) REFERENCES PlanoSaude(idPlanoSaude)

);

CREATE TABLE exame (
idExame INT PRIMARY KEY AUTO_INCREMENT, 
idConsulta INT NOT NULL,
tipoExame VARCHAR(100) NOT NULL,
valor DECIMAL(10,2) NOT NULL,
dataResultado DATETIME,
resultado VARCHAR(255),
dataValidade DATETIME,
responsavelRetirada VARCHAR(100),

FOREIGN KEY (idConsulta) REFERENCES Consulta(idConsulta) #chamando outra tabela (REFERENCIA)

);

CREATE TABLE ExameFormaPagamento ( 
idExameFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
idExame INT NOT NULL,
idFormaPagamento INT NOT NULL,
valor DECIMAL(10,2) NOT NULL,
ativo BIT NOT NULL DEFAULT 1, #

FOREIGN KEY (idExame) REFERENCES Exame(idExame), #chamando outra tabela (REFERENCIA)
FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento(idFormaPagamento)

);
 SHOW TABLES 







