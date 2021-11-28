const express = require('express')
const os = require('os');
const fs = require('fs');

const app = express()
var student = {
    name: "Student1",
    age: 25
}

console.log(os.cpus());
fs.writeFileSync('test.txt', "Hi hello");

app.get('/student', function (req, res) {
  res.send(student);
})
 
app.listen(3001)
