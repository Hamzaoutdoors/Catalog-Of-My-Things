/* Database schema analogical to the structure of the classes in our app. */
-- Create label table
CREATE TABLE labels (
label_id SERIAL,
title VARCHAR(30),
color VARCHAR(30),
PRIMARY KEY(label_id)
);
-- Create genre table 
CREATE TABLE genres (
  genre_id SERIAL,
  name VARCHAR(30),
  PRIMARY KEY(genre_id)
);

-- Create author table
CREATE TABLE authors (
    id          INT GENERATED ALWAYS AS IDENTITY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    PRIMARY KEY(id)
);

-- Create book table
CREATE TABLE Book (
 id SERIAL,
 publish_date DATE NOT NULL DEFAULT CURRENT_DATE,
 publisher VARCHAR(30),
 cover_state boolean,
 archived boolean,
 genre_id INT,
 label_id INT,
 author_id INT,
 CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
 CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels(label_id),
 CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(id),
 PRIMARY KEY(id)
);

-- Create music album table 
CREATE TABLE music_albums (
  id SERIAL,
  publish_date DATE NOT NULL DEFAULT CURRENT_DATE,
  on_spotify boolean,
  archived boolean,
  genre_id INT,
  label_id INT,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels(label_id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(id),
  PRIMARY KEY(id)
);

-- Create game table 
CREATE TABLE game (
    id              INT GENERATED ALWAYS AS IDENTITY,
    multiplayer     BOOLEAN,
    last_played_at  DATE,
    publish_date    DATE,
    genre_id        INT,
    author_id       INT,
    label_id        INT,
    archived        BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(genre_id) REFERENCES genres(genre_id),
    FOREIGN KEY(author_id) REFERENCES authors(id),
    FOREIGN KEY(label_id) REFERENCES labels(label_id)
);
