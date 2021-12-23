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

Data for Movies collection
db.movies.insertMany([{"_id":{"$oid":"61c493b6ad34514db40fb762"},"title":"Titanic","year":1997,"genres":["Drama","Romance"],"rated":"PG-13","languages":["English","French","German","Swedish","Italian","Russian"],"released":{"$date":"1997-12-19T00:00:00Z"},"awards":{"wins":127,"nominations":63,"text":"Won 11 Oscars. Another 116 wins & 63 nominations."},"cast":["Leonardo DiCaprio","Kate Winslet","Billy Zane","Kathy Bates"],"directors":["James Cameron"]},{"_id":{"$oid":"61c493b6ad34514db40fb763"},"title":"The Dark Knight","year":2008,"genres":["Action","Crime","Drama"],"rated":"PG-13","languages":["English","Mandarin"],"released":{"$date":"2008-07-18T00:00:00Z"},"awards":{"wins":144,"nominations":106,"text":"Won 2 Oscars. Another 142 wins & 106 nominations."},"cast":["Christian Bale","Heath Ledger","Aaron Eckhart","Michael Caine"],"directors":["Christopher Nolan"]},{"_id":{"$oid":"61c493b6ad34514db40fb764"},"title":"Spirited Away","year":2001,"genres":["Animation","Adventure","Family"],"rated":"PG","languages":["Japanese"],"released":{"$date":"2003-03-28T00:00:00Z"},"awards":{"wins":52,"nominations":22,"text":"Won 1 Oscar. Another 51 wins & 22 nominations."},"cast":["Rumi Hiiragi","Miyu Irino","Mari Natsuki","Takashi Naitè"],"directors":["Hayao Miyazaki"]},{"_id":{"$oid":"61c493b6ad34514db40fb765"},"title":"Casablanca","genres":["Drama","Romance","War"],"rated":"PG","cast":["Humphrey Bogart","Ingrid Bergman","Paul Henreid","Claude Rains"],"languages":["English","French","German","Italian"],"released":{"$date":{"$numberLong":"-850176000000"}},"directors":["Michael Curtiz"],"awards":{"wins":9,"nominations":6,"text":"Won 3 Oscars. Another 6 wins & 6 nominations."},"lastupdated":"2015-09-04 00:22:54.600000000","year":1942}])

Projections:

db.movie.find( { }, { "title": 1, "director": 1, "year": 1 } );

Query: I want the directors name in which surya had acted
db.movie.find( { "hero": "surya"} , { "director": 1, "_id": 0} );

db.movie.find( { "hero": "surya"} , { "director": 1,"year": 1, "_id": 0} );


Query: I want the actors name in which mani ratnam is the director
db.movie.find( { "director": "mani ratnam"} , { "hero": 1, "_id": 0} );



Aggregations:

db.movies.aggregate( [
   { $unwind: "$genres" },
   {
     $group: {
       _id: "$genres",
       genreCount: { $count: { } }
     }
   },
   { $sort: { "genreCount": -1 } }
] )

db.movies.aggregate( [
{ $unwind: "$genres" }
])
