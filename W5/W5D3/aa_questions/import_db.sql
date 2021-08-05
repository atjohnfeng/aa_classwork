PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_reply INTEGER,
  body TEXT,

  FOREIGN KEY (parent_reply) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Ry', 'Mercado'),
  ('John', 'Feng');

INSERT INTO 
  questions (title, body, user_id)
VALUES
  ('What kind of questions are they supposed to be?', 'Give more details.', (SELECT id FROM users WHERE fname = 'Ry' AND lname = 'Mercado')),
  ('What is the weather today?', 'I do not know.', (SELECT id FROM users WHERE fname = 'John' AND lname = 'Feng'));

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'What kind of questions are they supposed to be?'), (SELECT id FROM users WHERE fname = 'John' AND lname = 'Feng')),
  ((SELECT id FROM questions WHERE title = 'What is the weather today?'), (SELECT id FROM users WHERE fname = 'Ry' AND lname = 'Mercado'));

INSERT INTO
  replies (question_id, user_id, parent_reply, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'What kind of questions are they supposed to be?'), (SELECT id FROM users WHERE fname = 'John' AND lname = 'Feng'), NULL, 'I do not know.');

INSERT INTO
  replies (question_id, user_id, parent_reply, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'What kind of questions are they supposed to be?'), (SELECT id FROM users WHERE fname = 'Ry' AND lname = 'Mercado'), (SELECT id FROM replies WHERE body = 'I do not know.'), 'Me neither.');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'What kind of questions are they supposed to be?'), (SELECT id FROM users WHERE fname = 'Ry' AND lname = 'Mercado')),
  ((SELECT id FROM questions WHERE title = 'What kind of questions are they supposed to be?'), (SELECT id FROM users WHERE fname = 'John' AND lname = 'Feng')),
  ((SELECT id FROM questions WHERE title = 'What is the weather today?'), (SELECT id FROM users WHERE fname = 'Ry' AND lname = 'Mercado'));