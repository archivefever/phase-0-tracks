# CLINT THACKER
# CHI Nighthawks

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