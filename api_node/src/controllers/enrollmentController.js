const express = require('express');
const data = require('../data/enrollmentData');

class EnrollmentDataController {
    static getEnrollmentByCourseId = async (req, res) => {
        const response = await data.getEnrollmentByCourseId(req.params.id);
            return res.status(200).json(response.rows);
    }

    static getEnrollmentByStudentId = async (req, res) => {
        const response = await data.getEnrollmentByStudentId(req.params.id);
            return res.status(200).json(response.rows);
    }

    static createEnrollmentByCourse = async (req, res) => {
        if(req.body.courseId != null && req.body.studentId != null){
            const response = await data.createEnrollmentByCourse(req.body.courseId, req.body.studentId);
            return res.status(200).json(response.rows);
        } else {
            return res.status(400).json({'Message' : 'Erro desconhecido'})
        }
    }

    static createEnrollmentByStudent = async (req, res) => {
        if(req.body.courseId != null && req.body.studentId != null){
            const response = await data.createEnrollmentByStudent(req.body.courseId, req.body.studentId);
            return res.status(200).json(response.rows);
        } else {
            return res.status(400).json({'Message' : 'Erro desconhecido'})
        }
    }

    static deleteEnrollmentByCourse = async (req, res) => {
        const response = await data.deleteEnrollmentByCourse(req.params.id);
        return res.status(200).json(response.rows);
    }

    static deleteEnrollmentByStudent = async (req, res) => {
        const response = await data.deleteEnrollmentByStudent(req.params.id);
        return res.status(200).json({'message': 'Deletado com sucesso'});
    }
}

module.exports = EnrollmentDataController;