CREATE TABLE user_types (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  max_loans INT NOT NULL,
  loan_days INT NOT NULL,
  fine_per_day DECIMAL(10,2) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE users (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(150) NOT NULL,
  document_number VARCHAR(30),
  email VARCHAR(150),
  phone VARCHAR(30),
  address VARCHAR(255),
  user_type_id INT NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE employees (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(150) NOT NULL,
  document_number VARCHAR(30),
  email VARCHAR(150),
  phone VARCHAR(30),
  role VARCHAR(80) NOT NULL, 
  is_active BOOLEAN DEFAULT TRUE,
  hired_at DATE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_types;

CREATE TABLE user_types (
  id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name         VARCHAR(50)    NOT NULL UNIQUE,
  max_loans    INT            NOT NULL,
  loan_days    INT            NOT NULL,
  fine_per_day DECIMAL(10,2)  NOT NULL,
  is_active    BOOLEAN DEFAULT TRUE,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
  id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name       VARCHAR(150) NOT NULL,
  document_number VARCHAR(30)  UNIQUE,
  email           VARCHAR(150) UNIQUE,
  phone           VARCHAR(30),
  address         VARCHAR(255),
  user_type_id    INT          NOT NULL,
  is_active       BOOLEAN DEFAULT TRUE,
  created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_type
    FOREIGN KEY (user_type_id) REFERENCES user_types(id)
    ON DELETE RESTRICT
);

CREATE TABLE employees (
  id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name       VARCHAR(150) NOT NULL,
  document_number VARCHAR(30)  UNIQUE,
  email           VARCHAR(150) UNIQUE,
  phone           VARCHAR(30),
  role            VARCHAR(80)  NOT NULL,
  is_active       BOOLEAN DEFAULT TRUE,
  hired_at        DATE,
  created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO user_types (name, max_loans, loan_days, fine_per_day) VALUES
('Estudante',       3,  14, 0.50),
('Professor',       5,  30, 0.30),
('Comunidade',      2,   7, 1.00),
('Pesquisador',     8,  45, 0.20),
('Funcionário',     4,  21, 0.00);

INSERT INTO users (full_name, document_number, email, phone, address, user_type_id) VALUES
('Ana Carolina Souza',         '111.222.333-01', 'ana.souza@email.com',         '(71) 99001-0001', 'Rua das Flores, 10, Feira de Santana-BA',    1),
('Bruno Lima Santos',          '111.222.333-02', 'bruno.santos@email.com',      '(71) 99001-0002', 'Av. Senhor dos Passos, 200, Salvador-BA',    1),
('Carla Oliveira Mendes',      '111.222.333-03', 'carla.mendes@email.com',      '(71) 99001-0003', 'Rua do Progresso, 55, Feira de Santana-BA',  2),
('Diego Ferreira Costa',       '111.222.333-04', 'diego.costa@email.com',       '(71) 99001-0004', 'Travessa da Paz, 32, Salvador-BA',           1),
('Eduarda Ramos Vieira',       '111.222.333-05', 'eduarda.vieira@email.com',    '(74) 99001-0005', 'Rua Nova, 87, Serrinha-BA',                  3),
('Felipe Alves Barbosa',       '111.222.333-06', 'felipe.barbosa@email.com',    '(71) 99001-0006', 'Rua da Alegria, 14, Feira de Santana-BA',    1),
('Gabriela Torres Leal',       '111.222.333-07', 'gabriela.leal@email.com',     '(71) 99001-0007', 'Av. Presidente Dutra, 311, Salvador-BA',     2),
('Henrique Nunes Cardoso',     '111.222.333-08', 'henrique.cardoso@email.com',  '(71) 99001-0008', 'Rua dos Ipês, 22, Feira de Santana-BA',      1),
('Isabela Carvalho Pinto',     '111.222.333-09', 'isabela.pinto@email.com',     '(71) 99001-0009', 'Rua da Esperança, 77, Salvador-BA',          4),
('João Batista Rodrigues',     '111.222.333-10', 'joao.rodrigues@email.com',    '(74) 99001-0010', 'Praça da Liberdade, 5, Alagoinhas-BA',       1),
('Karina Moura Teixeira',      '111.222.333-11', 'karina.teixeira@email.com',   '(71) 99001-0011', 'Rua das Palmeiras, 90, Feira de Santana-BA', 3),
('Lucas Pereira Gomes',        '111.222.333-12', 'lucas.gomes@email.com',       '(71) 99001-0012', 'Av. Contorno, 450, Salvador-BA',             2),
('Marina Castro Fonseca',      '111.222.333-13', 'marina.fonseca@email.com',    '(75) 99001-0013', 'Rua das Acácias, 123, Camaçari-BA',          1),
('Natalia Ribeiro Cunha',      '111.222.333-14', 'natalia.cunha@email.com',     '(71) 99001-0014', 'Rua Nova Esperança, 60, Feira de Santana-BA',4),
('Otávio Dias Monteiro',       '111.222.333-15', 'otavio.monteiro@email.com',   '(71) 99001-0015', 'Av. Brasil, 999, Salvador-BA',               1),
('Patrícia Araújo Leite',      '111.222.333-16', 'patricia.leite@email.com',    '(71) 99001-0016', 'Rua das Orquídeas, 34, Feira de Santana-BA', 2),
('Rafael Sousa Miranda',       '111.222.333-17', 'rafael.miranda@email.com',    '(74) 99001-0017', 'Travessa São João, 8, Serrinha-BA',          1),
('Simone Vasconcelos Cruz',    '111.222.333-18', 'simone.cruz@email.com',       '(71) 99001-0018', 'Rua da União, 77, Salvador-BA',              3),
('Thiago Melo Cavalcante',     '111.222.333-19', 'thiago.cavalcante@email.com', '(71) 99001-0019', 'Rua Sete de Setembro, 101, Feira-BA',        1),
('Ursula Freitas Azevedo',     '111.222.333-20', 'ursula.azevedo@email.com',    '(71) 99001-0020', 'Av. Oceânica, 204, Salvador-BA',             4),
('Vinícius Almeida Rocha',     '111.222.333-21', 'vinicius.rocha@email.com',    '(71) 99001-0021', 'Rua Independência, 50, Feira de Santana-BA', 1),
('Wanda Correia Nascimento',   '111.222.333-22', 'wanda.nascimento@email.com',  '(74) 99001-0022', 'Rua das Mangueiras, 18, Alagoinhas-BA',      1),
('Xavier Borges Queiroz',      '111.222.333-23', 'xavier.queiroz@email.com',    '(71) 99001-0023', 'Rua Tiradentes, 300, Salvador-BA',           2),
('Yasmin Campos Lima',         '111.222.333-24', 'yasmin.lima@email.com',       '(71) 99001-0024', 'Rua Quinze de Novembro, 9, Feira-BA',        1),
('Zélia Tavares Santos',       '111.222.333-25', 'zelia.santos@email.com',      '(71) 99001-0025', 'Largo do Pelourinho, 3, Salvador-BA',        3),
('Alexandre Peixoto Dantas',   '111.222.333-26', 'alexandre.dantas@email.com',  '(71) 99001-0026', 'Av. Milton Santos, 66, Salvador-BA',         1),
('Beatriz Guimarães Falcão',   '111.222.333-27', 'beatriz.falcao@email.com',    '(74) 99001-0027', 'Rua do Comércio, 44, Serrinha-BA',           2),
('César Mendonça Paiva',       '111.222.333-28', 'cesar.paiva@email.com',       '(71) 99001-0028', 'Rua Santa Clara, 71, Feira de Santana-BA',   4),
('Denise Luz Brandão',         '111.222.333-29', 'denise.brandao@email.com',    '(71) 99001-0029', 'Av. Paralela, 528, Salvador-BA',             1),
('Emerson Siqueira Nogueira',  '111.222.333-30', 'emerson.nogueira@email.com',  '(75) 99001-0030', 'Rua das Laranjeiras, 11, Camaçari-BA',       2);

INSERT INTO employees (full_name, document_number, email, phone, role, hired_at) VALUES
('Sandra Lopes Andrade',    '222.333.444-01', 'sandra.andrade@biblioteca.com',    '(71) 98000-0001', 'Bibliotecária-Chefe',       '2010-03-01'),
('Ricardo Matos Bispo',     '222.333.444-02', 'ricardo.bispo@biblioteca.com',     '(71) 98000-0002', 'Auxiliar de Biblioteca',    '2012-06-15'),
('Fernanda Lima Costa',     '222.333.444-03', 'fernanda.costa@biblioteca.com',    '(71) 98000-0003', 'Atendente',                 '2014-02-10'),
('Marcos Saraiva Duarte',   '222.333.444-04', 'marcos.duarte@biblioteca.com',     '(71) 98000-0004', 'Catalogador',               '2015-07-20'),
('Lúcia Moreira Esteves',   '222.333.444-05', 'lucia.esteves@biblioteca.com',     '(71) 98000-0005', 'Atendente',                 '2016-01-05'),
('Paulo Figueiredo Gama',   '222.333.444-06', 'paulo.gama@biblioteca.com',        '(71) 98000-0006', 'Auxiliar de Biblioteca',    '2016-09-12'),
('Sônia Barros Hollanda',   '222.333.444-07', 'sonia.hollanda@biblioteca.com',    '(71) 98000-0007', 'Supervisora de Acervo',     '2011-11-30'),
('André Ivo Jacinto',       '222.333.444-08', 'andre.jacinto@biblioteca.com',     '(71) 98000-0008', 'Atendente',                 '2018-04-22'),
('Cristina Kleber Lauro',   '222.333.444-09', 'cristina.lauro@biblioteca.com',    '(71) 98000-0009', 'Auxiliar de Biblioteca',    '2019-08-01'),
('Daniel Macedo Nery',      '222.333.444-10', 'daniel.nery@biblioteca.com',       '(71) 98000-0010', 'Atendente',                 '2020-03-15'),
('Eliane Oliveira Prado',   '222.333.444-11', 'eliane.prado@biblioteca.com',      '(71) 98000-0011', 'Catalogadora',              '2017-05-18'),
('Fábio Queiroz Ramos',     '222.333.444-12', 'fabio.ramos@biblioteca.com',       '(71) 98000-0012', 'Auxiliar de TI',            '2018-10-01'),
('Glória Sá Tenório',       '222.333.444-13', 'gloria.tenorio@biblioteca.com',    '(71) 98000-0013', 'Atendente',                 '2019-01-07'),
('Hugo Ulisses Viana',      '222.333.444-14', 'hugo.viana@biblioteca.com',        '(71) 98000-0014', 'Auxiliar de Biblioteca',    '2020-07-20'),
('Íris Xavier Yunes',       '222.333.444-15', 'iris.yunes@biblioteca.com',        '(71) 98000-0015', 'Atendente',                 '2021-02-01'),
('Jorge Zanini Abreu',      '222.333.444-16', 'jorge.abreu@biblioteca.com',       '(71) 98000-0016', 'Catalogador',               '2013-06-06'),
('Kelly Braga Canto',       '222.333.444-17', 'kelly.canto@biblioteca.com',       '(71) 98000-0017', 'Supervisora de Atendimento','2012-12-12'),
('Leonardo Diniz Eiras',    '222.333.444-18', 'leonardo.eiras@biblioteca.com',    '(71) 98000-0018', 'Auxiliar de Biblioteca',    '2022-01-10'),
('Mônica Fontes Guedes',    '222.333.444-19', 'monica.guedes@biblioteca.com',     '(71) 98000-0019', 'Atendente',                 '2022-03-21'),
('Nelson Henriques Igor',   '222.333.444-20', 'nelson.igor@biblioteca.com',       '(71) 98000-0020', 'Auxiliar de Biblioteca',    '2022-08-08'),
('Olga Jardim Keller',      '222.333.444-21', 'olga.keller@biblioteca.com',       '(71) 98000-0021', 'Atendente',                 '2023-01-15'),
('Pedro Lira Matos',        '222.333.444-22', 'pedro.matos@biblioteca.com',       '(71) 98000-0022', 'Auxiliar de Biblioteca',    '2023-04-01'),
('Quésia Nóbrega Orsini',   '222.333.444-23', 'quesia.orsini@biblioteca.com',     '(71) 98000-0023', 'Catalogadora',              '2021-09-09'),
('Roberto Paes Quintela',   '222.333.444-24', 'roberto.quintela@biblioteca.com',  '(71) 98000-0024', 'Atendente',                 '2020-11-11'),
('Sheila Rocha Salete',     '222.333.444-25', 'sheila.salete@biblioteca.com',     '(71) 98000-0025', 'Auxiliar de Biblioteca',    '2019-07-07'),
('Túlio Serrano Taís',      '222.333.444-26', 'tulio.tais@biblioteca.com',        '(71) 98000-0026', 'Auxiliar de Biblioteca',    '2018-02-28'),
('Urânia Vasques Wilma',    '222.333.444-27', 'urania.wilma@biblioteca.com',      '(71) 98000-0027', 'Atendente',                 '2017-10-10'),
('Vanda Xavier Yara',       '222.333.444-28', 'vanda.yara@biblioteca.com',        '(71) 98000-0028', 'Supervisora de Acervo',     '2011-05-25'),
('Wallace Zanelato Abner',  '222.333.444-29', 'wallace.abner@biblioteca.com',     '(71) 98000-0029', 'Auxiliar de TI',            '2020-06-01'),
('Zora Alves Bento',        '222.333.444-30', 'zora.bento@biblioteca.com',        '(71) 98000-0030', 'Atendente',                 '2023-10-01');
