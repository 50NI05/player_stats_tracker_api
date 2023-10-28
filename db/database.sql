CREATE DATABASE IF NOT EXISTS playerStatsTrackerDB;
SHOW TABLES FROM playerStatsTrackerDB;
RENAME TABLE squad TO t_squad;
drop table t_user;
SHOW DATABASES;
USE playerStatsTrackerDB;
CREATE TABLE t_user (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(45) DEFAULT NULL,
  lastName VARCHAR(45) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  password VARCHAR(150) DEFAULT NULL,
  token VARCHAR(600) DEFAULT NULL,
  id_profile int not null,
  foreign key (id_profile) references t_profile(id),
  PRIMARY KEY (id)
);
DESCRIBE t_user;
SELECT * FROM t_user;
ALTER TABLE t_user RENAME COLUMN lastName TO lastname;
ALTER TABLE t_user CHANGE profile id_profile int;

CREATE TABLE t_player (
	id INT(10) NOT NULL auto_increment,
    name varchar(50) default null,
    firstname VARCHAR(50) DEFAULT NULL,
	lastname VARCHAR(50) DEFAULT NULL,
    age int default null,
    birth datetime default null, 
    nationality varchar(50) default null,
    height varchar(10) default null,
    weight varchar(10) default null,
    photo varchar(100) default null,
    number int,
    id_statistic int,
    id_team int,
    foreign key (id_statistic) references t_statistic(id),
    foreign key (id_team) references t_team(id)
    PRIMARY KEY (id)
);

create table t_team (
	id int not null auto_increment,
    name varchar(50) default null,
    country varchar(50) default null,
    founded int default null,
    logo varchar(100) default null,
    PRIMARY KEY (id)
);

create table t_league (
	id int not null auto_increment,
    name varchar(50) default null,
    country varchar(50) default null,
    logo varchar(100) default null,
    season int default null,
    PRIMARY KEY (id)
);

create table t_game (
	id int not null auto_increment,
    appearences int default null,
    lineups int default null,
    minutes int default null,
    number int default null,
    position varchar(20) default null,
    rating int default null,
    captain boolean default false,
    PRIMARY KEY (id)
);

create table t_substitute (
	id int not null auto_increment,
    `in` int default null,
    `out` int default null,
    bench int default null,
    PRIMARY KEY (id)
);

create table t_shot (
	id int not null auto_increment,
	total int default null,
    `on` int default null,
    PRIMARY KEY (id)
);

create table t_goal (
	id int not null auto_increment,
	total int default null,
    conceded int default null,
    assists int default null,
    saves int default null,
    PRIMARY KEY (id)
);

create table t_passe (
	id int not null auto_increment,
	total int default null,
    `key` int default null,
    accuracy int default null,
    PRIMARY KEY (id)
);

create table t_tackle (
	id int not null auto_increment,
    total int default null,
    blocks int default null,
    interceptions int default null,
    PRIMARY KEY (id)
);

create table t_duel (
	id int not null auto_increment,
	total int default null,
    won int default null,
    PRIMARY KEY (id)
);

create table t_dribble (
	id int not null auto_increment,
    attempts int default null,
    success int default null,
    past int default null,
    PRIMARY KEY (id)
);

create table t_foul (
	id int not null auto_increment,
    drawn int default null,
    committed int default null,
    PRIMARY KEY (id)
);

create table t_card (
	id int not null auto_increment,
    yellow int default null,
    yellowred int default null,
    red int default null,
    PRIMARY KEY (id)
);

create table t_penalty (
	id int not null auto_increment,
    won int default null,
    committed int default null,
    scored int default null,
    missed int default null,
    saved int default null,
    PRIMARY KEY (id)
);

create table t_market_value (
	id int not null auto_increment,
    date datetime default null,
    market_value varchar(10) default null,
    market_value_currency varchar(10) default null,
    PRIMARY KEY (id)
);

create table t_statistic (
	id int not null auto_increment,
    id_team int,
    id_league int,
    id_game int,
	id_substitute int,
    id_shot int,
    id_goal int,
    id_passe int,
    id_tackle int,
	id_duel int,
    id_dribble int,
    id_foul int,
    id_card int,
    id_penalty int,
    id_market_value int,
    foreign key (id_team) references t_team(id),
    foreign key (id_league) references t_league(id),
    foreign key (id_game) references t_game(id),
    foreign key (id_substitute) references t_substitute(id),
    foreign key (id_shot) references t_shot(id),
    foreign key (id_goal) references t_goal(id),
    foreign key (id_passe) references t_passe(id),
    foreign key (id_tackle) references t_tackle(id),
    foreign key (id_duel) references t_duel(id),
    foreign key (id_dribble) references t_dribble(id),
    foreign key (id_foul) references t_foul(id),
    foreign key (id_card) references t_card(id),
    foreign key (id_penalty) references t_penalty(id),
    foreign key (id_market_value) references t_market_value(id),
    PRIMARY KEY (id)
);

-- create table t_squad (
-- 	id int not null auto_increment,
--     id_team int,
--     id_player int,
--     foreign key (id_team) references t_team(id),
--     foreign key (id_player) references t_player(id),
--     PRIMARY KEY (id)
-- );

create table t_profile (
	id int not null auto_increment,
    description varchar(20) default null,
    PRIMARY KEY (id)
);

INSERT INTO t_profile VALUES 
  (1, 'ADMINISTRATOR'),
  (2, 'USER');

