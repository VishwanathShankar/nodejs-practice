express = require('express')
const app = express()
const port = 3001

var people = {
    "name": "Vishwanath",
    "age": 34
}

app.get('/people', (req, res) => {
  res.send(people);
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})