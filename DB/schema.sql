CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  name VARCHAR
);

CREATE TABLE label (
 	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(100),
	color VARCHAR(100)
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  first_name VARCHAR, 
  last_name VARCHAR
);

CREATE TABLE book (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	publisher VARCHAR(125),
	cover_state VARCHAR(120),
	publish_date  DATE,
	archived Boolean,
	genre_id INT REFERENCES genre(id),
  	author_id INT REFERENCES author(id), 
  	label_id INT REFERENCES label(id)
);

CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  archived BOOLEAN,
  multiplayer BOOLEAN,
  publish_date DATE, 
  last_played_at DATE, 
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id), 
  label_id INT REFERENCES label(id)
);

CREATE TABLE musicAlbum (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id), 
  label_id INT REFERENCES label(id)
);
