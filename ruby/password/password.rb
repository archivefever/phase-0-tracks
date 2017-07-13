=begin
CLINT THACKER
CHI Nighthawks

Password Game Pseudocode

Define class PassWord

Write an initialize method that sets target word, current board, guesses available, guess count, list of guesses, and game victory variables to defaults.

Use attr_reader and attr_accessor keywords to make the appropriate variables readable and/or writable.

Write a method that converts the target word to an array and maps over the array creating a board of blanks or underscores corresponding to the number of characters in the target word. The resulting array will need to be reconverted into a string.

Write a method that checks the user's guess against the target word and stores that guess in an array.
  IF the target word includes the guess, return true.
  ELSE return false, and subtract 1 from the guesses available.

Write a method that changes the board with a correct guess by iterating through the target word character array and returning the indices of any matching characters. At each index number of the board, the blank will then be changed to the letter guess.
  IF the current board matches the completed target word, the game victory variable will be set to true.
In any case, the method should return the value of the current board.

=end

class PassWord

  attr_reader :current_board, :game_victory, :guess_count, :guess_database
  attr_accessor :target_word, :guesses_available

  def initialize
    @target_word = ""
    @current_board = []
    @guesses_available = 0
    @guess_count = 0
    @game_victory = false
    @guess_database = []
  end

  def set_board
    @current_board = @target_word.split('').map { |letter| letter = "_"}
    @current_board.join(' ')
  end

  def check_letter(letter_guess)
    @guess_database << letter_guess
    if @target_word.include?(letter_guess)
      true
    else
      @guesses_available -= 1
      false
    end
  end

  def change_board(letter_guess)
    letter_position = @target_word.split('').each_index.select { |letter| @target_word[letter] == letter_guess}

    letter_position.each { |position| @current_board[position] = letter_guess }

    if @current_board == @target_word.split('')
      @game_victory = true
    end
    @current_board
  end
end

# Game Interface

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