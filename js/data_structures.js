// Create two separate arrays

var colors = ["blue", "red", "green", "silver"];
var horses = ["Bob", "Michelle", "Jessica", "Billy Ray"];

colors.push("yellow");
horses.push("Richard");

// Combine the two arrays, names as indentifier names and keys as properties
var combine = {}
for (i = 0; i < horses.length; i++) {
  combine[horses[i]] = colors[i];
}

console.log(combine);

// Create multiple of cars

function Car(type, color, speed) {
  console.log("Our new car:", this);

  this.type = type;
  this.color = color;
  this.speed = speed;

  this.honk = function() {console.log("Honk! Honk!"); };

  console.log("Cars initialization complete!");
};

var ourCar = new Car("Telsa", "red", 100);
console.log(ourCar);
console.log("Our car can honk:");
ourCar.honk();
console.log("---");

var ourCar2 = new Car("Lexus", "black", 150);
console.log(ourCar2);
console.log("Our car can honk:");
ourCar2.honk();
console.log("---");

var ourCar3 = new Car("Sab", "silver",80);
console.log(ourCar3);
console.log("Our car can honk:");
ourCar3.honk();
console.log("---");

for (var prop in ourCar3) {
  console.log(`ourCar3.${prop} = ${ourCar3[prop]}`);
}

// Literal constructions are often used for when an object is storing data
// Function objects are often used when objects need to perform or have behaviors