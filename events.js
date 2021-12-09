var events = require('events');
var eventEmitter = new events.EventEmitter();

//Create an event handler:
var myEventHandler = function () {
  console.log('I got an event');
}

var showAlertBox = function () {
    console.log('From showAlertBox');
}

//Assign the event handler to an event:
eventEmitter.on('test-event', myEventHandler);

eventEmitter.on('test-event', showAlertBox);

setTimeout(function(data) {
    eventEmitter.emit('test-event');
}, 5000, 'funky');

//Fire the 'scream' event:
