 use classdatabase
 db.movie.insert({"title": "EndGame"})
 db.movie.insertMany( [{"title":"Ghajini","hero":"surya","year":2000,"director":"mani ratnam"},{"title":"Adheera","hero":"Shahru khan","year":2001,"director":"mani ratnam"},{"title":"Singham","hero":"Ajay Devgan","year":2007,"director":"SS Rajmouli"},{"title":"Bahubali","hero":"Prabhas","year":2017,"director":"SS Rajmouli"} ] );
 db.movie.find()
 db.movie.find().pretty()
 db.movie.find({"hero": "surya"}).pretty()
 db.movie.find({"hero": "Prabhas"}).pretty()
 db.movie.find({"director": "SS Rajmouli"}).pretty()
 db.movie.update({"title" : "Singham"}, {$set: {"director": "Rohit Shetty"}})
 db.movie.remove({"title" : "Singham"})

use classdatabase
 db.inventory.insertMany([
   { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "A" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
   { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
   { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" }
]);

SELECT * FROM inventory WHERE status = "D"
db.inventory.find( { status: "D" } ).pretty()

SELECT * FROM inventory WHERE status in ("A", "D")
db.inventory.find( { status: { $in: [ "A", "D" ] } } ).pretty()

SELECT * FROM inventory WHERE status = "A" AND qty < 30
db.inventory.find( { status: "A", qty: { $lt: 30 } } ).pretty()

SELECT * FROM inventory WHERE status = "A" OR qty < 30
db.inventory.find( { $or: [ { status: "A" }, { qty: { $lt: 30 } } ] } ).pretty()

SELECT * FROM inventory WHERE status = "A" AND ( qty < 30 OR item LIKE "p%")

db.inventory.find( {
     status: "A",
     $or: [ { qty: { $lt: 30 } }, { item: /^p/ } ]
} ).pretty()


Querrying on Nested Objects
db.inventory.find( { size: { h: 14, w: 21, uom: "cm" } } ).pretty()

db.inventory.find( { "size.uom": "in" } ).pretty()

db.inventory.find( { "size.h": { $lt: 15 } } ).pretty()

db.inventory.find( { "size.h": { $lt: 15 }, "size.uom": "in", status: "D" } ).pretty()

