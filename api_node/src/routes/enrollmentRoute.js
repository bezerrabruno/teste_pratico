const express = require('express');
const controller = require('../controllers/enrollmentController');

const router = express.Router();

router.use(express.json());

router.get('/course/:id', (req, res) => {
    controller.getEnrollmentByCourseId(req, res);
});

router.get('/student/:id', (req, res) => {
    controller.getEnrollmentByStudentId(req, res);
});

router.post('/course', (req, res) => {
    controller.createEnrollmentByCourse(req, res);
})

router.post('/student', (req, res) => {
    controller.createEnrollmentByStudent(req, res);
})

router.post('/course/delete', (req, res) => {
    controller.deleteEnrollmentByCourse(req, res);
})

router.post('/student/delete', (req, res) => {
    controller.deleteEnrollmentByStudent(req, res);
})

 module.exports = router;