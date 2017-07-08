
module Shout

  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    words + "! "+ "Oh joy of joys!"
  end

end

class Auctioneer
  include Shout
end

class Coach
  include Shout
end

sothebys_guy = Auctioneer.new
p sothebys_guy.yell_angrily("Is there no other bid")
p sothebys_guy.yelling_happily("Sold")

coach = Coach.new
p coach.yell_angrily("Bad call")
p coach.yelling_happily("Good hustle")


=begin
module Shout

  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words + "! "+ "Oh joy of joys!"
  end

end

p Shout.yell_angrily("fiddlesticks")
p Shout.yelling_happily("i won")

=end