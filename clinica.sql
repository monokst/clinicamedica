 
CREATE DATABASE Clínica_Médica;
USE Clínica_Médica;
 
 CREATE TABLE consultorio (
	idC INT PRIMARY KEY AUTO_INCREMENT,
    sala INT NOT NULL,
    endereco TEXT
);
 
CREATE TABLE paciente (
	cpfP INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    nascimento DATE NOT NULL,
    endereco TEXT,
    idCP INT,
    FOREIGN KEY (idCP) REFERENCES consultorio(idC)
);
 
CREATE TABLE doutor (
	crm INT PRIMARY KEY,
    cpfD CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(45) NOT NULL,
    nascimento DATE NOT NULL  
);
 
 
CREATE TABLE receita_medica (
	idRC INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    medicamento VARCHAR(45),
    idPRC INT,
    FOREIGN KEY (idPRC) REFERENCES paciente(cpfP)
);
 
CREATE TABLE especializacao (
	idE INT PRIMARY KEY,
    nome VARCHAR(45)
);

CREATE TABLE cons_dou (
	idC INT,
    idD INT,
    PRIMARY KEY (idC,idD),
	CONSTRAINT fk_cons_dou_consultorio FOREIGN KEY (idC) REFERENCES consultorio(idC),
    CONSTRAINT fk_cons_dou_doutor FOREIGN KEY (idD) REFERENCES doutor(crm)
);

CREATE TABLE rece_dou (
	idRC INT,
    idD INT,
    PRIMARY KEY (idRC,idD),
	CONSTRAINT fk_rece_dou_receita FOREIGN KEY (idRC) REFERENCES receita_medica(idRC),
    CONSTRAINT fk_rece_dou_doutor FOREIGN KEY (idD) REFERENCES doutor(crm)
);

CREATE TABLE pasc_dou (
	idP INT,
    idD INT,
    PRIMARY KEY(idP,idD),
    CONSTRAINT fk_pasc_dou_paciente FOREIGN KEY (idP) REFERENCES paciente(cpfP),
    CONSTRAINT fk_pasc_dou_doutor FOREIGN KEY (idD) REFERENCES doutor(crm)
);

CREATE TABLE dou_espe (
	idD INT,
    idE INT,
    PRIMARY KEY (idD,idE),
    CONSTRAINT fk_dou_espe_doutor FOREIGN KEY (idD) REFERENCES doutor(crm),
    CONSTRAINT fk_dou_espe_especializacao FOREIGN KEY (idE) REFERENCES especializacao(idE)
);

-- VERIFICAR CARDINALIDADE  PACIENTE E RECEITA
-- VERIFICAR CARDINALIDADE PACIENTE DOUTOR
-- VERIFICAR CARDINALIDADE DOUTOR ESPECIALIZAÇAO







 