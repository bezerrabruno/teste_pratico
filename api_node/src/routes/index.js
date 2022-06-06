const express = require('express');

const routes = (app) => 
{
    app.use('/courses', require('./coursesRoute'));
    app.use('/students', require('./studentsRoute'));
    app.use('/enrollment', require('./enrollmentRoute'));
}

module.exports = routes;