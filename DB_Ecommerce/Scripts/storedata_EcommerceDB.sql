-- Inserção de Dados e Queries
USE ecommerce;

INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
    VALUES
    ('Jorge','K','Wilde', 15789654756, 'Rua Navarro 754, Catumbi - Rio de Janeiro-RJ'),
	('Mathew','B','Din', 45926886868, 'Rua Joaquim Marques 154, Centro - Sooretama-ES'),
	('Mary','C','Nurafui', 78921545625,'Avenida Nossa Senhora de Guadalupe 151, Jardim Helena-SP'),
	('Simone','S','Batista', 56989547756, 'Rua Primeiro de Maio 187, Bela Vista - Curvelo-MG'),
	('Tuiyt','A','Fiada', 15979513478,'Rua Albino José 170, Bom Retiro - São Gonçalo-RJ'),
	('Raianna','H','Core', 14965478912, 'Rua Açucena 528, Jardim das Flores - Osasco-SP');

INSERT INTO product (Pname, classification_kids, category, avaliation, size) 
    VALUES
    ('Fone de Ouvido', false, 'Eletrônico','4',NULL),
	('Barbie Elsa', true, 'Brinquedos','5',NULL),
	('Body Carters', true, 'Vestimenta','4',NULL),
	('Microfone Vedo', true, 'Eletrônico','2',NULL),
	('Sofá Retretíl', false, 'Móveis','3','3x57x80'),
	('Echo Dot', false, 'Eletrônico','5',NULL),
    ('Fire Stick Amazon', false, 'Eletrônico','5',NULL);

INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
    VALUES 
	(1,DEFAULT,'Compra Via App',NULL,1),
    (2,DEFAULT,'Compra Via App',50,0),
    (3,'Confirmado',NULL,NULL,1),
    (4,DEFAULT,'Compra Via Website',150,0);

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
    VALUES
	(1,1,2,NULL),
    (2,1,1,NULL),
    (3,2,1,NULL);

INSERT INTO productStorage (storageLocation,quantity)
    VALUES 
	('Rio de Janeiro',1000),
    ('Rio de Janeiro',500),
    ('São Paulo',10),
    ('São Paulo',100),
    ('São Paulo',10),
    ('Brasília',60);

INSERT INTO storageLocation (idLproduct, idLstorage, location)
    VALUES
    (1,2,'RJ'),
	(2,6,'GO');

INSERT INTO supplier (socialName, CNPJ, contact)
    VALUES
	('Almeida e Filhos',123456780001456,'21987578323'),
    ('Eletrônicos Silva',184584580001787,'21978547411'),
    ('Eletrônicos Valma', 714589060001549,'21954756325');

INSERT INTO productSupplier (idPSsupplier, idPSproduct, psQuantity)
    VALUES
	(1,1,500),
    (1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,10);

INSERT INTO seller (socialName, abstName, CNPJ, CPF, location, contact)
    VALUES
	('Tech Eletrônics', NULL, 123456789456321, NULL, 'Rio de Janeiro', 21912345678),
	('Botique Durgas', NULL, NULL, 12354587941, 'Rio de Janeiro', 21945885231 ),
    ('Kids World',NULL,123456789123456,12345678944,'São Paulo', 21993547552);

INSERT INTO productSeller (idPSseller, idPSproduct, psQuantity) 
    VALUES 
	(1,6,80),
    (2,7,10);
    
INSERT INTO payments (idClient, idPayment, typePayment, limitAvaliable) 
    VALUES
	(1,5,'Dinheiro'),
    (2,1,'Cartão'),
    (3,3,NULL);