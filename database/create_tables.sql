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
    course_id integer REFERENCES courses (id),
    student_id integer REFERENCES students (id)
);
