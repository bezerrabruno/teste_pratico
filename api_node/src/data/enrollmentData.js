const database = require('../config/db_connect');

class EnrollmentData {
    static getEnrollmentByCourseId = (courseId) => {
        await database.query(`SELECT * FROM enrollment WHERE courseId = ${courseId}`);
    }

    static getEnrollmentByStudentId = (studentId) => {
        return database.query(`SELECT * FROM enrollment WHERE studentId = ${studentId}`);
    }

    static createEnrollmentByCourse = (courseId, studentId) => {
        await database.query(`INSERT INTO enrollment(course_id, student_id) VALUES(${courseId}, ${studentId})`);

        return database.query(`SELECT * FROM enrollment WHERE courseId = ${courseId}`);
    }

    static createEnrollmentByStudent = (courseId, studentId) => {
        await database.query(`INSERT INTO enrollment(course_id, student_id) VALUES(${courseId}, ${studentId})`);

        return database.query('SELECT * FROM enrollment');
    }

    static deleteEnrollment = (id) => {
        return database.query(`DELETE FROM enrollment WHERE courseId = ${courseId}`);
    }
}

module.exports = EnrollmentData;