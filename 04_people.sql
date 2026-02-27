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