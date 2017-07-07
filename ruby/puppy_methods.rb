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

end


ajax = Puppy.new

ajax.fetch("plutonium")
ajax.speak(3)
ajax.roll_over
ajax.dog_years(15)
ajax.dance("Tango")