INSERT INTO t_player VALUES 
-- CARACAS FC
	(1, 'A. Baroja', 'Alain', 'Baroja Méndez', 34, "1989-10-23", 'Venezuela', '183 cm', '81 kg', 'https://media-3.api-sports.io/football/players/52561.png', 1, 4),
	(2, 'F. Benítez', 'Frankarlos Cruz', 'Benítez Gutiérrez', 19, "2004-05-03", 'Venezuela', '184 cm', '70 kg', 'https://media-1.api-sports.io/football/players/354028.png', 2, 4),
    (3, "W. Hernández", "Wilbert Miguel", "Hernández Torrealba", 22, "2001-03-02", "Venezuela", "185 cm", "82 kg", "https://media-1.api-sports.io/football/players/52563.png", 3, 4),
    (4, "S Moises", "Salvador Moises", "Bolívar Hernandez", 17, null, "Venezuela", null, null, "https://media-3.api-sports.io/football/players/356129.png", 4, 4),
    (5, "D. Luna", "Diego Alfonzo", "Luna Flores", 23, "2000-01-02", "Venezuela", "184 cm", "81 kg", "https://media-3.api-sports.io/football/players/52659.png", 5, 4),
    (6, "D. Rivillo", "Daniel Alejandro", "Rivillo Godoy", 27, "1996-12-21", "Venezuela", "178 cm", "71 kg", "https://media-2.api-sports.io/football/players/53143.png", 6, 4),
    (7, "R. Quijada", "Rubert José", "Quijada Fasciana", 34, "1989-02-10", "Venezuela", "186 cm", "73 kg", "https://media-2.api-sports.io/football/players/52572.png", 7, 4),
    (8, "Ronaldo Rivas", "Ronaldo David", "Rivas Vielma", 24, "1999-10-31", "Venezuela", "184 cm", "78 kg", "https://media-1.api-sports.io/football/players/52822.png", 8, 4),
    (9, "R. Manríque", "Roger Alexander", "Manríque Laorca", 27, "1999-03-23", "Venezuela", "181 cm", "70 kg", "https://media-1.api-sports.io/football/players/52455.png", 9, 4),
    (10, "A. González", "Alexander David", "González Sibulo", 31, "1992-09-13", "Venezuela", "185 cm", "75 kg", "https://media-2.api-sports.io/football/players/2441.png", 10, 4),
    (11, "B. Tamayo", "Bianneider Nauj", "Tamayo Escalona", 18, "2005-01-13", "Venezuela", "185 cm", "82 kg", "https://media-1.api-sports.io/football/players/354030.png", 11, 4),
    (12, "Renné Rivas", "Renné Alejandro", "Rivas Alezones", 20, "2003-03-21", "Venezuela", "178 cm", "78 kg", "https://media-2.api-sports.io/football/players/137620.png", 12, 4);
    (13, "L. Casiani", "Luis Fernando", "Casiani Zúñiga", 22, "2001-07-20", "Venezuela", "181 cm", "73 kg", "https://media-2.api-sports.io/football/players/52566.png", 13, 4)
    (14, "G. Guzmán", "Guillermo Andrés", "Guzmán Cones", 21, "2002-03-27", "Venezuela", "185 cm", "89 kg", "https://media-1.api-sports.io/football/players/354029.png", 14, 4)
    (15, "L. Flores", "Leonardo José", "Flores Soto", 28, "1995-08-05", "Venezuela", "176 cm", "69 kg", "https://media-3.api-sports.io/football/players/52584.png", 15, 4)
    (16, "B. Ortega", "Bryant Jesús", "Ortega Carmona", 20, "2003-02-28", "Venezuela", "175 cm", "63 kg", "https://media-2.api-sports.io/football/players/330240.png", 16, 4)
    (17, "A. Contreras", "Anderson Rafael", "Contreras Pérez", 22, "2001-03-30", "Venezuela", "177 cm", "64 kg", "https://media-1.api-sports.io/football/players/52581.png", 17, 4)
    (18, "V. Rodríguez", "Vicente Bautista", "Rodríguez Cedeño", 29, "1994-11-13", "Venezuela", "177 cm", "71 kg", "https://media-2.api-sports.io/football/players/53001.png", 18, 4)
    (19, "E. Rivas", "Edson Armando", "Rivas Vielma", 22, "2001-10-23", "Venezuela", "192 cm", "83 kg", "https://media-2.api-sports.io/football/players/52841.png", 19, 4)
    (20, "Y. Ramos", "Yair Alexander", "Ramos Perez", 18, "2005-10-13", "Venezuela", "181 cm", "71 kg", "https://media-3.api-sports.io/football/players/353992.png", 20, 4)
    (21, "D. Padilla", "Daniel Alejandro", "Padilla Franco", 18, "2005-02-26", "Venezuela", "170 cm", "60 kg", "https://media-2.api-sports.io/football/players/353993.png", 21, 4)
    (22, "J. Carielez", "José Raúl", "Carielez Berroterán", 18, null, "Venezuela", null, null, "https://media-3.api-sports.io/football/players/363113.png", 22, 4)
    (23, "W. Correa", null, null, 17, null, "Venezuela", null, null, "https://media-1.api-sports.io/football/players/425135.png", 23, 4)
    (24, "S. Rodríguez", "Santiago Alfonzo", "Rodríguez Pacheco", 22, "2001-01-29", "Venezuela", "172 cm", "58 kg", "https://media-1.api-sports.io/football/players/52601.png", 24, 4)
    (25, "R. Celis", "Richard Enrique", "Celis Sánchez", 27, "1996-04-23", "Venezuela", "177 cm", "74 kg", "https://media-2.api-sports.io/football/players/52594.png", 25, 4)
    (26, "A. Oguns", "Ade", "Oguns", 22, "2001-04-14", "Nigeria", "179 cm", "81 kg", "https://media-2.api-sports.io/football/players/298033.png", 26, 4)
    (27, "E. Mercado", "Emanuel", "Mercado", 26, "1997-04-21", "Argentina", "184 cm", "76 kg", "https://media-3.api-sports.io/football/players/196746.png", 27, 4)
    (28, "S. Guarirapa", "Saúl Alejandro", "Guarirapa Briceño", 21, "2002-10-18", "Venezuela", "187 cm", "78 kg", "https://media-1.api-sports.io/football/players/157992.png", 28, 4)
    (29, "B. Albizo", "Bryant Alfredo", "Albizo Vivas", 20, "2003-05-05", "Venezuela", "170 cm", "58 kg", "https://media-1.api-sports.io/football/players/353994.png" 29, 4)
    (30, "M. Sulbarán", "Manuel Alejandro", "Sulbarán Solano", 21, "2002-10-08", "Venezuela", "165 cm", "59 kg", "https://media-1.api-sports.io/football/players/304611.png", 30, 4)
    (31, "N. Jiménez", "Néstor Andrés", "Jiménez Ramírez", 20, "2003-04-08", "Venezuela", "175 cm", "66 kg", "https://media-2.api-sports.io/football/players/316822.png", 31, 4)
    (32, "C. Egbutudike", "Christian Mmaduka", "Egbutudike", 20, "2003-07-28", "Nigeria", "178 cm", "78 kg", "https://media-1.api-sports.io/football/players/374543.png", 32, 4)
    (33, "A. Rivas", "Armando José", "Rivas Zambrano", 20, "2003-01-03", "Venezuela", "172 cm", "62 kg", "https://media-1.api-sports.io/football/players/317413.png", 33, 4)
    (34, "L. Urbina", "Luis Elías", "Urbina Criollo", 21, "2002-03-12", "Venezuela", "169 cm", "70 kg", "https://media-2.api-sports.io/football/players/286360.png", 34, 4)
    (35, "E. Echenique", "Ender Jesús", "Echenique Peña", 19, "2004-04-02", "Venezuela", "167 cm", "61 kg", "https://media-2.api-sports.io/football/players/288468.png", 35, 4)

