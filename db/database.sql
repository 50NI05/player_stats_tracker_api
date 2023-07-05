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
    comitted int default null,
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

INSERT INTO t_team VALUES 
    (1, 'Puerto Cabello', 'Venezuela', 2014, 'https://media-2.api-sports.io/football/teams/2827.png'),
    (2, 'Aragua FC', 'Venezuela', 2002, 'https://media-3.api-sports.io/football/teams/2817.png'),
    (3, 'Carabobo FC', 'Venezuela', 1997, 'https://media-1.api-sports.io/football/teams/2810.png'),
    (4, 'Caracas FC', 'Venezuela', 1967, 'https://media-1.api-sports.io/football/teams/2808.png'),
    (5, 'Deportivo La Guaira', 'Venezuela', null, null),
    (6, 'Deportivo Lara', 'Venezuela', 2006, 'https://media-1.api-sports.io/football/teams/2812.png'),
    (7, 'Deportivo Táchira FC', 'Venezuela', 1974, 'https://media-2.api-sports.io/football/teams/2807.png'),
    (8, 'Estudiantes de Mérida FC', 'Venezuela', 1971, 'https://media-3.api-sports.io/football/teams/2818.png'),
    (9, 'CD Hermanos Colmenárez', 'Venezuela', 2015, 'https://media-3.api-sports.io/football/teams/2854.png'),
    (10, 'Metropolitanos FC', 'Venezuela', 2011, 'https://media-3.api-sports.io/football/teams/2825.png'),
    (11, 'Mineros de Guayana', 'Venezuela', 1981, 'https://media-1.api-sports.io/football/teams/2824.png'),
    (12, 'Monagas SC', 'Venezuela', 1987, 'https://media-2.api-sports.io/football/teams/2811.png'),
    (13, 'Portuguesa FC', 'Venezuela', 1972, 'https://media-1.api-sports.io/football/teams/2814.png'),
    (14, 'UCV FC', 'Venezuela', 1950, 'https://media-1.api-sports.io/football/teams/2840.png'),
    (15, 'Zamora FC', 'Venezuela', 1977, 'https://media-3.api-sports.io/football/teams/2806.png'),
    (16, 'Zulia FC', 'Venezuela', 2005, 'https://media-3.api-sports.io/football/teams/2805.png');

INSERT INTO t_league VALUES 
	(1, "Primera División", "Venezuela", "https://media-2.api-sports.io/football/leagues/299.png", 2023));
    
INSERT INTO t_game VALUES 
	(1, 0, 0, 0, null, "Goalkeeper", null, false),
    (2, 1, 1, 90, null, "Goalkeeper", null, false),
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
	(1, 0, 0, 0),
    (2, 0, 0, 0),
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
    (35, 5, 2, 5),
    (, 2, 0, 3),
    (, 2, 0, 3),
    (, 2, 0, 3),
    (, 2, 0, 3);
    
insert into t_shot values 
	(1, null, null),
    (2, null, null),
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
    (35, null, null),
    (, null, null),
    (, null, null),
    (, null, null),
    (, null, null);
    
insert into t_goal values
	(1, 0, null, null, null),
    (2, 0, null, null, null),
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
    (35, 1, null, null, null),
    (, 1, null, null, null),
    (, 1, null, null, null),
    (, 1, null, null, null),
    (, 1, null, null, null),
    (, 1, null, null, null);
    
insert into t_passe values
	(1, null, null, null),
    (2, null, null, null),
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
	(1, null, null, null),
    (2, null, null, null),
    (3, null, null, null),
    (4, null, null, null),
    (5, null, null, null),
    (6, null, null, null),
    (7, null, null, null),
    (8, null, null, null),
    (9, null, null, null),
    (, null, null, null),
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
    (35, null, null, null),
    (, null, null, null),
    (, null, null, null);
    
insert into t_duel values
	(1, null, null),
    (2, null, null),
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
    (35, null, null),
    (, null, null),
    (, null, null),
    (, null, null),
    (, null, null);
    
insert into t_dribble values
	(1, null, null, null),
    (2, null, null, null),
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
    (35, null, null, null),
    (, null, null, null),
    (, null, null, null),
    (, null, null, null);
    
insert into t_foul values
	(1, null, null),
    (2, null, null),
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
    (35, null, null),
    (, null, null),
    (, null, null),
    (, null, null),
    (, null, null);

insert into t_card values
	(1, 3, 0, 0),
    (2, 0, 0, 0), 
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
    (35, 1, 0, 0),
    (, 1, 0, 0),
    (, 1, 0, 0),
    (, 1, 0, 0),
    (, 1, 0, 0),
    (, 1, 0, 0),
    (, 1, 0, 0),
    (, 1, 0, 0);

insert into t_penalty values
	(1, null, null, null, null, null),
    (2, null, null, null, null, null),
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
    (35, null, null, null, null, null),
    (, null, null, null, null, null),
    (, null, null, null, null, null),
    (, null, null, null, null, null),
    (, null, null, null, null, null),
    (, null, null, null, null, null),
    (, null, null, null, null, null);
    
insert into t_statistic values
	(1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
    (2, 4, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
    (3, 4, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
    (4, 4, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4), 
    (5, 4, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5),
    (6, 4, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6),
    (7, 4, 1, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7),
    (8, 4, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8),
    (9, 4, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9),
    (10, 4, 1, 10, 10, 10, 10, 10, 10, 10, 10),
    (11, 4, 1, 11, 11, 11, 11, 11, 11, 11, 11),
    (12, 4, 1, 12, 12, 12, 12, 12, 12, 12, 12),
    (13, 4, 1, 13, 13, 13, 13, 13, 13, 13, 13),
    (14, 4, 1, 14, 14, 14, 14, 14, 14, 14, 14),
    (15, 4, 1, 15, 15, 15, 15, 15, 15, 15, 15),
    (16, 4, 1, 16, 16, 16, 16, 16, 16, 16, 16),
    (17, 4, 1, 17, 17, 17, 17, 17, 17, 17, 17),
    (18, 4, 1, 18, 18, 18, 18, 18, 18, 18, 18),
    (19, 4, 1, 19, 19, 19, 19, 19, 19, 19, 19),
    (20, 4, 1, 20, 20, 20, 20, 20, 20, 20, 20),
    (21, 4, 1, 21, 21, 21, 21, 21, 21, 21, 21),
    (22, 4, 1, 22, 22, 22, 22, 22, 22, 22, 22),
    (23, 4, 1, 23, 23, 23, 23, 23, 23, 23, 23),
    (24, 4, 1, 24, 24, 24, 24, 24, 24, 24, 24),
    (25, 4, 1, 25, 25, 25, 25, 25, 25, 25, 25),
    (26, 4, 1, 26, 26, 26, 26, 26, 26, 26, 26),
    (27, 4, 1, 27, 27, 27, 27, 27, 27, 27, 27),
    (28, 4, 1, 28, 28, 28, 28, 28, 28, 28, 28),
    (29, 4, 1, 29, 29, 29, 29, 29, 29, 29, 29),
    (30, 4, 1, 30, 30, 30, 30, 30, 30, 30, 30),
    (31, 4, 1, 31, 31, 31, 31, 31, 31, 31, 31),
    (32, 4, 1, 32, 32, 32, 32, 32, 32, 32, 32),
    (33, 4, 1, 33, 33, 33, 33, 33, 33, 33, 33),
    (34, 4, 1, 34, 34, 34, 34, 34, 34, 34, 34),
    (35, 4, 1, 35, 35, 35, 35, 35, 35, 35, 35);