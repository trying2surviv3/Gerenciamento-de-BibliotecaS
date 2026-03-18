CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  isbn VARCHAR(20),
  edition VARCHAR(30),
  publication_year INT,
  language VARCHAR(50),
  pages INT,
  summary TEXT,
  publisher_id INT,       
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE book_copies (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id INT NOT NULL,     
  barcode VARCHAR(50) NOT NULL,
  acquisition_date DATE,
  status VARCHAR(30) NOT NULL,  
  location VARCHAR(100),
  notes VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
-- DROP filha primeiro, depois pai
DROP TABLE IF EXISTS book_copies;
DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id               INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title            VARCHAR(200) NOT NULL,
  isbn             VARCHAR(20)  UNIQUE,
  edition          VARCHAR(30),
  publication_year INT,
  language         VARCHAR(50)  DEFAULT 'Português',
  pages            INT,
  summary          TEXT,
  publisher_id     INT,
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_book_publisher
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
    ON DELETE SET NULL
);

CREATE TABLE book_copies (
  id               INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id          INT          NOT NULL,
  barcode          VARCHAR(50)  NOT NULL UNIQUE,
  acquisition_date DATE,
  status           VARCHAR(30)  NOT NULL DEFAULT 'disponivel',
  location         VARCHAR(100),
  notes            VARCHAR(255),
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_copy_book
    FOREIGN KEY (book_id) REFERENCES books(id)
    ON DELETE CASCADE
);

INSERT INTO books (title, isbn, edition, publication_year, language, pages, publisher_id) VALUES
('Dom Casmurro',                        '978-85-359-0277-5', '1ª',  1899, 'Português', 256,  1),
('Grande Sertão: Veredas',              '978-85-209-2398-1', '1ª',  1956, 'Português', 608,  2),
('O Cortiço',                           '978-85-350-3823-1', '2ª',  1890, 'Português', 272,  1),
('Memórias Póstumas de Brás Cubas',     '978-85-359-0354-3', '1ª',  1881, 'Português', 256,  1),
('A Hora da Estrela',                   '978-85-359-0460-1', '1ª',  1977, 'Português', 96,   3),
('Harry Potter e a Pedra Filosofal',    '978-85-325-1382-5', '1ª',  1997, 'Português', 264,  4),
('O Senhor dos Anéis',                  '978-85-264-0588-3', '2ª',  1954, 'Português', 1178, 5),
('1984',                                '978-85-280-0355-1', '1ª',  1949, 'Português', 304,  1),
('Admirável Mundo Novo',                '978-85-280-0307-0', '1ª',  1932, 'Português', 311,  1),
('Cem Anos de Solidão',                 '978-85-01-07390-4', '1ª',  1967, 'Português', 448,  2),
('O Pequeno Príncipe',                  '978-85-325-0635-3', '5ª',  1943, 'Português', 96,   4),
('Crime e Castigo',                     '978-85-250-4619-0', '1ª',  1866, 'Português', 560,  1),
('A Metamorfose',                       '978-85-280-0149-6', '1ª',  1915, 'Português', 96,   1),
('O Processo',                          '978-85-280-0200-4', '1ª',  1925, 'Português', 256,  1),
('O Alquimista',                        '978-85-325-0113-6', '1ª',  1988, 'Português', 208,  4),
('Sapiens: Uma Breve História da Humanidade','978-85-437-0462-3','1ª',2011,'Português', 464,  6),
('Código Limpo',                        '978-85-7608-065-3', '1ª',  2008, 'Português', 464,  17),
('O Guia do Mochileiro das Galáxias',   '978-85-325-2237-7', '1ª',  1979, 'Português', 224,  4),
('Fundação',                            '978-85-280-0401-5', '1ª',  1951, 'Português', 296,  1),
('Neuromancer',                         '978-85-7657-044-3', '1ª',  1984, 'Português', 288,  21),
('O Nome da Rosa',                      '978-85-359-0107-5', '1ª',  1980, 'Português', 576,  1),
('Fahrenheit 451',                      '978-85-280-0263-9', '1ª',  1953, 'Português', 208,  1),
('A Revolução dos Bichos',              '978-85-280-0316-2', '1ª',  1945, 'Português', 144,  1),
('O Hobbit',                            '978-85-264-0587-6', '3ª',  1937, 'Português', 336,  5),
('Percy Jackson e o Ladrão de Raios',   '978-85-01-08289-0', '1ª',  2005, 'Português', 376,  2),
('O Diário de Anne Frank',              '978-85-6095-067-4', '1ª',  1947, 'Português', 344,  8),
('A Cabana',                            '978-85-7657-207-2', '1ª',  2007, 'Português', 304,  21),
('Caçador de Pipas',                    '978-85-250-3748-8', '1ª',  2003, 'Português', 368,  1),
('A Menina que Roubava Livros',         '978-85-250-5095-1', '1ª',  2005, 'Português', 560,  1),
('O Médico e o Monstro',               '978-85-280-0364-3', '1ª',  1886, 'Português', 96,   1);