-- PUERTO CABELLO
    (36, "M. Silva", "Miguel Alejandro", "Silva Jaimes", 23, "2000-07-09", "Venezuela", "182 cm", "79 kg", "https://media-3.api-sports.io/football/players/52915.png", 36, 1),
    (37, "L. Romero", "Luis Enrique", "Romero Durán", 33, "1990-11-16", "Venezuela", "187 cm", "84 kg", "https://media-1.api-sports.io/football/players/52952.png", 37, 1)
    (38, "P. Fulco", "Pedro José", "Fulco Rangel", 18, "2005-01-26", "Venezuela", "180 cm", "76 kg", "https://media-2.api-sports.io/football/players/410435.png", 38, 1)
    (39, "D. Gil", "Diego Javier", "Gil Malavé", 22, "2001-09-25", "Venezuela", "179 cm", "71 kg", "https://media-2.api-sports.io/football/players/266015.png", 39, 1)
    (40, "J. Rodríguez", "Joaquín Alfons", "Rodríguez Pfeiffer", 20, "2003-04-14", "Venezuela", "186 cm", "79 kg", "https://media-2.api-sports.io/football/players/290652.png", 40, 1)
    (41, "S. Gómez", "Santiago Andrés", "Gómez Santana", 20, "2003-05-18", "Venezuela", "185 cm", "76 kg", "https://media-3.api-sports.io/football/players/308470.png", 41, 1)
    (42, "D. Osio", "Diego Andrés", "Osio Valencia", 26, "1997-01-03", "Venezuela", "192 cm", "79 kg", "https://media-1.api-sports.io/football/players/52537.png", 42, 1)
    (43, "C. Rivero", "Carlos Gregorio", "Rivero González", 31, "1992-11-27", "Venezuela", "179 cm", "80 kg", "https://media-1.api-sports.io/football/players/52959.png", 43, 1)
    (44, "E. Peraza", "Edwin De Jesús", "Peraza Larez", 30, "1993-03-11", "Venezuela", "183 cm", "78 kg", "https://media-3.api-sports.io/football/players/52662.png", 44, 1)
    (45, "J. González", "José Gabriel", "González Malavé", 21, "2002-09-21", "Venezuela", "191 cm", "78 kg", "https://media-1.api-sports.io/football/players/284920.png", 45, 1)
    (46, "K. De La Hoz", "Kevin Eduardo", "De La Hoz Morys", 25, "1998-07-15", "Venezuela", "172 cm", "74 kg", "https://media-3.api-sports.io/football/players/53096.png", 46, 1)
    (47, "R. Guerrero", "Raudy Javier", "Guerrero Reyes", 30, "1993-11-19", "Venezuela", "166 cm", "60 kg", "https://media-2.api-sports.io/football/players/52421.png", 47, 1)
    (48, "H. Linares", "Heiber Eduardo", "Linares Martínez", 23, "2000-07-24", "Venezuela", "174 cm", "69 kg", "https://media-1.api-sports.io/football/players/265934.png", 48, 1)
    (49, "J. Granados", "José Luis", "Granados Asprilla", 37, "1986-10-22", "Venezuela", "181 cm", "73 kg", "https://media-1.api-sports.io/football/players/52955.png", 49, 1)
    (50, "J. Adebanjo", "Jacob Olorunwa", "Adebanjo", 30, "1993-09-05", "Nigeria", "184 cm", "78 kg", "https://media-3.api-sports.io/football/players/104410.png", 50, 1)
    (51, "J. Cáceres", "Joel Fernando", "Cáceres Álvarez", 30, "1993-02-15", "Venezuela", "178 cm", "62 kg", "https://media-2.api-sports.io/football/players/52775.png", 51, 1)
    (52, "E. Fereira", "Eduardo Enrique", "Fereira Peñaranda", 20, "2000-09-20", "Venezuela", "196 cm", "63 kg", "https://media-3.api-sports.io/football/players/52568.png", 52, 1)
    (53, "R. Hidalgo", "Rai José", "Hidalgo Rodríguez", 17, "2006-02-14", "Venezuela", "170 cm", "66 kg", "https://media-2.api-sports.io/football/players/410436.png", 53, 1)
    (54, "S. Notaroberto", "Sandro", "Notaroberto Peci", 25, "1998-03-10", "Venezuela", "183 cm", "75 kg", "https://media-3.api-sports.io/football/players/52661.png", 54, 1)
    (55, "K. Silva", "Kendrys Jesús", "Silva Guzmán", 30, "1993-12-17", "Venezuela", "179 cm", "75 kg", "https://media-3.api-sports.io/football/players/52678.png", 55, 1)
    (56, "H. Alcalá", "Henrys Junior", "Alcalá Cedeño", 32, "1991-07-25", "Venezuela", "176 cm", "73 kg", "https://media-1.api-sports.io/football/players/52106.png", 56, 1)
    (57, "W. Lugo", "Williams José", "Lugo Ladera", 27, "1996-12-16", "Venezuela", "176 cm", "70 kg", "https://media-2.api-sports.io/football/players/53036.png", 57, 1)
    (58, "L. Hernández", "Luifer Enrique", "Hernández Quintero", 22, "2001-04-28", "Venezuela", "181 cm", "73 kg", "https://media-3.api-sports.io/football/players/52430.png", 58, 1)
    (59, "A. Montero", "Andrés Eduardo", "Montero Cadenas", 29, "1994-03-05", "Venezuela", "175 cm", "61 kg", "https://media-3.api-sports.io/football/players/52754.png", 59, 1)
    (60, "C. Montaña", "Christopher Alexander", "Montaña Rivas", 24, "1999-01-03", "Venezuela", "173 cm", "68 kg", "https://media-1.api-sports.io/football/players/52547.png", 60, 1)
    (61, "G. Padrón", "Gerardo José", "Padrón Colmenares", 21, "2002-10-31", "Venezuela", "159 cm", "51 kg", "https://media-3.api-sports.io/football/players/266017.png", 61, 1)
    (62, "J. Colina", "Juan Carlos", "Colina Silva", 37, "1986-10-21", "Venezuela", "170 cm", "76 kg", "https://media-1.api-sports.io/football/players/52747.png", 62, 1)
    (63, "J. Cantillo", "Jesús Alberto", "Cantillo Mejía", 19, "2004-01-02", "Venezuela", "183 cm", "76 kg", "https://media-2.api-sports.io/football/players/410437.png", 63, 1)
    (64, "G. Ayine", "George Ayimbire", "Ayine", 25, "1998-12-03", "Ghana", "173 cm", "69 kg", "https://media-2.api-sports.io/football/players/141982.png", 64, 1)
    (65, "G. Zuma", "Gideon", "Iliya Zuma", 24, "1999-06-12", "Nigeria", "173 cm", null, "https://media-2.api-sports.io/football/players/196571.png", 65, 1)
    (66, "A. Bahachille", "Abraham", "Bahachille García", 22, "2001-03-08", "Venezuela", "193 cm", "84 kg", "https://media-2.api-sports.io/football/players/52925.png", 66, 1)
    (67, "M. Lacava", "Matías Rafael", "Lacava González", 21, "2002-10-24", "Venezuela", "167 cm", "62 kg", "https://media-1.api-sports.io/football/players/126665.png", 67, 1)
    (68, "L. Maestre", "Luis Alfredo", "Maestre Niño", 18, "2005-05-11", "Venezuela", "178 cm", "78 kg", "https://media-1.api-sports.io/football/players/395904.png", 68, 1)
    (69, "G. Monjes", "Gabriel Alberto", "Monjes Bordones", 19, "2004-12-02", "Venezuela", "179 cm", "67 kg", "https://media-2.api-sports.io/football/players/361666.png", 69, 1)
    (70, "P. Pagnano", "Pierangelo José", "Pagnano Malavé", 22, "2001-08-28", "Venezuela", "178 cm", "72 kg", "https://media-1.api-sports.io/football/players/146662.png", 70, 1)
    (71, "J. Reyes", "José Juan", "Reyes Ramos", 19, "2004-12-02", "Venezuela", "178 cm", "73 kg", "https://media-2.api-sports.io/football/players/314436.png", 71, 1)
    (72, "D. Pérez", "Danny Marcos", "Pérez Valdez", 23, "2000-01-23", "Venezuela", "175 cm", "71 kg", "https://media-2.api-sports.io/football/players/11683.png", 72, 1)
    (73, "R. Figueroa", "Richard José", "Figueroa Avilés", 27, "1996-08-04", "Venezuela", "173 cm", "68 kg", "https://media-3.api-sports.io/football/players/52724.png", 73, 1)
    (74, "A. Stephens", "Alfredo Horacio", "Stephens Francis", 29, "1994-12-25", "Panamá", "181 cm", "77 kg", "https://media-2.api-sports.io/football/players/41225.png", 74, 1)
    (75, "W. González", "Wilmar Darío", "González Aguinaga", 29, "1994-01-26", "Colombia", "178 cm", "67 kg", "https://media-2.api-sports.io/football/players/79309.png", 75, 1)
    (76, "J. Arape", "Javier Enrique","Arape Quevedo", 22, "2001-06-05", "Venezuela", "165 cm", "61 kg", "https://media-1.api-sports.io/football/players/52440.png", 76, 1)
    (77, "M. Díaz", "Marlon Alberto", "Díaz Rodríguez", 19, "2004-01-12", "Venezuela", "177 cm", "64 kg", "https://media-2.api-sports.io/football/players/410438.png", 77, 1)
    (78, "G. Fermín", "Gabriel Enrique", "Fermín Ávila", 21, "2002-12-13", "Venezuela", "187 cm", "83 kg", "https://media-3.api-sports.io/football/players/199720.png", 78, 1)
    (79, "Y. Montero", "Yeangel Emilio", "Montero Manzano", 25, "1998-12-25", "Venezuela", "179 cm", "78 kg", "https://media-3.api-sports.io/football/players/52519.png", 79, 1)
    (80, "S. Okitokandjo", "Stevy", "Okitokandjo", 29, "1994-06-18", "Países Bajos", "184 cm", "82 kg", "https://media-2.api-sports.io/football/players/96438.png", 80, 1)

-- ANGOSTURA FC
    (81, "H. Pérez", "Héctor Eduardo", "Pérez Cuevas", 32, "1991-06-16", "Venezuela", "185 cm", "70 kg", "https://media-1.api-sports.io/football/players/52449.png", 81, 2)
    (82, "R. Gutierrez", "Reyes", "Gutierrez", 16, "2007-06-20", "Venezuela", null, null, "https://media-3.api-sports.io/football/players/424361.png", 82, 2)

INSERT INTO t_team VALUES 
    (1, 'Puerto Cabello', 'Venezuela', 2014, 'https://media-2.api-sports.io/football/teams/2827.png'),
    (2, 'Angostura FC', 'Venezuela', null, "https://media-3.api-sports.io/football/teams/2838.png"),
    (3, 'Carabobo FC', 'Venezuela', 1997, 'https://media-1.api-sports.io/football/teams/2810.png'),
    (4, 'Caracas FC', 'Venezuela', 1967, 'https://media-1.api-sports.io/football/teams/2808.png'),
    (5, 'Deportivo La Guaira', 'Venezuela', null, null),
    (6, 'Rayo Zuliano', 'Venezuela', null, 'https://media-3.api-sports.io/football/teams/16847.png'),
    (7, 'Deportivo Táchira FC', 'Venezuela', 1974, 'https://media-2.api-sports.io/football/teams/2807.png'),
    (8, 'Estudiantes de Mérida FC', 'Venezuela', 1971, 'https://media-3.api-sports.io/football/teams/2818.png'),
    (9, 'CD Hermanos Colmenárez', 'Venezuela', 2015, 'https://media-3.api-sports.io/football/teams/2854.png'),
    (10, 'Metropolitanos FC', 'Venezuela', 2011, 'https://media-3.api-sports.io/football/teams/2825.png'),
    (11, 'Mineros de Guayana', 'Venezuela', 1981, 'https://media-1.api-sports.io/football/teams/2824.png'),
    (12, 'Monagas SC', 'Venezuela', 1987, 'https://media-2.api-sports.io/football/teams/2811.png'),
    (13, 'Portuguesa FC', 'Venezuela', 1972, 'https://media-1.api-sports.io/football/teams/2814.png'),
    (14, 'UCV FC', 'Venezuela', 1950, 'https://media-1.api-sports.io/football/teams/2840.png'),
    (15, 'Zamora FC', 'Venezuela', 1977, 'https://media-3.api-sports.io/football/teams/2806.png');

