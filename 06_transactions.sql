CREATE TABLE loans (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id INT NOT NULL,          
  employee_id INT,               
  loan_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE,
  status VARCHAR(30) NOT NULL,   
  notes VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE loan_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  loan_id INT NOT NULL,        
  book_copy_id INT NOT NULL,   
  item_status VARCHAR(30) NOT NULL,  
  created_at TIMESTAMP
);

CREATE TABLE reservations (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id INT NOT NULL,           
  book_id INT NOT NULL,           
  reservation_date DATE NOT NULL,
  expiration_date DATE,
  status VARCHAR(30) NOT NULL,    
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE fines (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id INT NOT NULL,          
  loan_id INT,                   
  amount DECIMAL(10,2) NOT NULL,
  reason VARCHAR(120) NOT NULL,  
  issued_date DATE NOT NULL,
  is_paid BOOLEAN DEFAULT FALSE,
  paid_date DATE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

SET client_min_messages TO WARNING;

DROP TABLE IF EXISTS fines;
DROP TABLE IF EXISTS loan_items;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS loans;

CREATE TABLE loans (
  id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id     INT  NOT NULL,
  employee_id INT,
  loan_date   DATE NOT NULL,
  due_date    DATE NOT NULL,
  return_date DATE,
  status      VARCHAR(30) NOT NULL DEFAULT 'ativo',
  notes       VARCHAR(255),
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_loan_user
    FOREIGN KEY (user_id)     REFERENCES users(id)     ON DELETE RESTRICT,
  CONSTRAINT fk_loan_employee
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE SET NULL
);

CREATE TABLE loan_items (
  id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  loan_id      INT NOT NULL,
  book_copy_id INT NOT NULL,
  item_status  VARCHAR(30) NOT NULL DEFAULT 'emprestado',
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_li_loan
    FOREIGN KEY (loan_id)      REFERENCES loans(id)       ON DELETE CASCADE,
  CONSTRAINT fk_li_copy
    FOREIGN KEY (book_copy_id) REFERENCES book_copies(id) ON DELETE RESTRICT
);

CREATE TABLE reservations (
  id               INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id          INT  NOT NULL,
  book_id          INT  NOT NULL,
  reservation_date DATE NOT NULL,
  expiration_date  DATE,
  status           VARCHAR(30) NOT NULL DEFAULT 'pendente',
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_res_user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  CONSTRAINT fk_res_book
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE RESTRICT
);

CREATE TABLE fines (
  id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id     INT           NOT NULL,
  loan_id     INT,
  amount      DECIMAL(10,2) NOT NULL,
  reason      VARCHAR(120)  NOT NULL,
  issued_date DATE          NOT NULL,
  is_paid     BOOLEAN DEFAULT FALSE,
  paid_date   DATE,
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_fine_user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  CONSTRAINT fk_fine_loan
    FOREIGN KEY (loan_id) REFERENCES loans(id) ON DELETE SET NULL
);

INSERT INTO loans (user_id, employee_id, loan_date, due_date, return_date, status) VALUES
(1,  1,  '2024-01-05', '2024-01-19', '2024-01-18', 'devolvido'),
(2,  2,  '2024-01-08', '2024-01-22', '2024-01-25', 'devolvido'),
(3,  1,  '2024-01-10', '2024-02-09', '2024-02-07', 'devolvido'),
(4,  3,  '2024-01-12', '2024-01-26', NULL,          'atrasado'),
(5,  2,  '2024-01-15', '2024-01-22', '2024-01-22', 'devolvido'),
(6,  1,  '2024-01-18', '2024-02-01', NULL,          'ativo'),
(7,  4,  '2024-01-20', '2024-02-19', '2024-02-18', 'devolvido'),
(8,  3,  '2024-01-22', '2024-02-05', NULL,          'atrasado'),
(9,  1,  '2024-01-25', '2024-03-10', NULL,          'ativo'),
(10, 2,  '2024-01-28', '2024-02-11', '2024-02-10', 'devolvido'),
(11, 5,  '2024-02-01', '2024-02-08', '2024-02-12', 'devolvido'),
(12, 1,  '2024-02-03', '2024-03-04', '2024-03-01', 'devolvido'),
(13, 3,  '2024-02-05', '2024-02-19', NULL,          'atrasado'),
(14, 2,  '2024-02-07', '2024-03-23', NULL,          'ativo'),
(15, 4,  '2024-02-10', '2024-02-24', '2024-02-23', 'devolvido'),
(16, 1,  '2024-02-12', '2024-03-12', '2024-03-10', 'devolvido'),
(17, 5,  '2024-02-15', '2024-03-01', '2024-03-05', 'devolvido'),
(18, 3,  '2024-02-18', '2024-02-25', NULL,          'atrasado'),
(19, 2,  '2024-02-20', '2024-03-05', '2024-03-03', 'devolvido'),
(20, 1,  '2024-02-22', '2024-04-06', NULL,          'ativo'),
(21, 4,  '2024-03-01', '2024-03-15', '2024-03-14', 'devolvido'),
(22, 5,  '2024-03-05', '2024-03-19', '2024-03-20', 'devolvido'),
(23, 2,  '2024-03-08', '2024-03-22', NULL,          'atrasado'),
(24, 3,  '2024-03-10', '2024-03-24', '2024-03-24', 'devolvido'),
(25, 1,  '2024-03-12', '2024-03-26', NULL,          'ativo'),
(26, 4,  '2024-03-15', '2024-03-29', '2024-03-28', 'devolvido'),
(27, 2,  '2024-03-18', '2024-04-01', NULL,          'ativo'),
(28, 5,  '2024-03-20', '2024-04-03', '2024-04-03', 'devolvido'),
(29, 1,  '2024-03-22', '2024-04-05', NULL,          'atrasado'),
(30, 3,  '2024-03-25', '2024-04-08', '2024-04-07', 'devolvido');

INSERT INTO loan_items (loan_id, book_copy_id, item_status) VALUES
(1,  1,  'devolvido'), (2,  2,  'devolvido'), (3,  3,  'devolvido'),
(4,  4,  'emprestado'),(5,  5,  'devolvido'), (6,  6,  'emprestado'),
(7,  7,  'devolvido'), (8,  8,  'emprestado'),(9,  9,  'emprestado'),
(10, 10, 'devolvido'), (11, 11, 'devolvido'), (12, 12, 'devolvido'),
(13, 13, 'emprestado'),(14, 14, 'emprestado'),(15, 15, 'devolvido'),
(16, 16, 'devolvido'), (17, 17, 'devolvido'), (18, 18, 'emprestado'),
(19, 19, 'devolvido'), (20, 20, 'emprestado'),(21, 21, 'devolvido'),
(22, 22, 'devolvido'), (23, 23, 'emprestado'),(24, 24, 'devolvido'),
(25, 25, 'emprestado'),(26, 26, 'devolvido'), (27, 27, 'emprestado'),
(28, 28, 'devolvido'), (29, 29, 'emprestado'),(30, 30, 'devolvido');

INSERT INTO reservations (user_id, book_id, reservation_date, expiration_date, status) VALUES
(1,  6,  '2024-01-03', '2024-01-10', 'atendida'),  (2,  10, '2024-01-06', '2024-01-13', 'cancelada'),
(3,  1,  '2024-01-09', '2024-01-16', 'pendente'),  (4,  16, '2024-01-11', '2024-01-18', 'atendida'),
(5,  7,  '2024-01-13', '2024-01-20', 'expirada'),  (6,  2,  '2024-01-16', '2024-01-23', 'pendente'),
(7,  11, '2024-01-19', '2024-01-26', 'atendida'),  (8,  3,  '2024-01-21', '2024-01-28', 'pendente'),
(9,  17, '2024-01-24', '2024-01-31', 'pendente'),  (10, 8,  '2024-01-27', '2024-02-03', 'atendida'),
(11, 4,  '2024-01-30', '2024-02-06', 'expirada'),  (12, 15, '2024-02-02', '2024-02-09', 'pendente'),
(13, 9,  '2024-02-04', '2024-02-11', 'cancelada'), (14, 6,  '2024-02-06', '2024-02-13', 'atendida'),
(15, 12, '2024-02-08', '2024-02-15', 'pendente'),  (16, 20, '2024-02-11', '2024-02-18', 'pendente'),
(17, 5,  '2024-02-13', '2024-02-20', 'atendida'),  (18, 13, '2024-02-16', '2024-02-23', 'pendente'),
(19, 18, '2024-02-19', '2024-02-26', 'atendida'),  (20, 1,  '2024-02-21', '2024-02-28', 'expirada'),
(21, 14, '2024-03-01', '2024-03-08', 'pendente'),  (22, 7,  '2024-03-04', '2024-03-11', 'atendida'),
(23, 19, '2024-03-07', '2024-03-14', 'cancelada'), (24, 2,  '2024-03-09', '2024-03-16', 'pendente'),
(25, 11, '2024-03-11', '2024-03-18', 'atendida'),  (26, 3,  '2024-03-14', '2024-03-21', 'pendente'),
(27, 16, '2024-03-17', '2024-03-24', 'pendente'),  (28, 8,  '2024-03-19', '2024-03-26', 'atendida'),
(29, 4,  '2024-03-21', '2024-03-28', 'pendente'),  (30, 10, '2024-03-24', '2024-03-31', 'atendida');

INSERT INTO fines (user_id, loan_id, amount, reason, issued_date, is_paid, paid_date) VALUES
(2,  2,  1.50,  'Atraso na devolução',        '2024-01-26', TRUE,  '2024-01-28'),
(4,  4,  8.00,  'Atraso na devolução',        '2024-02-12', FALSE, NULL),
(8,  8,  5.00,  'Atraso na devolução',        '2024-02-20', FALSE, NULL),
(11, 11, 2.00,  'Atraso na devolução',        '2024-02-13', TRUE,  '2024-02-15'),
(13, 13, 6.50,  'Atraso na devolução',        '2024-03-05', FALSE, NULL),
(17, 17, 1.20,  'Atraso na devolução',        '2024-03-06', TRUE,  '2024-03-08'),
(18, 18, 4.50,  'Atraso na devolução',        '2024-03-10', FALSE, NULL),
(22, 22, 0.50,  'Atraso na devolução',        '2024-03-21', TRUE,  '2024-03-22'),
(23, 23, 7.00,  'Atraso na devolução',        '2024-04-01', FALSE, NULL),
(29, 29, 3.00,  'Atraso na devolução',        '2024-04-10', FALSE, NULL),
(1,  1,  0.00,  'Dano leve na capa',          '2024-01-19', TRUE,  '2024-01-19'),
(3,  3,  10.00, 'Dano na lombada do livro',   '2024-02-07', FALSE, NULL),
(5,  5,  0.00,  'Perda de marcador interno',  '2024-01-22', TRUE,  '2024-01-22'),
(6,  6,  5.00,  'Páginas rasgadas',           '2024-03-15', FALSE, NULL),
(7,  7,  0.00,  'Manchas internas',           '2024-02-18', TRUE,  '2024-02-20'),
(9,  9,  15.00, 'Livro perdido',              '2024-03-20', FALSE, NULL),
(10, 10, 0.00,  'Riscos a lápis',             '2024-02-11', TRUE,  '2024-02-11'),
(12, 12, 2.50,  'Atraso na devolução',        '2024-03-02', TRUE,  '2024-03-05'),
(14, 14, 0.90,  'Atraso na devolução',        '2024-04-01', FALSE, NULL),
(15, 15, 0.00,  'Dobra nas páginas',          '2024-02-23', TRUE,  '2024-02-23'),
(16, 16, 0.00,  'Capa solta',                 '2024-03-10', FALSE, NULL),
(19, 19, 2.00,  'Atraso na devolução',        '2024-03-06', TRUE,  '2024-03-07'),
(20, 20, 0.00,  'Manchas de café',            '2024-04-15', FALSE, NULL),
(21, 21, 0.00,  'Desgaste natural',           '2024-03-14', TRUE,  '2024-03-14'),
(24, 24, 0.00,  'Sem ocorrências',            '2024-03-24', TRUE,  '2024-03-24'),
(25, 25, 3.50,  'Atraso na devolução',        '2024-04-05', FALSE, NULL),
(26, 26, 0.00,  'Desgaste normal',            '2024-03-28', TRUE,  '2024-03-28'),
(27, 27, 0.00,  'Anotações a lápis',          '2024-04-05', FALSE, NULL),
(28, 28, 0.00,  'Sem ocorrências',            '2024-04-03', TRUE,  '2024-04-03'),
(30, 30, 0.00,  'Sem ocorrências',            '2024-04-07', TRUE,  '2024-04-07');