// Reverse
// reverse("hello") => "olleh"
// Declare an empty string variable
// Set a counter to (word length - 1)
// Iterate through the string (as an array)
// For each index position counting down from (string length - 1) to 0, add the character at that index to the new string
// Subtract one from the counter
// Return the new string

function reverse(str) {
var backWord = "";

for (var i = str.length-1; i >= 0 ; i-=1) {
  backWord += str[i];
}
  return backWord;
}

console.log(reverse("hello"));