INSERT INTO t_league VALUES 
	(1, "Primera División", "Venezuela", "https://media-2.api-sports.io/football/leagues/299.png", 2023));
    
INSERT INTO t_game VALUES 
-- CARACAS FC
	(1, 0, 0, 0, null, "Goalkeeper", null, false), (2, 1, 1, 90, null, "Goalkeeper", null, false), (3, 0, 0, 0, null, "Goalkeeper", null, false),
    (4, 0, 0, 0, null, "Goalkeeper", null, false), (5, 12, 10, 953, null, "Defender", null, false), (6, 13, 9, 883, null, "Defender", null, false), 
    (7, 10, 10, 956, null, "Defender", null, false),  (8, 7, 5, 472, null, "Defender", null, false), (9, 10, 10, 852, null, "Defender", null, false),
    (10, 8, 7, 511, null, "Defender", null, false), (11, 0, 0, 0, null, "Defender", null, false), (12, 10, 7, 708, null, "Defender", null, false),
    (13, 3, 1, 43, null, "Defender", null, false), (14, 0, 0, 0, null, "Defender", null, false), (15, 11, 11, 874, null, "Midfielder", null, false),
    (16, 12, 9, 842, null, "Midfielder", null, false), (17, 9, 4, 335, null, "Midfielder", null, false), (18, 11, 5, 542, null, "Midfielder", null, false),
    (19, 8, 0, 121, null, "Midfielder", null, false), (20, 0, 0, 0, null, "Midfielder", null, false) (21, 0, 0, 0, null, "Midfielder", null, false),
    (22, 0, 0, 0, null, "Midfielder", null, false), (23, 0, 0, 0, null, "Midfielder", null, false), (24, 13, 8, 682, null, "Midfielder", null, false),
    (25, 12, 11, 794, null, "Attacker", null, false), (26, 13, 9, 791, null, "Attacker", null, false), (27, 6, 4, 224, null, "Attacker", null, false),
    (28, 13, 13, 1136, null, "Attacker", null, false), (29, 0, 0, 0, null, "Attacker", null, false), (30, 10, 3, 375, null, "Attacker", null, false),
    (31, 3, 2, 102, null, "Attacker", null, false), (32, 0, 0, 0, null, "Attacker", null, false), (33, 0, 0, 0, null, "Attacker", null, false),
    (34, 5, 0, 84, null, "Attacker", null, false), (35, 7, 2, 276, null, "Attacker", null, false),

-- PUERTO CABELLO
    (36, 0, 0, 0, null, "Goalkeeper", null, false), (37, 15, 15, 1350, null, "Goalkeeper", null, false), (38, null, null, null, null, "Goalkeeper", null, false),
    (39, null, null, null, null, "Goalkeeper", null, false), (40, null, null, null, null, "Goalkeeper", null, false), (41, 2, 2, 92, null, "Defender", null, false),
    (42, 10, 5, 591, null, "Defender", null, false),  (43, 14, 13, 1168, null, "Defender", null, false),  (44, 12, 12, 958, null, "Defender", null, false),
    (45, 0, 0, 0, null, "Defender", null, false), (46, 9, 7, 674, null, "Defender", null, false), (47, 14, 12, 890, null, "Defender", null, false),
    (48, 0, 0, 0, null, "Defender", null, false), (49, 12, 12, 1005, null, "Defender", null, false), (50, 6, 3, 348, null, "Defender", null, false),
    (51, null, null, null, null, "Defender", null, false), (52, 1, 1, 90, null, "Defender", null, false), (53, null, null, null, null, "Defender", null, false),
    (54, null, null, null, null, "Defender", null, false), (55, 5, 5, 406, null, "Midfielder", null, false), (56, 14, 12, 916, null, "Midfielder", null, false),
    (57, 15, 11, 950, null, "Midfielder", null, false), (58, 13, 11, 918, null, "Midfielder", null, false), (59, 6, 3, 240, null, "Midfielder", null, false)
    (60, 3, 0, 31, null, "Midfielder", null, false), (61, 4, 0, 33, null, "Midfielder", null, false), (62, 9, 3, 381, null, "Midfielder", null, false),
    (63, 1, 0, 0, null, "Midfielder", null, false), (64, 13, 4, 437, null, "Midfielder", null, false), (65, 10, 10, 738, null, "Midfielder", null, false),
    (66, 1, 2, 21, null, "Midfielder", null, false), (67, null, null, null, null, "Midfielder", null, false), (68, null, null, null, null, "Midfielder", null, false),
    (69, null, null, null, null, "Midfielder", null, false), (70, null, null, null, null, "Midfielder", null, false), (71, null, null, null, null, "Midfielder", null, false),
    (72, 15, 13, 1102, null, "Attacker", null, false), (73, 14, 3, 474, null, "Attacker", null, false), (74, 13, 6, 718, null, "Attacker", null, false),
    (75, 2, 0, 32, null, "Attacker", null, false), (76, null, null, null, null, "Attacker", null, false), (77, null, null, null, null, "Attacker", null, false),
    (78, 0, 0, 0, null, "Attacker", null, false), (79, 1, 0, 21, null, "Attacker", null, false), (80, null, null, null, null, "Attacker", null, false),

-- ANGOSTURA FC
    (81, 14, 14, 1260, null, "Goalkeeper", null, false),
    (82, 0, 0, 0, null, "Goalkeeper", null, false),
    (3, 0, 0, 0, null, "Goalkeeper", null, false),
    (4, 0, 0, 0, null, "Goalkeeper", null, false),
    (5, 12, 10, 953, null, "Defender", null, false),
    (6, 13, 9, 883, null, "Defender", null, false), 
    (7, 10, 10, 956, null, "Defender", null, false), 
    (8, 7, 5, 472, null, "Defender", null, false),
    (9, 10, 10, 852, null, "Defender", null, false),
    (10, 8, 7, 511, null, "Defender", null, false),
    (11, 0, 0, 0, null, "Defender", null, false),
    (12, 10, 7, 708, null, "Defender", null, false),
    (13, 3, 1, 43, null, "Defender", null, false),
    (14, 0, 0, 0, null, "Defender", null, false),
    (15, 11, 11, 874, null, "Midfielder", null, false),
    (16, 12, 9, 842, null, "Midfielder", null, false),
    (17, 9, 4, 335, null, "Midfielder", null, false),
    (18, 11, 5, 542, null, "Midfielder", null, false),
    (19, 8, 0, 121, null, "Midfielder", null, false),
    (20, 0, 0, 0, null, "Midfielder", null, false)
    (21, 0, 0, 0, null, "Midfielder", null, false),
    (22, 0, 0, 0, null, "Midfielder", null, false),
    (23, 0, 0, 0, null, "Midfielder", null, false),
    (24, 13, 8, 682, null, "Midfielder", null, false),
    (25, 12, 11, 794, null, "Attacker", null, false),
    (26, 13, 9, 791, null, "Attacker", null, false),
    (27, 6, 4, 224, null, "Attacker", null, false),
    (28, 13, 13, 1136, null, "Attacker", null, false),
    (29, 0, 0, 0, null, "Attacker", null, false),
    (30, 10, 3, 375, null, "Attacker", null, false),
    (31, 3, 2, 102, null, "Attacker", null, false),
    (32, 0, 0, 0, null, "Attacker", null, false),
    (33, 0, 0, 0, null, "Attacker", null, false),
    (34, 5, 0, 84, null, "Attacker", null, false),
    (35, 7, 2, 276, null, "Attacker", null, false);


    
