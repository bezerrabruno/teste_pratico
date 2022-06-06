const express = require('express');
const data = require('../data/enrollmentData');

class EnrollmentDataController {
    static getEnrollmentByCourseId = async (req, res) => {
        const response = await data.getEnrollmentByCourseId(req.params.id);
            return res.status(200).json(response.rows.at(0));
    }

    static getEnrollmentByStudentId = async (req, res) => {
        const response = await data.getEnrollmentByStudentId(req.params.id);
            return res.status(200).json(response.rows.at(0));
    }

    static createEnrollment = async (req, res) => {
        if(req.body.courseId != null && req.body.studentId != null){
            const response = await data.createEnrollment(req.body.courseId, req.body.studentId);
            return res.status(200).json(response.rows);
        } else {
            return res.status(400).json({'Message' : 'Erro desconhecido'})
        }
    }

    static deleteEnrollment = async (req, res) => {
        const response = await data.deleteEnrollment(req.params.id);
        return res.status(200).json(response.rows);
    }
}

module.exports = EnrollmentDataController;