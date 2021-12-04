var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', 
    { 
      title: 'Express',
      name: 'Edureka',
      address: {
        home: '12 Bangalore',
        office: "24 Cunningham road"
      }
   }
  );
});

module.exports = router;