insert into t_substitute values
-- CARACAS FC
	(1, 0, 0, 0), (2, 0, 0, 0), (3, 0, 0, 14), (4, 0, 0, 0), (5, 2, 0, 4), (6, 4, 4, 4), (7, 0, 2, 1), (8, 2, 0, 3), (9, 0, 1, 1), (10, 1, 6, 1),
    (11, 0, 0, 10), (12, 3, 0, 4), (13, 2, 1, 7), (14, 0, 0, 12), (15, 0, 6, 1), (16, 3, 2, 3), (17, 5, 4, 10), (18, 6, 3, 9), (19, 8, 0, 12), (20, 0, 0, 1),
    (21, 0, 0, 6), (22, 0, 0, 0), (23, 0, 0, 0), (24, 5, 8, 5), (25, 1, 11, 1), (26, 4, 8, 4), (27, 2, 3, 8), (28, 0, 3, 0), (29, 0, 0, 2), (30, 7, 3, 9),
    (31, 1, 2, 8), (32, 0, 0, 0), (33, 0, 0, 2), (34, 5, 0, 11), (35, 5, 2, 5);

-- PUERTO CABELLO
    (36, 0, 0, 15), (37, 0, 0, 0), (38, null, null, null), (39, null, null, null), (40, null, null, null), (41, 0, 2, 8), (42, 5, 0, 10), (43, 1, 1, 1),
    (44, 0, 3, 1), (45, 0, 0, 14), (46, 2, 1, 8), (47, 2, 10, 3), (48, 0, 0, 1), (49, 0, 2, 0), (50, 3, 1, 11), (51, null, null, null), (52, 0, 0, 0),
    (53, null, null, null), (54, null, null, null), (55, 0, 1, 0), (56, 2, 10, 3), (57, 4, 6, 4), (58, 2, 8, 3), (59, 3, 3, 9), (60, 3, 0, 11), (61, 4, 0, 15),
    (62, 6, 2, 10), (63, 1, 0, 1), (64, 9, 3, 11), (65, 0, 6, 2), (66, 1, 0, 1), (67, null, null, null), (68, null, null, null), (69, null, null, null),
    (70, null, null, null), (71, null, null, null), (72, 2, 9, 2), (73, 11, 1, 12), (74, 7, 4, 8), (75, 2, 0, 3), (76, null, null, null),
    (77, null, null, null), (78, 0, 0, 1), (79, 1, 0, 1), (80, null, null, null);

-- ANGOSTURA FC 
    (81, 0, 0, 0),
    (82, 0, 0, 2),
    (3, 0, 0, 14),
    (4, 0, 0, 0),
    (5, 2, 0, 4),
    (6, 4, 4, 4),
    (7, 0, 2, 1),
    (8, 2, 0, 3),
    (9, 0, 1, 1),
    (10, 1, 6, 1),
    (11, 0, 0, 10),
    (12, 3, 0, 4),
    (13, 2, 1, 7),
    (14, 0, 0, 12),
    (15, 0, 6, 1),
    (16, 3, 2, 3),
    (17, 5, 4, 10),
    (18, 6, 3, 9),
    (19, 8, 0, 12),
    (20, 0, 0, 1),
    (21, 0, 0, 6),
    (22, 0, 0, 0),
    (23, 0, 0, 0),
    (24, 5, 8, 5),
    (25, 1, 11, 1),
    (26, 4, 8, 4),
    (27, 2, 3, 8),
    (28, 0, 3, 0),
    (29, 0, 0, 2),
    (30, 7, 3, 9),
    (31, 1, 2, 8),
    (32, 0, 0, 0),
    (33, 0, 0, 2),
    (34, 5, 0, 11),
    (35, 5, 2, 5);


    
insert into t_shot values 
-- CARACAS FC
	(1, null, null), (2, null, null), (3, null, null), (4, null, null), (5, null, null), (6, null, null), (7, null, null),  (8, null, null), (9, null, null),
    (10, null, null), (11, null, null), (12, null, null), (13, null, null), (14, null, null), (15, null, null), (16, null, null), (17, null, null),
    (18, null, null),(19, null, null), (20, null, null), (21, null, null), (22, null, null), (23, null, null), (24, null, null), (25, null, null), (26, null, null),
    (27, null, null), (28, null, null), (29, null, null), (30, null, null), (31, null, null), (32, null, null), (33, null, null), (34, null, null), (35, null, null);

-- PUERTO CABELLO
    (36, null, null), (37, null, null), (38, null, null),(39, null, null),(40, null, null),(41, null, null),(42, null, null), (43, null, null),(44, null, null),
    (45, null, null),(46, null, null),(47, null, null),(48, null, null),(49, null, null),(50, null, null),(51, null, null),(52, null, null),(53, null, null),
    (54, null, null),(55, null, null),(56, null, null),(57, null, null),(58, null, null),(59, null, null),(60, null, null),(61, null, null),(62, null, null),
    (63, null, null),(64, null, null),(65, null, null),(66, null, null),(67, null, null),(68, null, null),(69, null, null),(70, null, null),(71, null, null),
    (72, null, null),(73, null, null),(74, null, null),(75, null, null),(76, null, null),(77, null, null),(78, null, null),(79, null, null),(80, null, null);
    
-- ANGOSTURA FC
    (81, null, null),
    (82, null, null),
    (3, null, null),
    (4, null, null),
    (5, null, null),
    (6, null, null),
    (7, null, null), 
    (8, null, null),
    (9, null, null),
    (10, null, null),
    (11, null, null),
    (12, null, null),
    (13, null, null),
    (14, null, null),
    (15, null, null),
    (16, null, null),
    (17, null, null),
    (18, null, null),
    (19, null, null),
    (20, null, null),
    (21, null, null),
    (22, null, null),
    (23, null, null),
    (24, null, null),
    (25, null, null),
    (26, null, null),
    (27, null, null),
    (28, null, null),
    (29, null, null),
    (30, null, null),
    (31, null, null),
    (32, null, null),
    (33, null, null),
    (34, null, null),
    (35, null, null);



insert into t_goal values
-- CARACAS FC
	(1, 0, null, null, null),(2, 0, null, null, null),(3, 0, null, null, null),(4, 0, null, null, null),(5, 0, null, null, null),(6, 0, null, null, null),
    (7, 2, null, null, null),(8, 1, null, null, null),(9, 0, null, null, null),(10, 0, null, null, null),(11, 0, null, null, null),(12, 0, null, null, null),
    (13, 0, null, null, null),(14, 0, null, null, null),(15, 0, null, null, null),(16, 0, null, null, null),(17, 0, null, null, null),(18, 0, null, null, null),
    (19, 1, null, null, null),(20, 0, null, null, null),(21, 0, null, null, null),(22, 0, null, null, null),(23, 0, null, null, null),(24, 2, null, null, null),
    (25, 2, null, null, null),(26, 5, null, null, null),(27, 1, null, null, null),(28, 6, null, null, null),(29, 0, null, null, null),(30, 1, null, null, null),
    (31, 1, null, null, null),(32, 0, null, null, null),(33, 0, null, null, null),(34, 0, null, null, null),(35, 1, null, null, null);

-- PUERTO CABELLO
    (36, 0, null, null, null),(37, 0, null, null, null),(38, null, null, null, null),(39, null, null, null, null),(40, null, null, null, null),
    (41, 0, null, null, null),(42, 1, null, null, null),(43, 0, null, null, null),(44, 1, null, null, null),(45, 0, null, null, null),(46, 0, null, null, null),
    (47, 1, null, null, null),(48, 0, null, null, null),(49, 0, null, null, null),(50, 1, null, null, null),(51, null, null, null, null),(52, 0, null, null, null),
    (53, null, null, null, null),(54, null, null, null, null),(55, 1, null, null, null),(56, 0, null, null, null),(57, 2, null, null, null),(58, 8, null, null, null),
    (59, 0, null, null, null),(60, 0, null, null, null),(61, 0, null, null, null),(62, 0, null, null, null),(63, 0, null, null, null),(64, 1, null, null, null),
    (65, 1, null, null, null),(66, 0, null, null, null),(67, null, null, null, null),(68, null, null, null, null),(69, null, null, null, null),
    (70, null, null, null, null),(71, null, null, null, null)(72, 5, null, null, null),(73, 0, null, null, null),(74, 4, null, null, null),(75, 1, null, null, null),
    (76, null, null, null, null),(77, null, null, null, null),(78, 0, null, null, null),(79, 0, null, null, null),(80, null, null, null, null);
    
