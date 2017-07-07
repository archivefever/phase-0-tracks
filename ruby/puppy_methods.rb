class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(command_number)
    command_number.times { puts "Woof!" }
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(human_years)
    human_years * 7
  end

  def dance(song)
    puts "*puppy miraculously speaks*: 'I don't know the #{song}!'"
  end

  def initialize
    puts "Initializing new puppy instance..."
  end

end


ajax = Puppy.new

ajax.fetch("plutonium")
ajax.speak(3)
ajax.roll_over
ajax.dog_years(15)
ajax.dance("Tango")


class Baker

  def initialize(baker_number)
    @name = "Baker ##{baker_number + 1}"
  end

  def crack_eggs(eggs)
    eggs.times { puts "*egg cracks*"}
  end

  def convert_ounces_to_grams(ounces)
    ounces * 28
  end

  def weigh_flour
    puts "*flour is everywhere*"
  end

end

baker_array = Array.new(50){ |i| Baker.new(i) }

p baker_array

baker_array.each do |baker|
  baker.crack_eggs(2)
  baker.convert_ounces_to_grams(3)
  baker.weigh_flour
end
