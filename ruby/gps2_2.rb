# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # Use .split(' ') the string into an array
  # Declare empty hash
  # Iterate over the array and store its values as keys in the new hash with all values set a default ("unknown", nil)
  # Set default quantity using with quantity = "unknown"/nil
  # Print the list to the console
  # Output the has to console so that method evaluates to the hash
# output: hash of item key values with quantity

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: Create a method that takes a list (hash), an item, and an optional quantity and stores them as a key/value pair in the list(hash)
# output: the new hash with the added item

# Method to remove an item from the list
# input: list, item name
# steps: Create a method that deletes a key from a hash
# hash.delete(item name)
# output: an update hash with the item deleted

# Method to update the quantity of an item
# input: list, item name, new quantity
# steps: Create a method that takes a hash and replaces for the key of item, replaces the value with the new value fed into the method
# output: an updated hash

# Method to print a list and make it look pretty
# input: list (hash)
# steps: Iterate over the hash and print its keys and values in a user friendly way
# output: prints the list(puts)


#Create a list

require 'colorize'

def create_list(list)
  new_array = list.split(' ')
  grocery_list = {}
  new_array.each { |item| grocery_list[item] = "Unknown" }
  p grocery_list
end

grocery_list = create_list("carrots apples cereal pizza")

def add_item(list, new_item, quantity="Unknown")
  list[new_item] = quantity
  list
end

add_item(grocery_list, "lemonade", 2)
add_item(grocery_list, "tomatoes", 3)
add_item(grocery_list, "onions", 1)
add_item(grocery_list, "ice cream", 4)

p grocery_list

def remove_item(list, item)
  list.delete(item)
  list
end

p remove_item(grocery_list, "lemonade")

def update_quantity(list, item, new_quantity)
  list[item] = new_quantity
  list
end

p update_quantity(grocery_list, "ice cream", 1)

def print_list(list)
  list.each { |item, quantity| puts "Item: #{item.blue}, Amount: #{quantity}" }
end

print_list(grocery_list)

=begin

Release 4: Reflect

I learned that pseudocode is meant to look more like actual code than I had previously thought, employing the same keywords etc.

It seems clear that a hash is the best data structure for storing the items, since they need to have an optional quantity. An array is necessary as intermediate stage to split the string into item components.

A method returns whatever the last line in the method evaluates to.

Methods can take many types of objects as arguments: strings, integers, booleans, other method calls.

Information can be passed between methods by passing the method calls themselves into new methods as an argument. Whatever a particular method evaluates to can also be stored as a variable, and then that variable can be passed into a new method.

I think my major takeway from this assignment was the tip Ian showed us about using command B to run code from Sublime. A simple but, for me, revelatory tip. I has also forgotten how to set an optional parameter with a default value. On the other had, my pseudocoding still needs a great deal of work.

=end