-- ANGOSTURA FC
    (81, 0, null, null, null),
    (82, 0, null, null, null),
    (3, 0, null, null, null),
    (4, 0, null, null, null),
    (5, 0, null, null, null),
    (6, 0, null, null, null),
    (7, 2, null, null, null),
    (8, 1, null, null, null),
    (9, 0, null, null, null),
    (10, 0, null, null, null),
    (11, 0, null, null, null),
    (12, 0, null, null, null),
    (13, 0, null, null, null),
    (14, 0, null, null, null),
    (15, 0, null, null, null),
    (16, 0, null, null, null),
    (17, 0, null, null, null),
    (18, 0, null, null, null),
    (19, 1, null, null, null),
    (20, 0, null, null, null),
    (21, 0, null, null, null),
    (22, 0, null, null, null),
    (23, 0, null, null, null),
    (24, 2, null, null, null),
    (25, 2, null, null, null),
    (26, 5, null, null, null),
    (27, 1, null, null, null),
    (28, 6, null, null, null),
    (29, 0, null, null, null),
    (30, 1, null, null, null),
    (31, 1, null, null, null),
    (32, 0, null, null, null),
    (33, 0, null, null, null),
    (34, 0, null, null, null),
    (35, 1, null, null, null);



insert into t_passe values
-- CARACAS FC
	(1, null, null, null),(2, null, null, null),(3, null, null, null),(4, null, null, null),(5, null, null, null),(6, null, null, null),(7, null, null, null),
    (8, null, null, null),(9, null, null, null),(10, null, null, null),(11, null, null, null),(12, null, null, null),(13, null, null, null),(14, null, null, null),
    (15, null, null, null),(16, null, null, null),(17, null, null, null),(18, null, null, null),(19, null, null, null),(20, null, null, null),(21, null, null, null),
    (22, null, null, null),(23, null, null, null),(24, null, null, null),(25, null, null, null),(26, null, null, null),(27, null, null, null),(28, null, null, null),
    (29, null, null, null),(30, null, null, null),(31, null, null, null),(32, null, null, null),(33, null, null, null),(34, null, null, null),(35, null, null, null);

-- PUERTO CABELLO
    (36, null, null, null),(37, null, null, null),(38, null, null, null),(39, null, null, null),(40, null, null, null),(41, null, null, null),(42, null, null, null),
    (43, null, null, null),(44, null, null, null),(45, null, null, null),(46, null, null, null),(47, null, null, null),(48, null, null, null),(49, null, null, null),
    (50, null, null, null),(51, null, null, null),(52, null, null, null),(53, null, null, null),(54, null, null, null),(55, null, null, null),(56, null, null, null),
    (57, null, null, null),(58, null, null, null),(59, null, null, null),(60, null, null, null),(61, null, null, null),(62, null, null, null),(63, null, null, null),
    (64, null, null, null),(65, null, null, null),(66, null, null, null),(67, null, null, null),(68, null, null, null),(69, null, null, null),(70, null, null, null),
    (71, null, null, null),(72, null, null, null),(73, null, null, null),(74, null, null, null),(75, null, null, null),(76, null, null, null),(77, null, null, null),
    (78, null, null, null),(79, null, null, null),(80, null, null, null);

-- ANGOSTURA FC
    (81, null, null, null),
    (82, null, null, null),
    (3, null, null, null),
    (4, null, null, null),
    (5, null, null, null),
    (6, null, null, null),
    (7, null, null, null),
    (8, null, null, null),
    (9, null, null, null),
    (10, null, null, null),
    (11, null, null, null),
    (12, null, null, null),
    (13, null, null, null),
    (14, null, null, null),
    (15, null, null, null),
    (16, null, null, null),
    (17, null, null, null),
    (18, null, null, null),
    (19, null, null, null),
    (20, null, null, null),
    (21, null, null, null),
    (22, null, null, null),
    (23, null, null, null),
    (24, null, null, null),
    (25, null, null, null),
    (26, null, null, null),
    (27, null, null, null),
    (28, null, null, null),
    (29, null, null, null),
    (30, null, null, null),
    (31, null, null, null),
    (32, null, null, null),
    (33, null, null, null),
    (34, null, null, null),
    (35, null, null, null);



insert into t_tackle values
-- CARACAS FC
	(1, null, null, null),(2, null, null, null),(3, null, null, null),(4, null, null, null),(5, null, null, null),(6, null, null, null),(7, null, null, null),
    (8, null, null, null),(9, null, null, null),(10, null, null, null),(11, null, null, null),(12, null, null, null),(13, null, null, null),(14, null, null, null),
    (15, null, null, null),(16, null, null, null),(17, null, null, null),(18, null, null, null),(19, null, null, null),(20, null, null, null),(21, null, null, null),
    (22, null, null, null),(23, null, null, null),(24, null, null, null),(25, null, null, null),(26, null, null, null),(27, null, null, null),(28, null, null, null),
    (29, null, null, null),(30, null, null, null),(31, null, null, null),(32, null, null, null),(33, null, null, null),(34, null, null, null),(35, null, null, null);

-- PUERTO CABELLO
    (36, null, null, null),(37, null, null, null),(38, null, null, null),(39, null, null, null),(40, null, null, null),(41, null, null, null),(42, null, null, null),
    (43, null, null, null),(44, null, null, null),(45, null, null, null),(46, null, null, null),(47, null, null, null),(48, null, null, null),(49, null, null, null),
    (50, null, null, null),(51, null, null, null),(52, null, null, null),(53, null, null, null),(54, null, null, null),(55, null, null, null),(56, null, null, null),
    (57, null, null, null),(58, null, null, null),(59, null, null, null),(60, null, null, null),(61, null, null, null),(62, null, null, null),(63, null, null, null),
    (64, null, null, null),(65, null, null, null),(66, null, null, null),(67, null, null, null),(68, null, null, null),(69, null, null, null),(70, null, null, null),
    (71, null, null, null),(72, null, null, null),(73, null, null, null),(74, null, null, null),(75, null, null, null),(76, null, null, null),(77, null, null, null),
    (78, null, null, null),(79, null, null, null),(80, null, null, null);
    
-- ANGOSTURA FC
    (81, null, null, null),
    (82, null, null, null),
    (3, null, null, null),
    (4, null, null, null),
    (5, null, null, null),
    (6, null, null, null),
    (7, null, null, null),
    (8, null, null, null),
    (9, null, null, null),
    (10, null, null, null),
    (11, null, null, null),
    (12, null, null, null),
    (13, null, null, null),
    (14, null, null, null),
    (15, null, null, null),
    (16, null, null, null),
    (17, null, null, null),
    (18, null, null, null),
    (19, null, null, null),
    (20, null, null, null),
    (21, null, null, null),
    (22, null, null, null),
    (23, null, null, null),
    (24, null, null, null),
    (25, null, null, null),
    (26, null, null, null),
    (27, null, null, null),
    (28, null, null, null),
    (29, null, null, null),
    (30, null, null, null),
    (31, null, null, null),
    (32, null, null, null),
    (33, null, null, null),
    (34, null, null, null),
    (35, null, null, null);


    
insert into t_duel values
-- CARACAS FC
	(1, null, null),(2, null, null),(3, null, null),(4, null, null),(5, null, null),(6, null, null),(7, null, null),(8, null, null),(9, null, null),(10, null, null),
    (11, null, null),(12, null, null),(13, null, null),(14, null, null),(15, null, null),(16, null, null),(17, null, null),(18, null, null),(19, null, null),
    (20, null, null),(21, null, null),(22, null, null),(23, null, null),(24, null, null),(25, null, null),(26, null, null),(27, null, null),(28, null, null),
    (29, null, null),(30, null, null),(31, null, null),(32, null, null),(33, null, null),(34, null, null),(35, null, null);

-- PUERTO CABELLO
    (36, null, null),(37, null, null),(38, null, null),(39, null, null),(40, null, null),(41, null, null),(42, null, null),(43, null, null),(44, null, null),
    (45, null, null),(46, null, null),(47, null, null),(48, null, null),(49, null, null),(50, null, null),(51, null, null),(52, null, null),(53, null, null),
    (54, null, null),(55, null, null),(56, null, null),(57, null, null),(58, null, null),(59, null, null),(60, null, null),(61, null, null),(62, null, null),
    (63, null, null),(64, null, null),(65, null, null),(66, null, null),(67, null, null),(68, null, null),(69, null, null),(70, null, null),(71, null, null),
    (72, null, null),(73, null, null),(74, null, null),(75, null, null),(76, null, null),(77, null, null),(78, null, null),(79, null, null),(80, null, null);

