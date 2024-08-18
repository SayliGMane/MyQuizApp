CREATE DATABASE quizapp_project;

CREATE TABLE user (
    username VARCHAR(20) NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
)

CREATE TABLE topics (
    id SERIAL PRIMARY KEY,
    topic VARCHAR(20) NOT NULL,
)

CREATE TABLE difficulty (
    level_ SERIAL PRIMARY KEY,
    difficulty VACHAR(20) NOT NULL
)

CREATE TABLE question (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    topic_id INT REFERENCES topics(id),
    level_ INT REFERENCES difficulty(level_),
    right_answer ARRAY NOT NULL,
    wrong_answer ARRAY NOT NULL,
    hints ARRAY,
    score SMALLINT NOT NULL
)

CREATE TABLE session (
    id SERIAL PRIMARY KEY,
    user_ VARCHAR(20) REFERENCES user(username),
    question INT REFERENCES question(id),
    correct BOOL NOT NULL,
    hints BOOL NOT NULL,   
)

