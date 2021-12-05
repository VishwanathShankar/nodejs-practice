const Restaurant = require('../Models/Restaurant.json');  // importing the Restaurant JSON data

// getRestaurantByCity function to return restaurants by city
exports.getRestaurantByCity = (req, res) => {
    console.log("Request body is");
    console.log(req.body);
    const cityName = req.body.city;
    console.log("Pincode is" + req.body.pinCode);
    const result = Restaurant.filter(item => item.city == cityName);
    res.status(200).json({ message: "Restaurant Fetched Sucessfully", restaurantList: result })
        .catch(err => {
            res.status(500).json({ message: err })
        }
        );
}

// getRestaurantByCity function to return restaurants by Id
exports.getRestaurantById = (req, res, next) => {
    const resId = req.params.resId;
    const result = Restaurant.filter(item => item._id == resId);
    res.status(200).json({ message: "Restaurant Fetched Sucessfully", restaurant: result })
        .catch(err => {
            res.status(500).json({ message: err })
        }
        );
}