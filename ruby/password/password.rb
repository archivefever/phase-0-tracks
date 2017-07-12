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