-- ANGOSTURA FC
    (81, null, null),
    (82, null, null),
    (3, null, null),
    (4, null, null),
    (5, null, null),
    (6, null, null),
    (7, null, null),
    (8, null, null),
    (9, null, null),
    (10, null, null),
    (11, null, null),
    (12, null, null),
    (13, null, null),
    (14, null, null),
    (15, null, null),
    (16, null, null),
    (17, null, null),
    (18, null, null),
    (19, null, null),
    (20, null, null),
    (21, null, null),
    (22, null, null),
    (23, null, null),
    (24, null, null),
    (25, null, null),
    (26, null, null),
    (27, null, null),
    (28, null, null),
    (29, null, null),
    (30, null, null),
    (31, null, null),
    (32, null, null),
    (33, null, null),
    (34, null, null),
    (35, null, null);



insert into t_dribble values
-- CARACAS FC
	(1, null, null, null),(2, null, null, null),(3, null, null, null),(4, null, null, null),(5, null, null, null),(6, null, null, null),(7, null, null, null),
    (8, null, null, null),(9, null, null, null),(10, null, null, null),(11, null, null, null),(12, null, null, null),(13, null, null, null),(14, null, null, null),
    (15, null, null, null),(16, null, null, null),(17, null, null, null),(18, null, null, null),(19, null, null, null),(20, null, null, null),(21, null, null, null),
    (22, null, null, null),(23, null, null, null),(24, null, null, null),(25, null, null, null),(26, null, null, null),(27, null, null, null),(28, null, null, null),
    (29, null, null, null),(30, null, null, null),(31, null, null, null),(32, null, null, null),(33, null, null, null),(34, null, null, null),(35, null, null, null);

-- PUERTO CABELLO
    (36, null, null, null),(37, null, null, null),(38, null, null, null),(39, null, null, null),(40, null, null, null),(41, null, null, null),(42, null, null, null),
    (43, null, null, null),(44, null, null, null),(45, null, null, null),(46, null, null, null),(47, null, null, null),(48, null, null, null),(49, null, null, null),
    (50, null, null, null),(51, null, null, null),(52, null, null, null),(53, null, null, null),(54, null, null, null),(55, null, null, null),(56, null, null, null),
    (57, null, null, null),(58, null, null, null),(59, null, null, null),(60, null, null, null),(61, null, null, null),(62, null, null, null),(63, null, null, null),
    (64, null, null, null),(65, null, null, null),(66, null, null, null),(67, null, null, null),(68, null, null, null),(69, null, null, null),(70, null, null, null),
    (71, null, null, null),(72, null, null, null),(73, null, null, null),(74, null, null, null),(75, null, null, null),(76, null, null, null),(77, null, null, null),
    (78, null, null, null),(79, null, null, null),(80, null, null, null);

-- ANGOSTURA FC
    (81, null, null, null),
    (82, null, null, null),
    (3, null, null, null),
    (4, null, null, null),
    (5, null, null, null),
    (6, null, null, null),
    (7, null, null, null),
    (8, null, null, null),
    (9, null, null, null),
    (10, null, null, null),
    (11, null, null, null),
    (12, null, null, null),
    (13, null, null, null),
    (14, null, null, null),
    (15, null, null, null),
    (16, null, null, null),
    (17, null, null, null),
    (18, null, null, null),
    (19, null, null, null),
    (20, null, null, null),
    (21, null, null, null),
    (22, null, null, null),
    (23, null, null, null),
    (24, null, null, null),
    (25, null, null, null),
    (26, null, null, null),
    (27, null, null, null),
    (28, null, null, null),
    (29, null, null, null),
    (30, null, null, null),
    (31, null, null, null),
    (32, null, null, null),
    (33, null, null, null),
    (34, null, null, null),
    (35, null, null, null);


    
insert into t_foul values
-- CARACAS FC
	(1, null, null),(2, null, null),(3, null, null),(4, null, null),(5, null, null),(6, null, null),(7, null, null),(8, null, null),(9, null, null),(10, null, null),
    (11, null, null),(12, null, null),(13, null, null),(14, null, null),(15, null, null),(16, null, null),(17, null, null),(18, null, null),(19, null, null),
    (20, null, null),(21, null, null),(22, null, null),(23, null, null),(24, null, null),(25, null, null),(26, null, null),(27, null, null),(28, null, null),
    (29, null, null),(30, null, null),(31, null, null),(32, null, null),(33, null, null),(34, null, null),(35, null, null);

-- PUERTO CABELLO
    (36, null, null),(37, null, null),(38, null, null),(39, null, null),(40, null, null),(41, null, null),(42, null, null),(43, null, null),(44, null, null),
    (45, null, null),(46, null, null),(47, null, null),(48, null, null),(49, null, null),(50, null, null),(51, null, null),(52, null, null),(53, null, null),
    (54, null, null),(55, null, null),(56, null, null),(57, null, null),(58, null, null),(59, null, null),(60, null, null),(61, null, null),(62, null, null),
    (63, null, null),(64, null, null),(65, null, null),(66, null, null),(67, null, null),(68, null, null),(69, null, null),(70, null, null),(71, null, null),
    (72, null, null),(73, null, null),(74, null, null),(75, null, null),(76, null, null),(77, null, null),(78, null, null),(79, null, null),(80, null, null);

-- ANGOSTURA FC 
    (81, null, null),
    (82, null, null),
    (3, null, null),
    (4, null, null),
    (5, null, null),
    (6, null, null),
    (7, null, null),
    (8, null, null),
    (9, null, null),
    (10, null, null),
    (11, null, null),
    (12, null, null),
    (13, null, null),
    (14, null, null),
    (15, null, null),
    (16, null, null),
    (17, null, null),
    (18, null, null),
    (19, null, null),
    (20, null, null),
    (21, null, null),
    (22, null, null),
    (23, null, null),
    (24, null, null),
    (25, null, null),
    (26, null, null),
    (27, null, null),
    (28, null, null),
    (29, null, null),
    (30, null, null),
    (31, null, null),
    (32, null, null),
    (33, null, null),
    (34, null, null),
    (35, null, null);



insert into t_card values
-- CARACAS FC
	(1, 3, 0, 0),(2, 0, 0, 0), (3, 0, 0, 0),(4, 0, 0, 0),(5, 2, 0, 0),(6, 2, 0, 0),(7, 2, 0, 1),(8, 1, 0, 0),(9, 3, 1, 0),(10, 2, 0, 0),(11, 0, 0, 0),
    (12, 3, 0, 0),(13, 0, 0, 0),(14, 0, 0, 0),(15, 3, 0, 0),(16, 1, 0, 0),(17, 2, 0, 0),(18, 2, 0, 0),(19, 1, 0, 0),(20, 0, 0, 0),(21, 0, 0, 0),(22, 0, 0, 0),
    (23, 0, 0, 0),(24, 4, 0, 0),(25, 4, 0, 0),(26, 1, 0, 0),(27, 0, 0, 1),(28, 5, 0, 0),(29, 0, 0, 0),(30, 1, 0, 0),(31, 2, 0, 0),(32, 1, 0, 0),(33, 0, 0, 0),
    (34, 0, 0, 0),(35, 1, 0, 0);

-- PUERTO CABELLO
    (36, 0, 0, 0),(37, 1, 0, 0), (38, null, null, null),(39, null, null, null),(40, null, null, null),(41, 2, 0, 0),(42, 1, 0, 0),(43, 1, 0, 0),(44, 4, 0, 0),
    (45, 0, 0, 0),(46, 2, 0, 0),(47, 1, 0, 0),(48, 0, 0, 0),(49, 4, 0, 0),(50, 1, 0, 0),(51, null, null, null),(52, 0, 0, 0),(53, null, null, null),
    (54, null, null, null),(55, 2, 0, 0),(56, 4, 0, 0),(57, 3, 0, 0),(58, 1, 0, 0),(59, 4, 0, 0),(60, 0, 0, 0),(61, 0, 0, 0),(62, 4, 4, 0),(63, 0, 0, 0),(64, 0, 0, 0),
    (65, 2, 1, 0),(66, 1, 0, 0),(67, null, null, null),(68, null, null, null),(69, null, null, null),(70, null, null, null),(71, null, null, null),(72, 3, 0, 0),
    (73, 2, 0, 0),(74, 1, 0, 0),(75, 0, 0, 0),(76 null, null, null),(77, null, null, null),(78, 0, 0, 0),(79, 0, 0, 0),(80, null, null, null);

