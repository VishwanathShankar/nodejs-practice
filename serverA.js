var express = require('express');
var app = express();
var people = {
    "name": "Vishwanath",
    "age": 34
}

app.use('/', express.static('public'));
/*
app.get('/people', (req, res) => {
    res.send(people);
  });
  */
 
app.listen(3000);
