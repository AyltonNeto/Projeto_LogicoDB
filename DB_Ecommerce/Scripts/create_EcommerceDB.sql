-- Criação do Banco de Dados - Cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar Tabela Cliente
CREATE TABLE clients(
        idClient INT AUTO_INCREMENT PRIMARY KEY,
        Fname VARCHAR(20),
        Minit CHAR(1),
        Lname VARCHAR(20),
        CPF CHAR(11) NOT NULL,
        Address VARCHAR(255),
        CONSTRAINT unique_cpf_client UNIQUE (CPF)
);
ALTER TABLE clients AUTO_INCREMENT = 1;

-- Criar Tabela Produto (size = dimensão do produto)
CREATE TABLE product(
        idProduct INT AUTO_INCREMENT PRIMARY KEY,
        Pname VARCHAR(20),
        classification_kids BOOL DEFAULT FALSE,
        category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
        avaliation FLOAT DEFAULT 0,
        size VARCHAR(10)
);
ALTER TABLE product AUTO_INCREMENT = 1;

-- Criar Tabela Pagamentos (precisa ser continuada no desafio: crie a conexão com as tabelas necessárias)
CREATE TABLE payments(
        idClient INT,
        idPayment INT,
        typePayment ENUM('Boleto','Cartão','2 Cartões'),
        limitAvailable FLOAT,
        PRIMARY KEY(idClient, idPayment)
);

-- Criar Tabela Pedido
CREATE TABLE orders(
        idOrder INT AUTO_INCREMENT PRIMARY KEY,
        idOrderClient INT,
        orderStatus ENUM('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em Processamento',
        orderDescription VARCHAR(255),
        sendValue FLOAT DEFAULT 10,
        paymentCash BOOLEAN DEFAULT FALSE,
        CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);
ALTER TABLE orders AUTO_INCREMENT = 1;

-- Criar Tabela Estoque
CREATE TABLE productStorage(
        idStorage INT AUTO_INCREMENT PRIMARY KEY,
        storageLocation VARCHAR(255),
        quantity INT DEFAULT 0
);
ALTER TABLE productStorage AUTO_INCREMENT = 1;

-- Criar Tabela Fornecedor
CREATE TABLE supplier(
        idSupplier INT AUTO_INCREMENT PRIMARY KEY,
        socialName VARCHAR(255) NOT NULL,
        CNPJ CHAR(15) NOT NULL,
        contact CHAR(11) NOT NULL,
        CONSTRAINT unique_supplier UNIQUE (CNPJ)
);
ALTER TABLE supplier AUTO_INCREMENT = 1;

-- Criar Tabela Vendedor
CREATE TABLE seller(
        idSeller INT AUTO_INCREMENT PRIMARY KEY,
        socialName VARCHAR(255) NOT NULL,
        abstName VARCHAR(255),
        CNPJ CHAR(15),
        CPF CHAR(11),
        location VARCHAR(255),
        contact CHAR(11) NOT NULL,
        CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
        CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);
ALTER TABLE seller AUTO_INCREMENT = 1;

-- Criar Tabela Produto/Vendedor
CREATE TABLE productSeller(
        idPseller INT,
        idProduct INT,
        prodQuantity INT DEFAULT 1,
        PRIMARY KEY (idPseller, idProduct),
        CONSTRAINT fk_ps_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
        CONSTRAINT fk_ps_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- Criar Tabela Produto/Pedido
CREATE TABLE productOrder(
        idPOproduct INT,
        idPOorder INT,
        poQuantity INT DEFAULT 1,
        poStatus ENUM('Disponível','Sem Estoque') DEFAULT 'Disponível',
        PRIMARY KEY (idPOproduct, idPOorder),
        CONSTRAINT fk_po_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
        CONSTRAINT fk_po_order_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Criar Tabela Local de Armazenamento
CREATE TABLE storageLocation(
        idSLproduct INT,
        idSLstorage INT,
        location VARCHAR(255) NOT NULL,
        PRIMARY KEY (idLproduct, idLstorage),
        CONSTRAINT fk_sl_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
        CONSTRAINT fk_sl_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

-- Criar Tabela Produto/Fornecedor
CREATE TABLE productSupplier(
        idPSsupplier INT,
        idPSproduct INT,
        quantity INT NOT NULL,
        PRIMARY KEY (idPSsupplier, idPSproduct),
        CONSTRAINT fb_product_supplier_supplier FOREIGN KEY (idPSsupplier) REFERENCES supplier(idSupplier),
        CONSTRAINT fb_product_supplier_product FOREIGN KEY (idPSproduct) REFERENCES product(idProduct)
);