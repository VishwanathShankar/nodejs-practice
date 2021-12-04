const express = require('express')
const os = require('os');
const fs = require('fs');

const app = express()
var student = [{
    "name": "Student1",
    age: 25
},
{
    "name" : "Student2",
    age: 30
},
{
  "name" : "Student3",
  age: 35
}
];

console.log(os.cpus());
fs.writeFileSync('test.txt', "Hi hello");

app.get('/people', function (req, res) {
  res.send(student);
});


app.post('/people', function (req, res) {
  res.send(student);
});


app.put('/people/:id', function (req, res) {
  res.send(student);
});

app.delete('/people/:id', function (req, res) {
  res.send(student);
});
 
app.listen(3002)
