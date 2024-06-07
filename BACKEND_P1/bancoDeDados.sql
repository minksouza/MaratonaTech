CREATE DATABASE dbp1;
USE dbp1;

CREATE TABLE users(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	nome TEXT(200),
	email TEXT(100), 
	nomeusuario TEXT(20),
	senha TEXT(16)
); 

CREATE TABLE acesstoken(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	userId INT(11),
    tokenString TEXT(100),
    dataCriacao TIMESTAMP,
	FOREIGN KEY (userId) REFERENCES users(id)
);

CREATE TABLE genre(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	tituloGen TEXT(100)
);

CREATE TABLE movie(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	genreId INT, 
	tituloMov TEXT(100),
	sinopse TEXT(300),
	duracao INT(11),
	lancamento CHAR(10),
	posterURL TEXT(100),
	trailerURL TEXT(100),
	FOREIGN KEY (genreId) REFERENCES genre(id)
);

CREATE TABLE review(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	userId INT(11),
    movieId INT(11),
    conteudo TEXT(300),
    estrelas INT(11),
    dataCriacao TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (movieId) REFERENCES movie(id)
);

CREATE TABLE reviewevaluation(
	userId INT(11),
    reviewId INT(11),
	nota BIT(1),
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (reviewId) REFERENCES review(id)
);

CREATE TABLE artist(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	nome TEXT(200),
    aniversario CHAR(10),
    fotoURL TEXT(200),
    biografia TEXT(300)
);

CREATE TABLE role(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	titulo TEXT(100)
);

CREATE TABLE credit(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	movieId INT(11),
    artistId INT(11),
    roleId INT(11),
	FOREIGN KEY (movieId) REFERENCES movie(id),
    FOREIGN KEY (artistId) REFERENCES artist(id),
	FOREIGN KEY (roleId) REFERENCES role(id)
);








