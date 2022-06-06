CREATE TABLE IF NOT EXISTS courses
(
    id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    description varchar(50),
    menu text
);

CREATE TABLE IF NOT EXISTS students
(
    id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    age smallint NOT NULL
);

CREATE TABLE IF NOT EXISTS enrollment
(
    id serial PRIMARY KEY,
    courseId integer NOT NULL,
    studentId integer NOT NULL
);
