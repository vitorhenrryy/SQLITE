CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome varchar (100) NOT NULL,
    cpf int (12) not NULL,
    telefone varchar (13) not NULl,
    email varchar (100) not NULL,
    endereco TEXT
);

CREATE TABLE Produtos (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome varchar (100) NOT NULL,
    descricao TEXT,
    preco varchar (5) not null,
    estoque varchar(200) NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    data_pedido DATE,
    total varchar (100),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE ItensPedido (
    id_item INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido varchar (300) NOT NULL,
    id_produto varchar (300) NOT NULL,
    quantidade varchar (300) NOT NULL,
    preco_unitario varchar (300) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE Funcionarios (
    id_funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome varchar (200) NOT NULL,
    cpf varchar (13) not NULL,
    cargo varchar (200) NOT NULL,
    telefone varchar (200) not NULL,
    email varchar (200) not NULL
);

CREATE TABLE Manutencoes (
    id_manutencao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    data_manutencao DATE DEFAULT (DATE('now')),
    descricao TEXT NOT NULL,
    custo REAL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE HistoricoCompras (
    id_historico INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    data_compra DATE DEFAULT (DATE('now')),
    quantidade INTEGER NOT NULL,
    preco_total REAL NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO Clientes (nome, cpf, telefone, email, endereco) VALUES
('João Silva', '123.456.789-00', '11999998888', 'joao@email.com', 'Rua A, 100'),
('Maria Oliveira', '987.654.321-00', '11988887777', 'maria@email.com', 'Rua B, 200'),
('Carlos Santos', '456.789.123-00', '11977776666', 'carlos@email.com', 'Rua C, 300');

INSERT INTO Produtos (nome, descricao, preco, estoque) VALUES
('Notebook Dell', 'Notebook i7 com 16GB RAM', 4500.00, 10),
('Mouse Gamer', 'Mouse RGB com 6 botões programáveis', 150.00, 50),
('Teclado Mecânico', 'Teclado mecânico switch azul', 300.00, 30);

INSERT INTO Pedidos (id_cliente, data_pedido, total) VALUES
(1, '2025-02-15', 4800.00),
(2, '2025-02-14', 450.00);

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 4500.00), -- Notebook Dell
(1, 2, 2, 150.00),  -- 2 Mouses Gamer
(2, 3, 1, 300.00),  -- 1 Teclado Mecânico
(2, 2, 1, 150.00);  -- 1 Mouse Gamer


INSERT INTO Funcionarios (nome, cpf, cargo, telefone, email) VALUES
('Ana Souza', '321.654.987-00', 'Atendente', '11966665555', 'ana@email.com'),
('Pedro Lima', '654.987.321-00', 'Técnico', '11955554444', 'pedro@email.com');



INSERT INTO Manutencoes (id_cliente, data_manutencao, descricao, custo) VALUES
(1, '2025-02-10', 'Troca de tela de notebook', 800.00),
(3, '2025-02-12', 'Reparo no teclado mecânico', 120.00);

SELECT * FROM clientes;

