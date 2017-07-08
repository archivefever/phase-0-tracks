
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