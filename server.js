/*!
 * login-microservice
 * Copyright(c) 2017 Jorge Gil
 * MIT Licensed
 */

"use strict";

/**
 * Module dependencies.
 */

const express = require('express');

// app conventionally denotes the Express application
const app = express();

/**
 * Express Server setup.
 *
 * Listening on port 3100.
 */

app.listen(3100, function () {
    console.log('Application server started on port: 3100');
});

app.get('/', (req, res) => {
    res.send('Express server working!');
});