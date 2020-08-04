DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255)
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    author_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject_question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER,
    reply_body TEXT,

    FOREIGN KEY (subject_question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO users (fname, lname) VALUES ('Haadi', 'Munshi');
INSERT INTO users (fname, lname) VALUES ('Alex', 'Baxter');
INSERT INTO users (fname, lname) VALUES ('Daniel', 'Domkey');

INSERT INTO questions (title, body, author_id) VALUES ('Haadi Question', 'Haadi Haadi Haadi', 1);
INSERT INTO questions (title, body, author_id) VALUES ('Alex Question', 'Alex Alex Alex', 2);
INSERT INTO questions (title, body, author_id) VALUES ('Daniel Question', 'Daniel Daniel Daniel', 3);

INSERT INTO question_follows (question_id, user_id) VALUES (2, 1);
INSERT INTO question_follows (question_id, user_id) VALUES (3, 1);
INSERT INTO question_follows (question_id, user_id) VALUES (1, 3);
INSERT INTO question_follows (question_id, user_id) VALUES (2, 3);

INSERT INTO replies (subject_question_id, parent_reply_id, author_id, reply_body) VALUES (1, NULL, 1, 'Yes');
INSERT INTO replies (subject_question_id, parent_reply_id, author_id, reply_body) VALUES (1, 1, 3, 'Yup');
INSERT INTO replies (subject_question_id, parent_reply_id, author_id, reply_body) VALUES (3, 2, 2, 'No');

INSERT INTO question_likes (question_id, user_id) VALUES (1, 3);
INSERT INTO question_likes (question_id, user_id) VALUES (3, 1);
INSERT INTO question_likes (question_id, user_id) VALUES (2, 2);
INSERT INTO question_likes (question_id, user_id) VALUES (2, 3);
