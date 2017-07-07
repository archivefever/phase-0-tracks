class Santa

  def initialize
    puts "Initializing Santa instance..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good type of #{cookie_type}!"
  end

end

saint_nick = Santa.new
saint_nick.speak
saint_nick.eat_milk_and_cookies("oatmeal")
