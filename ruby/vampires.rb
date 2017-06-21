#Vampire Detection program

puts "Name:"
name = gets.chomp
puts "Age:"
age = gets.chomp.to_i
puts "Birth year:"
birth_year = gets.chomp.to_i
true_age = 2017 - birth_year
puts "Enjoy some delicious garlic bread? (y/n)"
garlic_bread = gets.chomp
puts "Enroll in health insurance? (y/n)"
insurance = gets.chomp

if age != true_age
  age_test_passed = true
end

if garlic_bread == "y"
  garlic_test_passed = true
end

if insurance == "y"
  insurance_test_passed = true
end

if age_test_passed && garlic_test_passed && insurance_test_passed
  puts "Probably not a vampire."
elsif !age_test_passed && (!garlic_test_passed || !insurance_test_passed)
  puts "Probably a vampire."
elsif name == "Drake Cula" || name == "Tu Fang"
  puts "Definitely a vampire."
else
  puts "Results inconclusive."
end