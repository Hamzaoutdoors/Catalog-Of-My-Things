/* Database schema analogical to the structure of the classes in our app. */

-- Create book table 
CREATE TABLE label (
label_id SERIAL,
title VARCHAR(30),
color VARCHAR(30)
PRIMARY KEY(label_id)
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
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id)
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
  PRIMARY KEY(id)
);

-- Create genre table 
CREATE TABLE genres (
  genre_id SERIAL,
  name VARCHAR(30),
  PRIMARY KEY(genre_id)
);

-- Create game table 
