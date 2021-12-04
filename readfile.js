const express = require('express')
const os = require('os');
const fs = require('fs');

const app = express()

app.get('/student', function (req, res) {
    fs.readFile("jsonFiles/student.json", "utf8", function(err, data){
        if(err) {
            res.send("Something bad happened");
            throw err;
        }
    
        var resultArray = data;
        res.send(resultArray);
    }); 
});
 
app.get('/restaurant/delhi', function (req, res) {
    fs.readFile("jsonFiles/restaurant.json", "utf8", function(err, data){
        if(err) {
            res.send("Something bad happened");
            throw err;
        }
    
        var resultArray = data;
        res.send(resultArray);
    }); 
});
 
app.listen(3001)