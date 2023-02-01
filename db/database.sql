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

CREATE TABLE t_team (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

DESCRIBE t_user;
DESCRIBE t_team;

INSERT INTO t_user VALUES 
  (1, 'Joe', 'Tesla', 'tesla@gmail.com', '1234', 1),
  (2, 'Henry', 'Walker', 'walker@gmail.com', '1234', 1),
  (3, 'Sam', 'Smith', 'smith@gmail.com', '1234', 1),
  (4, 'Max', 'Alvaro', 'alvaro@gmail.com', '1234', 1);

INSERT INTO t_team VALUES 
  (2827, 'Academia Puerto Cabello'),
  (2817, 'Aragua'),
  (2810, 'Carabobo'),
  (2808, 'Caracas'),
  (2848, 'Deportivo La Guaira'),
  (2812, 'Deportivo Lara'),
  (2807, 'Deportivo Táchira'),
  (2818, 'Estudiantes de Mérida'),
  (2854, 'Hermanos Colmenárez'),
  (2825, 'Metropolitanos'),
  (2824, 'Mineros de Guayana'),
  (2811, 'Monagas'),
  (2814, 'Portuguesa'),
  (2840, 'UCV'),
  (2806, 'Zamora'),
  (2805, 'Zulia');

SELECT * FROM t_user;
SELECT * FROM t_team;

ALTER TABLE t_user MODIFY COLUMN columnName VARCHAR(500) DEFAULT NULL;

ALTER TABLE t_user ADD COLUMN columnName VARCHAR(500) DEFAULT NULL;

UPDATE t_user SER columnName = value WHERE id = value;
