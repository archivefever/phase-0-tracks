// Javascript array sort
// Set maxLength = 0
// Set longestWord = ""
// Use a for statement to iterate through the array
// For each index item
//  IF the string length is greater than maxLength, store the string at that index position as longest_word
// Return the variable longestWord

function sorter(ary) {
  var maxLength = 0;
  var longestWord = "";

  for(var i=0; i < ary.length; i++){
    if(ary[i].length > maxLength){
      var maxLength = ary[i].length;
      longestWord = ary[i];
    }
  }
  return longestWord;
}
testArray1 = ["long phrase","longest phrase","longer phrase"];
testArray2 = ["my", "name", "is", "clint", "hi"];

console.log(sorter(testArray1));
console.log(sorter(testArray2));

// Release 2

// Write a function that takes two objects and checks to see if the objects share at least one key-value pair.

// yourFunction({name: "Steven", age: 54}, {name: "Tamir", age: 54}); #  true
// yourFunction({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}); #  true

// input: two objects
// Convert the keys of the object to an array with Object.keys
// Convert he values of the object an array with Object.values
// Declare a share_item variable and set it to false
// Iterate through the array of keys (using it's length as the limit in the for loop)
//    IF the key array of the first object (at that index) matches the key array of the second object at that index
//      THEN compare the value array at that index of the two objects in the same way
//        IF both matches are made, set the share_item variable to true
// Return the value of share_item
// output: boolean (true/false)

var example1 = {name: "Steven", age: 54};
var example2 = {name: "Tamir", age: 54};
var counterExample = {birthday: "may", smokes: false};


function Sorter(control, test) {
  var share_item = false;
  for (var i=0; i < Object.keys(control).length; i++) {
    if (Object.keys(control)[i] === Object.keys(test)[i]) {
      if (Object.values(control)[i] === Object.values(test)[i]) {
        var share_item = true;
      }
    }
  }
  return share_item;
}

console.log(Sorter(example1, counterExample));
console.log(Sorter(example1, example2));