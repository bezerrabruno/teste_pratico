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

router.post('/', (req, res) => {
    controller.createEnrollment(req, res);
})

router.delete('/:id', (req, res) => {
    controller.deleteStudent(req, res);
})

 module.exports = router;