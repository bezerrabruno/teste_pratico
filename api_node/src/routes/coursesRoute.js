const express = require('express');
const controller = require('../controllers/courseController');

const router = express.Router();

router.use(express.json());

router.get('/', (req, res) => {
    controller.getCourses(res);
});

router.get('/:id', (req, res) => {
    controller.getCourseById(req, res);
});

router.post('/', (req, res) => {
    controller.createCourse(req, res);
});

router.put('/:id', (req, res) => {
    controller.updateCourse(req, res);
});

router.delete('/:id', (req, res) => {
    controller.deleteCourseete(req, res);
});

module.exports = router;
