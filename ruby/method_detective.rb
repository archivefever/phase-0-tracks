# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

p "iNvEsTiGaTiOn".swapcase
p "iNvEsTiGaTiOn".swapcase!
# => “InVeStIgAtIoN”


p "zom".insert(1, 'o')
p "zom".insert(2, 'o')
p "zom".gsub(/[o]/, 'oo')
# => “zoom”

p "enhance".center(15)
p "enhance".insert(0, "    ").insert(-1, "    ")
p "enhance".rjust(11).ljust(15)
# => "    enhance    "

p "Stop! You’re under arrest!".upcase
p "Stop! You’re under arrest!".upcase!
p "Stop! You're under arrest!".tr('abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
# => "STOP! YOU’RE UNDER ARREST!"

p "the usual".insert(-1, " suspects")
p "the usual".insert(9, " suspects")
p "the usual" << " suspects"
p "the usual".gsub(/[l]/, "l suspects")
#=> "the usual suspects"

p " suspects".insert(0, "the usual")
p " suspects".prepend("the usual")
p " suspects".gsub(/[ ]/, "the usual ")
# => "the usual suspects"

p "The case of the disappearing last letter".chop
p "The case of the disappearing last letter".chop!
p "The case of the disappearing last letter"[0..-2]
# => "The case of the disappearing last lette"

p "The mystery of the missing first letter"[1..-1]
p "The mystery of the missing first letter".reverse.chop.reverse
# => "he mystery of the missing first letter"

p "Elementary,    my   dear        Watson!".squeeze(" ")
p "Elementary,    my   dear        Watson!".squeeze!(" ")
p "Elementary,    my   dear        Watson!".tr_s(' ', ' ')
# => "Elementary, my dear Watson!"

p "z".ord
# => 122
# (What is the significance of the number 122 in relation to the character z?)

p "How many times does the letter 'a' appear in this string?".count('a')
# => 4