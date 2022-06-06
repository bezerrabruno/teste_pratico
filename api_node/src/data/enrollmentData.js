const database = require('../config/db_connect');

class EnrollmentData {
    static getEnrollmentByCourseId = (courseId) => {
        return database.query(`SELECT * FROM enrollment WHERE id = ${courseId}`);
    }

    static getEnrollmentByStudentId = (studentId) => {
        return database.query(`SELECT * FROM enrollment WHERE id = ${studentId}`);
    }

    static createEnrollment = (courseId, studentId) => {
        database.query(`INSERT INTO courses(course_id, student_id) VALUES(${courseId}, ${studentId})`);

        return database.query('SELECT * FROM courses');
    }

    static deleteEnrollment = (id) => {
        return database.query('SELECT * FROM courses');
    }
}

module.exports = EnrollmentData;