-- ANGOSTURA FC
    (81, 4, 0, 0),
    (82, 0, 0, 0), 
    (3, 0, 0, 0),
    (4, 0, 0, 0),
    (5, 2, 0, 0),
    (6, 2, 0, 0),
    (7, 2, 0, 1),
    (8, 1, 0, 0),
    (9, 3, 1, 0),
    (10, 2, 0, 0),
    (11, 0, 0, 0),
    (12, 3, 0, 0),
    (13, 0, 0, 0),
    (14, 0, 0, 0),
    (15, 3, 0, 0),
    (16, 1, 0, 0),
    (17, 2, 0, 0),
    (18, 2, 0, 0),
    (19, 1, 0, 0),
    (20, 0, 0, 0),
    (21, 0, 0, 0),
    (22, 0, 0, 0),
    (23, 0, 0, 0),
    (24, 4, 0, 0),
    (25, 4, 0, 0),
    (26, 1, 0, 0),
    (27, 0, 0, 1),
    (28, 5, 0, 0),
    (29, 0, 0, 0),
    (30, 1, 0, 0),
    (31, 2, 0, 0),
    (32, 1, 0, 0),
    (33, 0, 0, 0),
    (34, 0, 0, 0),
    (35, 1, 0, 0);




insert into t_penalty values
-- CARACAS FC
	(1, null, null, null, null, null),(2, null, null, null, null, null),(3, null, null, null, null, null),(4, null, null, null, null, null),
    (5, null, null, null, null, null),(6, null, null, null, null, null), (7, null, null, null, null, null),(8, null, null, null, null, null),
    (9, null, null, null, null, null),(10, null, null, null, null, null),(11, null, null, null, null, null),(12, null, null, null, null, null),
    (13, null, null, null, null, null),(14, null, null, null, null, null),(15, null, null, null, null, null),(16, null, null, null, null, null),
    (17, null, null, null, null, null),(18, null, null, null, null, null),(19, null, null, null, null, null),(20, null, null, null, null, null),
    (21, null, null, null, null, null),(22, null, null, null, null, null),(23, null, null, null, null, null),(24, null, null, null, null, null),
    (25, null, null, null, null, null),(26, null, null, null, null, null),(27, null, null, null, null, null),(28, null, null, null, null, null),
    (29, null, null, null, null, null),(30, null, null, null, null, null),(31, null, null, null, null, null),(32, null, null, null, null, null),
    (33, null, null, null, null, null),(34, null, null, null, null, null),(35, null, null, null, null, null);

-- PUERTO CABELLO
    (36, null, null, null, null, null),(37, null, null, null, null, null),(38, null, null, null, null, null),(39, null, null, null, null, null),
    (40, null, null, null, null, null),(41, null, null, null, null, null), (42, null, null, null, null, null),(43, null, null, null, null, null),
    (44, null, null, null, null, null),(45, null, null, null, null, null),(46, null, null, null, null, null),(47, null, null, null, null, null),
    (48, null, null, null, null, null),(49, null, null, null, null, null),(50, null, null, null, null, null),(51, null, null, null, null, null),
    (52, null, null, null, null, null),(53, null, null, null, null, null),(54, null, null, null, null, null),(55, null, null, null, null, null),
    (56, null, null, null, null, null),(57, null, null, null, null, null),(58, null, null, null, null, null),(59, null, null, null, null, null),
    (60, null, null, null, null, null),(61, null, null, null, null, null),(62, null, null, null, null, null),(63, null, null, null, null, null),
    (64, null, null, null, null, null),(65, null, null, null, null, null),(66, null, null, null, null, null),(67, null, null, null, null, null),
    (68, null, null, null, null, null),(69, null, null, null, null, null),(70, null, null, null, null, null),(71, null, null, null, null, null),
    (72, null, null, null, null, null),(73, null, null, null, null, null),(74, null, null, null, null, null),(75, null, null, null, null, null),
    (76, null, null, null, null, null),(77, null, null, null, null, null),(78, null, null, null, null, null),(79, null, null, null, null, null),
    (80, null, null, null, null, null);

-- ANGOSTURA FC 
    (81, null, null, null, null, null),
    (82, null, null, null, null, null),
    (3, null, null, null, null, null),
    (4, null, null, null, null, null),
    (5, null, null, null, null, null),
    (6, null, null, null, null, null), 
    (7, null, null, null, null, null),
    (8, null, null, null, null, null),
    (9, null, null, null, null, null),
    (10, null, null, null, null, null),
    (11, null, null, null, null, null),
    (12, null, null, null, null, null),
    (13, null, null, null, null, null),
    (14, null, null, null, null, null),
    (15, null, null, null, null, null),
    (16, null, null, null, null, null),
    (17, null, null, null, null, null),
    (18, null, null, null, null, null),
    (19, null, null, null, null, null),
    (20, null, null, null, null, null),
    (21, null, null, null, null, null),
    (22, null, null, null, null, null),
    (23, null, null, null, null, null),
    (24, null, null, null, null, null),
    (25, null, null, null, null, null),
    (26, null, null, null, null, null),
    (27, null, null, null, null, null),
    (28, null, null, null, null, null),
    (29, null, null, null, null, null),
    (30, null, null, null, null, null),
    (31, null, null, null, null, null),
    (32, null, null, null, null, null),
    (33, null, null, null, null, null),
    (34, null, null, null, null, null),
    (35, null, null, null, null, null);

    


insert into t_statistic values
-- CARACAS FC
	(1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),(2, 4, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),(3, 4, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
    (4, 4, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4), (5, 4, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5),(6, 4, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6),
    (7, 4, 1, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7),(8, 4, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8),(9, 4, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9),
    (10, 4, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10),(11, 4, 1, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11),(12, 4, 1, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12),
    (13, 4, 1, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13),(14, 4, 1, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),(15, 4, 1, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15),
    (16, 4, 1, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16),(17, 4, 1, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17),(18, 4, 1, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18),
    (19, 4, 1, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19),(20, 4, 1, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20),(21, 4, 1, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21),
    (22, 4, 1, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22),(23, 4, 1, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23),(24, 4, 1, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24),
    (25, 4, 1, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25),(26, 4, 1, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26),(27, 4, 1, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27),
    (28, 4, 1, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28),(29, 4, 1, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29),(30, 4, 1, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30),
    (31, 4, 1, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31),(32, 4, 1, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32),(33, 4, 1, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33),
    (34, 4, 1, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34),(35, 4, 1, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35);

-- PUERTO CABELLO
    (36, 1, 1, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36),(37, 1, 1, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37),(38, 1, 1, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38),
    (39, 1, 1, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39),(40, 1, 1, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40),(41, 1, 1, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41),
    (42, 1, 1, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42),(43, 1, 1, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43),(44, 1, 1, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44),
    (45, 1, 1, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45),(46, 1, 1, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46),(47, 1, 1, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47),
    (48, 1, 1, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48),(49, 1, 1, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49),(50, 1, 1, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50),
    (51, 1, 1, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51),(52, 1, 1, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52),(53, 1, 1, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53),
    (54, 1, 1, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54),(55, 1, 1, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55),(56, 1, 1, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56),
    (57, 1, 1, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57),(58, 1, 1, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58),(59, 1, 1, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59),
    (60, 1, 1, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60),(61, 1, 1, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61),(62, 1, 1, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62),
    (63, 1, 1, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63),(64, 1, 1, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64),(65, 1, 1, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65),
    (66, 1, 1, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66),(67, 1, 1, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67),(68, 1, 1, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68),
    (69, 1, 1, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69),(70, 1, 1, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70),(71, 1, 1, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71),
    (72, 1, 1, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72),(73, 1, 1, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73),(74, 1, 1, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74),
    (75, 1, 1, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75),(76, 1, 1, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76),(77, 1, 1, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77),
    (78, 1, 1, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78),(79, 1, 1, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79),(80, 1, 1, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80),

-- ANGOSTURA FC
    (81, 2, 1, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81),
    (82, 2, 1, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82),