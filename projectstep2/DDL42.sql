-- Movie Collection Management System Database Schema
-- Team Members: Jared Ambrose, Kevin Mistler
-- Project Title: Movie Collection Management System
-- Last Modified: 10/31/2024

-- Disable foreign key checks and autocommit for smooth import
SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT=0;

-- Drop tables if they exist to avoid duplication errors
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS movies_actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS users;

-- Create `movies` table
CREATE TABLE movies (
    movieID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    releaseYear YEAR NOT NULL,
    genre VARCHAR(50) NOT NULL,
    directorID INT,
    FOREIGN KEY (directorID) REFERENCES directors(directorID) ON DELETE CASCADE
);

-- Create `actors` table
CREATE TABLE actors (
    actorID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthDate DATE,
    bio TEXT
);

-- Create `directors` table
CREATE TABLE directors (
    directorID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthDate DATE,
    bio TEXT
);

-- Create `users` table
CREATE TABLE users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    registrationDate DATE NOT NULL
);

-- Create `reviews` table to link `users` to `movies`
CREATE TABLE reviews (
    reviewID INT AUTO_INCREMENT PRIMARY KEY,
    movieID INT,
    userID INT,
    reviewText TEXT NOT NULL,
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    reviewDate DATE NOT NULL,
    FOREIGN KEY (movieID) REFERENCES movies(movieID) ON DELETE CASCADE,
    FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE
);

-- Create junction table `movies_actors` for M:N relationship between `movies` and `actors`
CREATE TABLE movies_actors (
    movieID INT,
    actorID INT,
    PRIMARY KEY (movieID, actorID),
    FOREIGN KEY (movieID) REFERENCES movies(movieID) ON DELETE CASCADE,
    FOREIGN KEY (actorID) REFERENCES actors(actorID) ON DELETE CASCADE
);

-- Insert sample data for `directors`
INSERT INTO directors (name, birthDate, bio) VALUES
('Christopher Nolan', '1970-07-30', 'Known for Inception, Dark Knight, etc.'),
('Quentin Tarantino', '1963-03-27', 'Known for Pulp Fiction, Kill Bill, etc.'),
('Steven Spielberg', '1946-12-18', 'Known for Jaws, Jurassic Park, etc.'),
('James Cameron', '1954-08-16', 'Known for Avatar, Titanic, etc.');

-- Insert sample data for `actors`
INSERT INTO actors (name, birthDate, bio) VALUES
('Leonardo DiCaprio', '1974-11-11', 'Known for Titanic, Inception, etc.'),
('Samuel L. Jackson', '1948-12-21', 'Known for Pulp Fiction, Avengers, etc.'),
('Morgan Freeman', '1937-06-01', 'Known for Shawshank Redemption, Se7en, etc.'),
('Sigourney Weaver', '1949-10-08', 'Known for Alien, Avatar, etc.');

-- Insert sample data for `movies`
INSERT INTO movies (title, releaseYear, genre, directorID) VALUES
('Inception', 2010, 'Sci-Fi', (SELECT directorID FROM directors WHERE name='Christopher Nolan')),
('Pulp Fiction', 1994, 'Crime', (SELECT directorID FROM directors WHERE name='Quentin Tarantino')),
('Jurassic Park', 1993, 'Adventure', (SELECT directorID FROM directors WHERE name='Steven Spielberg')),
('Avatar', 2009, 'Sci-Fi', (SELECT directorID FROM directors WHERE name='James Cameron'));

-- Insert sample data for `users`
INSERT INTO users (username, email, registrationDate) VALUES
('movielover1', 'lover1@example.com', '2024-01-15'),
('cinemafan', 'fan@example.com', '2024-02-20'),
('filmcritic', 'critic@example.com', '2024-03-15'),
('scifi_fan', 'scifi_fan@example.com', '2024-04-01');

-- Insert sample data for `reviews`
INSERT INTO reviews (movieID, userID, reviewText, rating, reviewDate) VALUES
((SELECT movieID FROM movies WHERE title='Inception'), (SELECT userID FROM users WHERE username='movielover1'), 'Amazing movie!', 5, '2024-03-01'),
((SELECT movieID FROM movies WHERE title='Pulp Fiction'), (SELECT userID FROM users WHERE username='cinemafan'), 'Classic film!', 4, '2024-03-10'),
((SELECT movieID FROM movies WHERE title='Jurassic Park'), (SELECT userID FROM users WHERE username='filmcritic'), 'Timeless adventure!', 5, '2024-03-20'),
((SELECT movieID FROM movies WHERE title='Avatar'), (SELECT userID FROM users WHERE username='scifi_fan'), 'Visually stunning!', 4, '2024-04-15');

-- Insert sample data for `movies_actors` junction table
INSERT INTO movies_actors (movieID, actorID) VALUES
((SELECT movieID FROM movies WHERE title='Inception'), (SELECT actorID FROM actors WHERE name='Leonardo DiCaprio')),
((SELECT movieID FROM movies WHERE title='Pulp Fiction'), (SELECT actorID FROM actors WHERE name='Samuel L. Jackson')),
((SELECT movieID FROM movies WHERE title='Jurassic Park'), (SELECT actorID FROM actors WHERE name='Samuel L. Jackson')),
((SELECT movieID FROM movies WHERE title='Avatar'), (SELECT actorID FROM actors WHERE name='Sigourney Weaver'));

-- Re-enable foreign key checks and commit all changes
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
