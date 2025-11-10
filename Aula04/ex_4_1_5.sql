CREATE TABLE Instituicao (
	
	Nome VARCHAR(100) Not Null,
	Endereco VARCHAR(100) Not Null,

	PRIMARY KEY (Nome),

);

CREATE TABLE Autor (
	
	Nome VARCHAR(100) Not Null,
	Email VARCHAR(100) Not Null,
	Nome_Instituicao VARCHAR(100) Not Null,

	PRIMARY KEY (Nome),
	FOREIGN KEY (Nome_Instituicao) REFERENCES Instituicao(Nome),


);


CREATE TABLE Artigo ( 
	
	Numero_Registo INT Not Null,
	Titulo VARCHAR(100) Not Null,
	Nome_Autor VARCHAR(100) Not Null,

	PRIMARY KEY (Numero_Registo),
	FOREIGN KEY (Nome_Autor) REFERENCES Autor(Nome),


);

CREATE TABLE Participante ( 
	
	Nome VARCHAR(100) Not Null,
	Email VARCHAR(100) Not Null,
	Data_Inscricao VARCHAR(100) Not Null,
	Morada VARCHAR(100) Not Null,
	Nome_Instituicao VARCHAR(100) Not Null,

	PRIMARY KEY (Nome),
	FOREIGN KEY (Nome_Instituicao) REFERENCES Instituicao(Nome),

);

CREATE TABLE Nao_Estudante (

	Nome VARCHAR(100) Not Null,
	Referencia VARCHAR(100) Not Null,
	Nome_Instituicao VARCHAR(100) Not Null,
	
	PRIMARY KEY(Nome),
	FOREIGN KEY(Nome_Instituicao) REFERENCES Instituicao(Nome),

);

CREATE TABLE Estudante (
	
	Nome VARCHAR(100) Not Null,
	Nome_Instituicao VARCHAR(100) Not Null,

	PRIMARY KEY(Nome),
	FOREIGN KEY(Nome_Instituicao) REFERENCES Instituicao(Nome),


);



