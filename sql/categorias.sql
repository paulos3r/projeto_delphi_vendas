CREATE TABLE categorias (
categoria_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
descricao varchar(30)
);

INSERT INTO categorias (descricao) values
	('Notbook'),
	('Tablet'),
	('Roteadores'),
	('Perifericos');