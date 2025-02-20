-- Criar o banco de dados
CREATE DATABASE cafeteria_db;
USE cafeteria_db;

-- Tabela de funcionários
CREATE TABLE funcionarios (
    cod_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cod_endereco INT,
    cod_funcao INT,
    rg VARCHAR(13) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    tit_eleitor VARCHAR(12) NOT NULL,
    ctps VARCHAR(100) NOT NULL,
    serie VARCHAR(100) NOT NULL,
    pis_pasep VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (cod_endereco) REFERENCES endereco(cod_endereco),
    FOREIGN KEY (cod_funcao) REFERENCES funcao(cod_funcao)
);

-- Tabela de clientes
CREATE TABLE clientes (
    cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cod_endereco INT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (cod_endereco) REFERENCES endereco(cod_endereco)
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    cod_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente INT,
    subtotal DECIMAL(10,2) NOT NULL,
    status ENUM('Recebido', 'Preparando', 'Saiu para entrega', 'Entregue') DEFAULT 'Recebido',
    tipo_pgto ENUM('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'PIX') NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente) ON DELETE SET NULL
);

-- Tabela de endereços
CREATE TABLE endereco (
    cod_endereco INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2)
);

-- Tabela de carrinho
CREATE TABLE carrinho (
    cod_pedido INT,
    cod_produto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (cod_pedido, cod_produto),
    FOREIGN KEY (cod_pedido) REFERENCES pedidos(cod_pedido) ON DELETE CASCADE,
    FOREIGN KEY (cod_produto) REFERENCES produtos(cod_produto) ON DELETE CASCADE
);

-- Tabela de produtos
CREATE TABLE produtos (
    cod_produto INT AUTO_INCREMENT PRIMARY KEY,
    preco DECIMAL(10,2) NOT NULL,
    tamanho VARCHAR(50),
    tipo VARCHAR(50),
    descricao VARCHAR(100) NOT NULL
);

-- Tabela de funções
CREATE TABLE funcao (
    cod_funcao INT AUTO_INCREMENT PRIMARY KEY,
    funcao VARCHAR(100) NOT NULL,
    cbo VARCHAR(50),
    tipo VARCHAR(50),
    turno VARCHAR(30) NOT NULL
);
