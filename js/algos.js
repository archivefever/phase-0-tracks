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
