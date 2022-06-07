const database = require('../config/db_connect');

class StudentData {
    static getStudents = () => {
        return database.query('SELECT * FROM students');
    }

    static getStudentById = (id) => {
        return database.query(`SELECT * FROM students WHERE id = ${id}`);
    }

    static createStudent = (name, age) => {
        await database.query(`INSERT INTO students(name, age) VALUES('${name}', ${age})`);

        return database.query('SELECT * FROM students');
    }

    static updateStudent = (id, name, age) => {
        await database.query(`UPDATE students SET name = '${name}', age ='${age}' WHERE id = ${id}`);

        return database.query(`SELECT * FROM students WHERE id = ${id}`);
    }
    
    static deleteStudent = (id) => {
        return database.query(`DELETE FROM students WHERE id = ${id}`);
    }
}

module.exports = StudentData;