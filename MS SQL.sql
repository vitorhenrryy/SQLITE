CREATE DATABASE Pizzaria;
USE Pizzaria;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) UNIQUE NOT NULL,
    endereco varchar(100) NOT NULL
);

CREATE TABLE Pizzas (
    id_pizza INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Ingredientes (
    id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Pizza_Ingredientes (
    id_pizza INT,
    id_ingrediente INT,
    PRIMARY KEY (id_pizza, id_ingrediente),
    FOREIGN KEY (id_pizza) REFERENCES Pizzas(id_pizza) ON DELETE CASCADE,
    FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente) ON DELETE CASCADE
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Recebido', 'Preparando', 'Saiu para entrega', 'Entregue') DEFAULT 'Recebido',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE SET NULL
);

CREATE TABLE Itens_Pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_pizza INT,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_pizza) REFERENCES Pizzas(id_pizza) ON DELETE CASCADE
);

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo ENUM('Atendente', 'Pizzaiolo', 'Entregador') NOT NULL
);

CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
  /* Se um pedido for deletado, os itens do pedido também serão removidos automaticamente.*/
    metodo ENUM('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'PIX') NOT NULL,
    status ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE
);

CREATE TABLE Cupons (
    id_cupom INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    desconto DECIMAL(5,2) NOT NULL CHECK (desconto > 0 AND desconto <= 100),
  /*O ENUM ocupa menos espaço do que armazenar strings longas repetidamente.*/
    tipo ENUM('Porcentagem', 'Valor Fixo') NOT NULL,
    validade DATE NOT NULL
);

ALTER TABLE Pedidos ADD COLUMN id_cupom INT NULL;
ALTER TABLE Pedidos ADD FOREIGN KEY (id_cupom) REFERENCES Cupons(id_cupom) ON DELETE SET NULL;

CREATE TABLE Avaliacoes (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_pedido INT,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE
);

ALTER TABLE Pedidos ADD COLUMN tempo_entrega TIME NULL;

drop database pizzaria;

SELECT *FROM pizzaria;
