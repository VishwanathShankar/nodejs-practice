express = require('express')
const app = express()
const port = 3001

var people = {
    "name": "Vishwanath",
    "age": 34
}

// handling CORS - Cross Origin Resource Sharing Issue
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
})






app.get('/people', (req, res) => {
  res.send(people);
})

app.use(function (req, res, next) {
  var date = new Date();
  console.log('Time:', date)
  next()
})



app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})