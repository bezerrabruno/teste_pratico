const express = require('express');
const data = require('../data/courseData');

class CourseController {
    static getCourses = async (res) => {
        const response = await data.getCourses();
            return res.status(200).json(response.rows);
    }

    static getCourseById = async (req, res) => {
        const response = await data.getCourseById(req.params.id);
            return res.status(200).json(response.rows.at(0));
    }

    static createCourse = async (req, res) => {
        if(req.body.name != null){
            const response = await data.createCourse(req.body.name, req.body.description, req.body.menu);
            return res.status(200).json(response.rows);
        } else {
            return res.status(400).json({'Message' : 'Name requerido'})
        }
    }

    static updateCourse = async (req, res) => {
        if(req.body.name != null){
            const response = await data.updateCourse(req.params.id, req.body.name, req.body.description, req.body.menu);
            return res.status(200).json(response.rows);
        } else {
            return res.status(400).json({'Message' : 'Name requerido'})
        }
    }

    static deleteCourse = async (req, res) => {
        const response = await data.deleteCourse(req.params.id);
        return res.status(200).json(response.rows);
    }
}

module.exports = CourseController;