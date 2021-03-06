class Santa

  attr_reader :ethnicity
  attr_accessor :gender, :age

  def initialize (gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good type of #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.delete(reindeer_name)
    @reindeer_ranking.insert(-1, reindeer_name)
  end

end

latina_santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
latina_santa_names = ["Sofia", "Isabella", "Valentina"]

latina_santa_names.each do |reindeer|
  latina_santas << Santa.new("female", "Latina")
end

p latina_santas

clint = Santa.new("male", "white")

clint.celebrate_birthday
p clint

clint.get_mad_at("Vixen")
p clint

clint.gender = "gender fluid"
p clint

p clint.age
p clint.ethnicity

many_santas = []
diverse_santas = []

# one method
10.times {many_santas << Santa.new("male", "white")}

p many_santas

# another method of doing this
diverse_santas = Array.new(500){ Santa.new(example_genders.sample, example_ethnicities.sample) }
p diverse_santas.size

p diverse_santas

diverse_santas.each do |santa|
  santa.age = rand(141)
end

p diverse_santas