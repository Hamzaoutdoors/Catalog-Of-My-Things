/* Database schema analogical to the structure of the classes in our app. */

-- Create book table 


-- Create music album table 
CREATE TABLE music_albums (
  id SERIAL,
  publish_date DATE NOT NULL DEFAULT CURRENT_DATE,
  on_spotify boolean,
  archived boolean,
  genre_id INT,
  label_id INT,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id)
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(author_id)
  PRIMARY KEY(id)
);

-- Create genre table 
CREATE TABLE genre (
  genre_id SERIAL,
  name VARCHAR(30),
  PRIMARY KEY(genre_id)
);

-- Create game table 
