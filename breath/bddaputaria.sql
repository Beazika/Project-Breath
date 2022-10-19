CREATE DATABASE sistema;
use sistema;

CREATE TABLE produto(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
valor DECIMAL(10,2),
qtd INT);

INSERT INTO produto (nome, valor, qtd) 
VALUES
("carro", 25.50, 1000),
("pasta", 50, 1000),
("ovo", 200, 1000),
("leite", 48, 1000);

CREATE TABLE cliente(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100));

INSERT INTO cliente (nome) VALUES
("Rodolfo"),
("Wellington"),
("Jonas"),
("Oswaldo"),
("Paulo");

CREATE TABLE pedido(
cd INT PRIMARY KEY AUTO_INCREMENT,
id_produto INT,
id_cliente INT,
qtd INT,
FOREIGN KEY (id_produto) REFERENCES produto (cd),
FOREIGN KEY (id_cliente) REFERENCES cliente (cd)
);






DELIMITER $$
CREATE PROCEDURE FazPedido(IN quem INT, IN oque INT, IN quanto INT)
BEGIN
    INSERT INTO pedido (id_cliente, id_produto, qtd) VALUES (quem, oque, quanto);
    UPDATE produto SET qtd = qtd-quanto WHERE cd = oque;
END$$
DELIMITER ;

