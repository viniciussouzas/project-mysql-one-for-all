DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
CREATE TABLE  IF NOT EXISTS SpotifyClone.Plan(
  `plan_id` INT PRIMARY KEY AUTO_INCREMENT,
  `plan_type` VARCHAR(45) NOT NULL,
  `plan_value` DECIMAL(3,2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE  IF NOT EXISTS SpotifyClone.User(
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_age` INT NOT NULL,
  `plan_id` INT NOT NULL,
  `user_plan_sign_date` DATE NOT NULL,
  FOREIGN KEY(plan_id) REFERENCES SpotifyClone.Plan(plan_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Plan (plan_id, plan_type, plan_value) VALUES
	(1, 'gratuito', 0.00),
	(2, 'familiar', 7.99),
	(3, 'universitário', 5.99),
	(4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.User (user_id, user_name, user_age, plan_id, user_plan_sign_date) VALUES
	(1, 'Barbara Liskov', 82, 1, '2019-10-20'),
	(2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
	(3, 'Ada Lovelace', 37, 2, '2017-12-30'),
	(4, 'Martin Fowler', 46, 2, '2017-01-17'),
	(5, 'Sandi Metz', 58, 2, '2018-04-29'),
	(6, 'Paulo Freire', 19, 3, '2018-02-14'),
	(7, 'Bell Hooks', 26, 3, '2018-01-05'),
	(8, 'Christopher Alexander', 85, 4, '2019-06-05'),
	(9, 'Judith Butler', 45, 4, '2020-05-13'),
	(10, 'Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE IF NOT EXISTS SpotifyClone.Artist (
  `artist_id` INT PRIMARY KEY AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Artist (artist_id, artist_name) VALUES
	(1, 'Beyoncé'),
	(2, 'Queen'),
	(3, 'Elis Regina'),
	(4, 'Baco Exu do Blues'),
	(5, 'Blind Guardian'),
	(6, 'Nina Simone');

CREATE TABLE IF NOT EXISTS SpotifyClone.Album (
  `album_id` INT PRIMARY KEY AUTO_INCREMENT,
  `album_name` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  `album_release_date` YEAR(4) NOT NULL,
  FOREIGN KEY(artist_id) REFERENCES SpotifyClone.Artist(artist_id)
  ) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Album (album_id, album_name, artist_id, album_release_date) VALUES
	(1, 'Renaissance', 1, '2022'),
	(2, 'Jazz', 2, '1978'),
	(3, 'Hot Space', 2, '1982'),
	(4, 'Falso Brilhante', 3, '1998'),
	(5, 'Vento de Maio', 3, '2001'),
	(6, 'QVVJFA?', 4, '2003'),
	(7, 'Somewhere Far Beyond', 5, '2007'),
	(8, 'I Put A Spell On You', 6, '2012');

CREATE TABLE IF NOT EXISTS SpotifyClone.Songs (
  `songs_id` INT PRIMARY KEY AUTO_INCREMENT,
  `songs_name` VARCHAR(45) NOT NULL,
  `songs_length` INT NOT NULL,
  `album_id` INT NOT NULL,
  FOREIGN KEY(album_id) REFERENCES SpotifyClone.Album(album_id)
  ) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Songs (songs_id, songs_name, songs_length, album_id) VALUES
	(1, 'BREAK MY SOUL', 279, 1),
	(2, "VIRGO´S GROOVE", 369, 1),
	(3, 'ALIEN SUPERSTAR', 116, 1),
	(4, "Don´t Stop Me Now", 203, 2),
	(5, 'Under Pressure', 152, 3),
	(6, 'Como Nossos Pais', 105, 4),
	(7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
	(8, 'Samba em Paris', 267, 6),
	(9, "The Bard´s Song", 244, 7),
	(10, 'Feeling Good', 100, 8);

CREATE TABLE IF NOT EXISTS SpotifyClone.History(
  `user_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  `played_date` DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, songs_id),
    FOREIGN KEY(user_id) REFERENCES SpotifyClone.User(user_id),
    FOREIGN KEY(songs_id) REFERENCES SpotifyClone.Songs(songs_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.History (user_id, songs_id, played_date)
VALUES 
  (1, 8,'2022-02-28 10:45:55'),
  (1, 2,'2020-05-02 05:30:35'),
  (1, 10,'2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 16:55:13'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

CREATE TABLE IF NOT EXISTS SpotifyClone.Following_Artists(
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY(user_id) REFERENCES SpotifyClone.User(user_id),
    FOREIGN KEY(artist_id) REFERENCES SpotifyClone.Artist(artist_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Following_Artists (user_id, artist_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,6),
  (6,1),
  (7,6),
  (9,3),
  (10,2);

  USE SpotifyClone;