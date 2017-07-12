# CLINT THACKER
# CHI Nighhawks

require_relative 'password'

prompt = ">"
separator = "---------------------------------"

puts "Welcome to PassWord ..."
game = PassWord.new

puts
puts "Spymaster: please enter the secret word:"
print prompt
game.target_word = gets.chomp
puts

game.guesses_available = game.target_word.length + 3

puts "Here is the board:"
puts game.set_board
puts
puts "You can only miss #{game.guesses_available} guesses."
puts "Good luck!"
puts


until game.guess_count == game.guesses_available
  puts separator
  puts "Board:"
  puts game.current_board.join(' ')
  puts
  puts "Guess a letter:"
  print prompt
  letter_guess = gets.chomp
  puts
  if game.guess_database.include?(letter_guess)
    puts "You already guessed that!"
    puts "You still have #{game.guesses_available} guesses left."
    puts
  else
    if game.check_letter(letter_guess)

      game.change_board(letter_guess)

      if game.game_victory then break end
      puts "Correct!"
      puts "You still have #{game.guesses_available} guesses left."
    else
      puts "Nope!"
      puts "You have #{game.guesses_available} guesses left."
    end
  end
end
puts

if game.game_victory
  puts "YOU WON!"
else
  puts "GAME OVER, MAN, GAME OVER."
end
puts "The secret word was '#{game.target_word}'."