CREATE DATABASE IF NOT EXISTS testDB;

USE testDB;

CREATE TABLE t_user (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(45) DEFAULT NULL,
  lastName VARCHAR(45) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  password VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (id)
);

DESCRIBE t_user;

INSERT INTO t_user VALUES 
  (1, 'Joe', 'Tesla', 'tesla@gmail.com', '1234'),
  (2, 'Henry', 'Walker', 'walker@gmail.com', '1234'),
  (3, 'Sam', 'Smith', 'smith@gmail.com', '1234'),
  (4, 'Max', 'Alvaro', 'alvaro@gmail.com', '1234');

ALTER TABLE t_user
ADD COLUMN profile INT(10) DEFAULT NULL;