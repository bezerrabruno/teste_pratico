const express = require('express');
const data = require('../data/studentData');

class StudentController {
    static getStudents = async (res) => {
        const response = await data.getStudents();
            return res.status(200).json(response.rows);
    }

    static getStudentById = async (req, res) => {
        const response = await data.getStudentById(req.params.id);
            return res.status(200).json(response.rows.at(0));
    }

    static createStudent = async (req, res) => {
        if(req.body.name != null){
            const response = await data.createStudent(req.body.name, req.body.age);
            return res.status(200).json(response.rows);
        } else {
            return res.status(400).json({'Message' : 'Name requerido'})
        }
    }

    static updateStudent = async (req, res) => {
        if(req.body.name != null){
            const response = await data.updateStudent(req.params.id, req.body.name, req.body.age);
            return res.status(200).json(response.rows.at(0));
        } else {
            return res.status(400).json({'Message' : 'Name requerido'})
        }
    }

    static deleteStudent = async (req, res) => {
        const response = await data.deleteStudent(req.params.id);
        return res.status(200).json(response.rows);
    }
}

module.exports = StudentController;