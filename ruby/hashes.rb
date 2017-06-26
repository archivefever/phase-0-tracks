# create prompt symbol
prompt = ">"

# ask user for name
 puts "Name:"
 print prompt
 user_name = gets.chomp

 # ask user for age
puts "Age:"
print prompt
user_age = gets.chomp.to_i

# ask user for number of children
puts "Number of children:"
print prompt
user_children = gets.chomp.to_i

# ask user for decor theme
puts "Preferred decor theme:"
print prompt
user_decor = gets.chomp

# ask user for email address
puts "Email address:"
print prompt
user_email = gets.chomp

# ask user about interest in newsletter
puts "Interested in receiving our newsletter? (y/n)"
print prompt
user_newsletter = gets.chomp
# convert user answer to boolean
if user_newsletter == "y"
  user_newsletter = true
else
  user_newsletter = false
end

# declare hash of customer information
customer_profile = {

  name: user_name,
  age: user_age,
  children: user_children,
  decor_theme: user_decor,
  email: user_email,
  newsletter: user_newsletter
}

# display customer profile hash to be checked
puts customer_profile
puts

# give customer an opportunity to update any incorrect information
puts "Please enter any key to update or 'none':"
print prompt
user_update = gets.chomp.to_sym

# if user enters none, end program
# otherwise ask user for hash key to be updated
if user_update != :none
  puts "Please enter the new value:"
  print prompt
  # store new new value of requested key in a variable
  new_value = gets.chomp

  # store new value as appropriate data type
  if user_update == :age || user_update == :children
    new_value = new_value.to_i
  elsif user_update == :newsletter
    if new_value == "y" || new_value == "true"
      new_value = true
    else
      new_value = false
    end
  end

  # update hash key with new value
  customer_profile.store(user_update, new_value)

  # display final version of customer profile hash
  puts customer_profile
end