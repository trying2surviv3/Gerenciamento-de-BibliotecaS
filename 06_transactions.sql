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