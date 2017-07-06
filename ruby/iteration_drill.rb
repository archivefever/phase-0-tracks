# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----

zombie_apocalypse_supplies.each { |supply| print supply + "*"}


# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----


=begin I understand my solution fails to preserve the capitalization of 'CB radio.'' I thought I should use a temporary variable and was attempting the following but it would only enter an infinite loop:

def alpha_sort(ary)
  change_made = true

  while change_made
    change_made = false
   sorted_array = ary[0...-1].each_with_index do |supply, index|

      # working with a temporary variable to ignore the case
      temp_supply = supply.downcase

      if temp_supply > ary[index+1]
        ary[index], ary[index+1] = ary[index+1], ary[index]
        change_made = true
      end
    end
  end
  sorted_array
end

=end

def alpha_sort(ary)
  change_made = true

  while change_made
    change_made = false
   sorted_array = ary[0...-1].each_with_index do |supply, index|
      supply.downcase!
      if supply > ary[index+1]
        ary[index], ary[index+1] = ary[index+1], ary[index]
        change_made = true
      end
    end
  end
  sorted_array
end

p alpha_sort(zombie_apocalypse_supplies)



# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----
def on_list(search_item)

  zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]
  item_included = false

  zombie_apocalypse_supplies.each do |supply|
  if supply == search_item
    item_included = true
  end
  end

  return item_included

end

p on_list("water jug")
p on_list("compass")
p on_list("hamburger")

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----

zombie_apocalypse_supplies.each do
  if zombie_apocalypse_supplies.length > 5
    zombie_apocalypse_supplies.delete_at(zombie_apocalypse_supplies.length - 1)
  end
end



# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----

combined_supplies_list = (zombie_apocalypse_supplies + other_survivor_supplies).uniq

p combined_supplies_list

# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----

extinct_animals.each { |animal, year| print "#{animal}-#{year}*" }

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----
extinct_animals.each do |animal, year|
  if year >= 2000
    extinct_animals.delete(animal)
  end
end

p extinct_animals

# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----

extinct_animals.each do |animal, year|
  extinct_animals.store(animal, year - 3)
end

p extinct_animals


# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----
def check_if_extinct(queried_animal)

    extinct_animals = {
    "Tasmanian Tiger" => 1936,
    "Eastern Hare Wallaby" => 1890,
    "Dodo" => 1662,
    "Pyrenean Ibex" => 2000,
    "Passenger Pigeon" => 1914,
    "West African Black Rhinoceros" => 2011,
    "Laysan Crake" => 1923
  }
  condition = false

  extinct_animals.each_key do |animal|
    if animal == queried_animal
      condition = true
    end
  end
  p condition
end

check_if_extinct("Andean Cat")
check_if_extinct("Dodo")
check_if_extinct("Saiga Antelope")


# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----
p extinct_animals.assoc("Passenger Pigeon")
extinct_animals.delete("Passenger Pigeon")

p extinct_animals