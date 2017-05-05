CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL

);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY(question_id) REFERENCES question(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id)
  FOREIGN KEY(user_id) REFERENCES users(id)


);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES question(id),
  FOREIGN KEY(user_id) REFERENCES users(id)

);

INSERT INTO
  users (fname, lname)
VALUES
  ('Alex', 'Scott'),
  ('Alissara', 'Ro');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Where''s Waldo?', 'Is he in the barber shop?', 1),
  ('Where do babies come from?', 'I''ve heard something about a stork',
  (SELECT id FROM users WHERE fname = 'Alissara'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (2, 2);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (1, NULL, 2, 'I don''t think so'),
  (1, 1, 1, 'But I''m looking at him!');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 1),
  (1, 2);
