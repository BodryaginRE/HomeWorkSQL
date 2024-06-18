CREATE TABLE IF NOT EXISTS genres (
  genreid SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE artist_genre (
    artistid INT REFERENCES artists(artistid),
    genreid INT REFERENCES genres(genreid)
);

ALTER TABLE artists ADD FOREIGN KEY (genreid) REFERENCES genre_artist(genreid);

CREATE TABLE artists (
  artistid SERIAL PRIMARY KEY,
  name VARCHAR(100),
  genres JSONB
);

CREATE table if not EXISTS albums (
  albumid SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  releaseyear INT NOT NULL,
  artists JSONB
);

CREATE TABLE IF NOT EXISTS album_artist (
  artistid INT REFERENCES artists(artistid),
  albumid INT REFERENCES albums(albumid)
);

ALTER TABLE albums ADD FOREIGN KEY (artistid) REFERENCES album_artist(artistid);

CREATE table if not EXISTS tracks (
  trackid SERIAL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  duration INT NOT NULL,
  albumid INT REFERENCES albums(albumid)
);

CREATE table if not EXISTS compilations (
  compilationid SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  releaseyear DATE NOT NULL
);

CREATE table if not EXISTS compilationtracks (
  compilationid INT REFERENCES compilations(compilationid),
  trackid INT REFERENCES tracks(trackid)
);
