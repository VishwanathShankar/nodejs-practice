const City = require('../Models/City.json');  // importing the City JSON data

// getCityList function to get all the cities
exports.getCityList = (req, res) => {
    if(req.body.authenticated == true) {
        res.status(200).json({ message: "City Fetched Sucessfully", city: City })
    } else {
        res.status(401).json({ message: "Unauthorised", city: {} })
    }
}

exports.postCityList = (req, res) => {
    //console.log(req.body);
    res.status(200).json({ message: "City data received Sucessfully", city: req.body })
}