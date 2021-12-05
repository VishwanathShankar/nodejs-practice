var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/student', function(req, res, next) {
  res.render('vishwanath', 
  { 
    title: 'Express',
    name: 'Vishwanath',
    country1: 'US',
    country2: 'Russia',
    country3: 'France',
    country4: 'Germany',
  }
  );

});

module.exports = router;
