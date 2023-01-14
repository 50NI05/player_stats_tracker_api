CREATE DATABASE IF NOT EXISTS testDB;

SHOW DATABASES;

USE testDB;

CREATE TABLE t_user (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(45) DEFAULT NULL,
  lastName VARCHAR(45) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  password VARCHAR(150) DEFAULT NULL,
  profile INT(100) DEFAULT 1,
  token VARCHAR(500) DEFAULT NULL
  PRIMARY KEY (id)
);

DESCRIBE t_user;

INSERT INTO t_user VALUES 
  (1, 'Joe', 'Tesla', 'tesla@gmail.com', '1234', 1),
  (2, 'Henry', 'Walker', 'walker@gmail.com', '1234', 1),
  (3, 'Sam', 'Smith', 'smith@gmail.com', '1234', 1),
  (4, 'Max', 'Alvaro', 'alvaro@gmail.com', '1234', 1);

ALTER TABLE t_user MODIFY COLUMN columnName VARCHAR(500) DEFAULT NULL;

ALTER TABLE t_user ADD COLUMN columnName VARCHAR(500) DEFAULT NULL;

UPDATE t_user SER columnName = value WHERE id = value;