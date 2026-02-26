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
