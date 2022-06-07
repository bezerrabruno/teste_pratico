const database = require('../config/db_connect');

class EnrollmentData {
    static getEnrollmentByCourseId = (courseId) => {
        return database.query(`SELECT * FROM students
        JOIN enrollment 
        ON enrollment.student_id = students.id 
        AND enrollment.course_id = ${courseId}`
        );
    }

    static getEnrollmentByStudentId = (studentId) => {
        return database.query(`SELECT * FROM courses
                                JOIN enrollment 
                                ON enrollment.course_id = courses.id 
                                AND enrollment.student_id = ${studentId}`);
    }

    static createEnrollmentByCourse = (courseId, studentId) => {
        database.query(`INSERT INTO enrollment(course_id, student_id) VALUES(${courseId}, ${studentId})`);

        return this.getEnrollmentByCourseId(courseId);
    }

    static createEnrollmentByStudent = (courseId, studentId) => {
        database.query(`INSERT INTO enrollment(course_id, student_id) VALUES(${courseId}, ${studentId})`);

        return this.getEnrollmentByStudentId(studentId);
    }

    static deleteEnrollmentByCourse = (courseId, studentId) => {

        database.query(`DELETE FROM enrollment WHERE course_id = ${courseId} AND student_id = ${studentId}`);

        return this.getEnrollmentByCourseId(courseId);
    }

    static deleteEnrollmentByStudent = (courseId, studentId) => {
        database.query(`DELETE FROM enrollment WHERE course_id = ${courseId} AND student_id = ${studentId}`);

        return this.getEnrollmentByStudentId(studentId);
    }

}

module.exports = EnrollmentData;