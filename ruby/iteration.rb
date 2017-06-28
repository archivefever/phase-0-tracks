#declare array and hash
food_array = ["cucumber", "tuna", "tomatoes", "sandwiches", "steak"]

my_info = {
  name: "Tim",
  age: "37",
  hometown: "Seattle",
}
#food array .map, .each, !
puts "********************Food Array Methods**********************"
puts " "
puts "********************.each applied***************************"
food_array.each { |food| puts "#{food} is delicious"}

p food_array

puts " "
puts "********************.map! applied***************************"
food_array.map! { |food| food.upcase }

p food_array

puts " "
puts "******************.delete_if applied************************"

food_array.delete_if { |food| food.length > 6}

p food_array
puts " "
puts "******************.select applied***************************"

food_array.select { |food| food.start_with?("T") }

p food_array

puts " "
puts "*****************.reject! applied***************************"

food_array << "EGGPLANT"
food_array << "EGGS"

p food_array

food_array.reject! { |food| food.include?("EGG") }

p food_array

puts " "
puts "********************.drop_while****************************"

numbers = [5, 10, 3, 15]

numbers.drop_while { |number| number % 5 == 0 }

# Manipulate hash

my_info = {
  name: "Tim",
  age: "37",
  hometown: "Seattle",
}


my_info.each_key { |key| p key}

my_info.reject { |key, value| value == "Seattle" }

my_info.reject { |key, value| value == 37 }

my_info.each { |key, value| puts "#{key} is #{value}."}

caps_info = my_info.map { |key, value| value.upcase}

p my_info
p caps_info