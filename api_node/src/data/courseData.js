const database = require('../config/db_connect');

class CourseData {
    static getCourses = () => {
        return database.query('SELECT * FROM courses');
    }

    static getCourseById = (id) => {
        return database.query(`SELECT * FROM courses WHERE id = ${id}`);
    }

    static createCourse = (name, description, menu) => {
        database.query(`INSERT INTO courses(name, description, menu) VALUES('${name}', '${description}', '${menu}')`);

        return this.getCourses();
    }

    static updateCourse = (id, name, description, menu) => {
        database.query(`UPDATE courses SET name = '${name}', description ='${description}',  menu = '${menu}' WHERE id = ${id}`);

        return this.getCourseById(id);
    }

    static deleteCourse = (id) => {
        return database.query(`DELETE FROM courses WHERE id = ${id}`);
    }
}

module.exports = CourseData;