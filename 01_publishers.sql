CREATE TABLE publishers (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  phone VARCHAR(30),
  email VARCHAR(150),
  website VARCHAR(200),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

DROP TABLE IF EXISTS publishers;

NSERT INTO publishers (name, phone, email, website) VALUES
('Companhia das Letras',      '(11) 3707-3500', 'contato@companhiadasletras.com.br',  'https://www.companhiadasletras.com.br'),
('Record',                    '(21) 2585-2000', 'contato@record.com.br',              'https://www.record.com.br'),
('Rocco',                     '(21) 2529-6000', 'info@rocco.com.br',                  'https://www.rocco.com.br'),
('Intrínseca',                '(21) 3525-6878', 'contato@intrinseca.com.br',          'https://www.intrinseca.com.br'),
('Sextante',                  '(21) 2538-4100', 'sextante@sextante.com.br',           'https://www.sextante.com.br'),
('Globo Livros',              '(11) 3767-7170', 'globolivros@globo.com',              'https://www.globolivros.com.br'),
('Editora Vozes',             '(24) 2233-9000', 'vozes@vozes.com.br',                 'https://www.vozes.com.br'),
('L&PM Editores',             '(51) 3225-5379', 'lpm@lpm.com.br',                     'https://www.lpm.com.br'),
('Planeta',                   '(11) 2108-2800', 'planeta@planeta.com.br',             'https://www.planeta.com.br'),
('Martins Fontes',            '(11) 3241-3677', 'martinsfontes@mf.com.br',            'https://www.martinsfontes.com.br'),
('Abril',                     '(11) 5087-2000', 'abril@abril.com.br',                 'https://www.abril.com.br'),
('FTD',                       '(11) 3034-0900', 'ftd@ftd.com.br',                     'https://www.ftd.com.br'),
('Ática',                     '(11) 3346-3401', 'atica@atica.com.br',                 'https://www.atica.com.br'),
('Saraiva',                   '(11) 3613-3000', 'saraiva@saraiva.com.br',             'https://www.saraiva.com.br'),
('Moderna',                   '(11) 2602-5510', 'moderna@moderna.com.br',             'https://www.moderna.com.br'),
('Scipione',                  '(11) 3346-3888', 'scipione@scipione.com.br',           'https://www.scipione.com.br'),
('Pearson',                   '(11) 4196-6000', 'pearson@pearson.com',                'https://www.pearson.com/br'),
('Campus/Elsevier',           '(21) 3970-9300', 'campus@elsevier.com',                'https://www.campus.com.br'),
('Bookman',                   '(51) 3027-7000', 'bookman@bookman.com.br',             'https://www.bookman.com.br'),
('Érica',                     '(11) 2898-9740', 'erica@editoraerica.com.br',          'https://www.editoraerica.com.br'),
('Novatec',                   '(11) 5585-1314', 'novatec@novatec.com.br',             'https://www.novatec.com.br'),
('Brasiliense',               '(11) 3392-3900', 'brasiliense@brasiliense.com.br',     'https://www.brasiliense.com.br'),
('Objetiva',                  '(21) 3804-4900', 'objetiva@objetiva.com.br',           'https://www.objetiva.com.br'),
('Darkside Books',            '(21) 3902-1700', 'darkside@darksidebooks.com.br',      'https://www.darksidebooks.com.br'),
('Aleph',                     '(11) 3214-1660', 'aleph@aleph.com.br',                 'https://www.aleph.com.br'),
('Belas-Letras',              '(11) 3213-9799', 'belasletras@belasletras.com.br',     'https://www.belasletras.com.br'),
('Penguin-Companhia',         '(11) 3707-3700', 'penguin@penguincompanhia.com.br',    'https://www.penguincompanhia.com.br'),
('Harper Collins Brasil',     '(11) 3895-0600', 'harpercollins@harpercollins.com.br','https://www.harpercollins.com.br'),
('Suma de Letras',            '(21) 2122-6200', 'suma@sumadeletras.com.br',           'https://www.sumadeletras.com.br'),
('Universo dos Livros',       '(11) 3872-3444', 'universo@universodoslivros.com.br',  'https://www.universodoslivros.com.br');
