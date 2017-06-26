#Clint Thacker
#CHI Nighhawks
#Vampire Detection program

puts "Number of employees to be processed:"
count = gets.chomp.to_i

until count == 0
  puts "Name:"
  name = gets.chomp
  puts "Age:"
  age = gets.chomp.to_i
  puts "Birth year:"
  birth_year = gets.chomp.to_i
  true_age = 2017 - birth_year
  puts "Enjoy some delicious garlic bread? (y/n)"
  garlic_bread = gets.chomp
  puts "Enroll in our mortal health insurance plan? (y/n)"
  insurance = gets.chomp

  puts "Please name any allergies (enter 'done' when finished):"
  while user_input = gets.chomp
    case user_input
    when "done"
      allergy_test_passed = true
      break
    when "sunshine"
      allergy_test_passed = false
      break
    end
  end
  puts

  if age == true_age
    age_test_passed = true
  else
    age_test_passed = false
  end

  if garlic_bread == "y" || garlic_bread == "yes"
    garlic_test_passed = true
  else
    garlic_test_passed = false
  end

  if insurance == "y" || insurance == "yes"
    insurance_test_passed = true
  else
    insurance_test_passed = false
  end

print "RESULT: "

  if !allergy_test_passed
    puts "Probably a vampire."
  elsif name == "Drake Cula" || name == "Tu Fang"
    puts "Definitely a vampire."
  elsif !age_test_passed && !garlic_test_passed && !insurance_test_passed
    puts "Almost certainly a vampire."
  elsif !age_test_passed && (!garlic_test_passed || !insurance_test_passed)
    puts "Probably a vampire."
  elsif age_test_passed && garlic_test_passed && insurance_test_passed
    puts "Probably not a vampire."
  else
    puts "Results inconclusive."
  end
  puts
  count -= 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."