INSERT INTO book_copies (book_id, barcode, acquisition_date, status, location) VALUES
(1,  'BC-00001', '2020-01-10', 'disponivel',   'Estante A1'),
(2,  'BC-00002', '2020-01-10', 'disponivel',   'Estante A2'),
(3,  'BC-00003', '2020-02-05', 'disponivel',   'Estante A3'),
(4,  'BC-00004', '2020-02-05', 'disponivel',   'Estante A4'),
(5,  'BC-00005', '2020-03-15', 'disponivel',   'Estante A5'),
(6,  'BC-00006', '2020-03-15', 'emprestado',   'Estante B1'),
(7,  'BC-00007', '2020-04-20', 'disponivel',   'Estante B2'),
(8,  'BC-00008', '2020-04-20', 'disponivel',   'Estante B3'),
(9,  'BC-00009', '2020-05-01', 'disponivel',   'Estante B4'),
(10, 'BC-00010', '2020-05-01', 'emprestado',   'Estante B5'),
(11, 'BC-00011', '2020-06-10', 'disponivel',   'Estante C1'),
(12, 'BC-00012', '2020-06-10', 'disponivel',   'Estante C2'),
(13, 'BC-00013', '2020-07-22', 'reservado',    'Estante C3'),
(14, 'BC-00014', '2020-07-22', 'disponivel',   'Estante C4'),
(15, 'BC-00015', '2020-08-30', 'disponivel',   'Estante C5'),
(16, 'BC-00016', '2020-08-30', 'emprestado',   'Estante D1'),
(17, 'BC-00017', '2020-09-14', 'disponivel',   'Estante D2'),
(18, 'BC-00018', '2020-09-14', 'disponivel',   'Estante D3'),
(19, 'BC-00019', '2020-10-05', 'disponivel',   'Estante D4'),
(20, 'BC-00020', '2020-10-05', 'em_reparo',    'Estante D5'),
(21, 'BC-00021', '2020-11-18', 'disponivel',   'Estante E1'),
(22, 'BC-00022', '2020-11-18', 'disponivel',   'Estante E2'),
(23, 'BC-00023', '2020-12-01', 'emprestado',   'Estante E3'),
(24, 'BC-00024', '2020-12-01', 'disponivel',   'Estante E4'),
(25, 'BC-00025', '2021-01-07', 'disponivel',   'Estante E5'),
(26, 'BC-00026', '2021-01-07', 'disponivel',   'Estante F1'),
(27, 'BC-00027', '2021-02-14', 'disponivel',   'Estante F2'),
(28, 'BC-00028', '2021-02-14', 'emprestado',   'Estante F3'),
(29, 'BC-00029', '2021-03-20', 'disponivel',   'Estante F4'),
(30, 'BC-00030', '2021-03-20', 'disponivel',   'Estante F5');
