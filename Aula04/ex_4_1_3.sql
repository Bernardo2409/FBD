CREATE TABLE Tipo_Fornecedor (
	
	Codigo VARCHAR(100) Not Null,
	Designacao VARCHAR(100) Not Null,

	PRIMARY KEY(Codigo),
);

CREATE TABLE Fornecedor ( 

	NIF INT Not Null,
	Nome VARCHAR(100) Not Null,
	Condicoes_Pagamento VARCHAR(100) Not Null,
	Endereco VARCHAR(100) Not Null,
	Fax VARCHAR(100) Not Null,
	Codigo_Tipo_Fornecedor VARCHAR(100) Not Null,

	PRIMARY KEY(NIF),
	FOREIGN KEY(Codigo_Tipo_Fornecedor) REFERENCES Tipo_Fornecedor(Codigo),

);

CREATE TABLE Encomenda (
	
	Numero INT Not Null,
	[Data] VARCHAR(100) Not Null,
	NIF_Fornecedor INT Not Null,

	PRIMARY KEY(Numero),
	FOREIGN KEY(NIF_Fornecedor) REFERENCES Fornecedor(NIF),
);

CREATE TABLE Produto (
	Codigo INT Not Null,
	Nome VARCHAR(100) Not Null,
	Preco INT Not Null,
	Taxa_Iva INT Not Null,
	Stock INT Not Null,
	Numero_Encomenda INT Not Null,

	PRIMARY KEY(Codigo),
	FOREIGN KEY(Numero_Encomenda) REFERENCES Encomenda(Numero),

);


