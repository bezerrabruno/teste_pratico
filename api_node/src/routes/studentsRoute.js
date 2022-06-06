const express = require('express');
const controller = require('../controllers/studentController');

const router = express.Router();

router.use(express.json());

router.get('/', (req, res) => {
    controller.getStudents(res);
});

router.get('/:id', (req, res) => {
    controller.getStudentById(req, res);
});

router.post('/', (req, res) => {
    controller.createStudent(req, res);
})

router.put('/:id', (req, res) => {
    controller.updateStudent(req, res);
})

router.delete('/:id', (req, res) => {
    controller.deleteStudent(req, res);
})

 module.exports = router;