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
	(2, 'F. Benítez', 'Frankarlos Cruz', 'Benítez Gutiérrez', 19, "2004-05-03", 'Venezuela', '184 cm', '70 kg', 'https://media-1.api-sports.io/football/players/354028.png', 2, 4)
    (3, "W. Hernández", "Wilbert Miguel", "Hernández Torrealba", 22, "2001-03-02", "Venezuela", "185 cm", "82 kg", "https://media-1.api-sports.io/football/players/52563.png", 3, 4)
    (4, "S Moises", "Salvador Moises", "Bolívar Hernandez", 17, null, "Venezuela", null, null, "https://media-3.api-sports.io/football/players/356129.png", 4, 4),
    (5, "D. Luna", "Diego Alfonzo", "Luna Flores", 23, "2000-01-02", "Venezuela", "184 cm", "81 kg", "https://media-3.api-sports.io/football/players/52659.png", 5, 4),
    (6, "D. Rivillo", "Daniel Alejandro", "Rivillo Godoy", 27, "1996-12-21", "Venezuela", "178 cm", "71 kg", "https://media-2.api-sports.io/football/players/53143.png", 6, 4),
    (7, "R. Quijada", "Rubert José", "Quijada Fasciana", 34, "1989-02-10", "Venezuela", "186 cm", "73 kg", "https://media-2.api-sports.io/football/players/52572.png", 7, 4);

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
    (7, 10, 10, 956, null, "Defender", null, false);
    
insert into t_substitute values 
	(1, 0, 0, 0),
    (2, 0, 0, 0),
    (3, 0, 0, 14),
    (4, 0, 0, 0),
    (5, 2, 0, 4),
    (6, 4, 4, 4),
    (7, 0, 2, 1);
    
insert into t_shot values 
	(1, null, null),
    (2, null, null),
    (3, null, null),
    (4, null, null),
    (5, null, null),
    (6, null, null),
    (7, null, null);
    
insert into t_goal values
	(1, 0, null, null, null),
    (2, 0, null, null, null),
    (3, 0, null, null, null),
    (4, 0, null, null, null),
    (5, 0, null, null, null),
    (6, 0, null, null, null),
    (7, 2, null, null, null);
    
insert into t_passe values
	(1, null, null, null),
    (2, null, null, null),
    (3, null, null, null),
    (4, null, null, null),
    (5, null, null, null),
    (6, null, null, null),
    (7, null, null, null);

insert into t_tackle values
	(1, null, null, null),
    (2, null, null, null),
    (3, null, null, null),
    (4, null, null, null),
    (5, null, null, null),
    (6, null, null, null),
    (7, null, null, null);
    
insert into t_duel values
	(1, null, null),
    (2, null, null),
    (3, null, null),
    (4, null, null),
    (5, null, null),
    (6, null, null),
    (7, null, null);
    
insert into t_dribble values
	(1, null, null, null),
    (2, null, null, null),
    (3, null, null, null),
    (4, null, null, null),
    (5, null, null, null),
    (6, null, null, null),
    (7, null, null, null);
    
insert into t_foul values
	(1, null, null),
    (2, null, null),
    (3, null, null),
    (4, null, null),
    (5, null, null),
    (6, null, null),
    (7, null, null);

insert into t_card values
	(1, 3, 0, 0),
    (2, 0, 0, 0), 
    (3, 0, 0, 0),
    (4, 0, 0, 0),
    (5, 2, 0, 0),
    (6, 2, 0, 0),
    (7, 2, 0, 1);

insert into t_penalty values
	(1, null, null, null, null, null),
    (2, null, null, null, null, null),
    (3, null, null, null, null, null),
    (4, null, null, null, null, null),
    (5, null, null, null, null, null),
    (6, null, null, null, null, null), 
    (7, null, null, null, null, null);
    
insert into t_statistic values
	(1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
    (2, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
    (3, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
    (4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4), 
    (5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5),
    (6, 4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6),
    (7, 4, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7);