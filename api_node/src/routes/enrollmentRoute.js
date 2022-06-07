const express = require('express');
const controller = require('../controllers/enrollmentController');

const router = express.Router();

router.use(express.json());

router.get('/course/:id', (req, res) => {
    controller.getEnrollmentByCourseId(res);
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

router.delete('/course/:id', (req, res) => {
    controller.deleteEnrollmentByCourse(req, res);
})

router.delete('/student/:id', (req, res) => {
    controller.deleteEnrollmentByStudent(req, res);
})

 module.exports = router;