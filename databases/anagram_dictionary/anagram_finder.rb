
require 'sqlite3'

$dictionary = SQLite3::Database.new("dictionary.db")
$dictionary.results_as_hash = true

def generate_prime_lookup
  create_pd_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS prime_lookup(
      id INTEGER PRIMARY KEY,
      prime_id INT,
      word VARCHAR(255)
      )
    SQL

  $dictionary.execute(create_pd_cmd)
end

def prime_lookup_installed?
  table = $dictionary.execute(" SELECT * from sqlite_master WHERE name='prime_lookup' AND type='table' ")
  table.length > 0
end

def generate_wordbank
  create_wordbank_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS wordbank(
      id INTEGER PRIMARY KEY,
      word VARCHAR(255),
      multiple_anagrams_found BOOLEAN,
      sqltime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
      UNIQUE(word)
      )
    SQL

  $dictionary.execute(create_wordbank_cmd)
end

# TRANSLATES STRING TO PRIME MULTIPLE VALUE
def word_to_prime(word)
  primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
  alpha = ('a'..'z').to_a

  prime_key = Hash[*alpha.zip(primes).flatten]
  word_value = 1
  word.split('').each do |letter|
    if prime_key.include?(letter)
      word_value = word_value * prime_key[letter]
    end
  end
  word_value
end

def generate_prime_hash_database

  dictionary_array = $dictionary.execute("SELECT word FROM entries")

  words = []
  prime_hash = {}

# GENERATE AN ARRAY OF ALL DICTIONARY WORDS IN LOWER CASE
  dictionary_array.each do |el|
    words << el['word'].downcase
  end

# GENERATE PRIME VALUE FOR WORDS AND MATCH PRIME VALUES TO MULTIPLE WORDS (ARRAY) IN A HASH
  words.each do |word|
    if prime_hash.include?(word_to_prime(word))
      prime_hash[word_to_prime(word)] << word
    else
      prime_hash[word_to_prime(word)] = []
      prime_hash[word_to_prime(word)] << word
    end
  end

# REMOVE DUPLICATES AND CONVERT ARRAY TO STRING
# STRING WILL BE STORED IN SQLITE BECAUSE IT DOESN'T SUPPORT ARRAYS
 prime_hash.each do |prime_id, array_to_word_string|
    array_to_word_string.uniq!
      prime_hash[prime_id] = array_to_word_string.join(' | ')
  end

# STORES PRIME HASH VALUES IN DATABASE
  prime_hash.each do |prime_id, word_list|
    $dictionary.execute("INSERT INTO prime_lookup (prime_id,  word) VALUES (?, ?)", [prime_id, word_list])
  end
end


# RETURNS AN ARRAY OF THE ANAGRAMS
def retrieve_anagrams(string)
  found_anagrams = $dictionary.execute("SELECT word FROM prime_lookup WHERE prime_id=#{word_to_prime(string)}")
  if found_anagrams.length > 0
    found_anagrams = found_anagrams.inject(:merge)
    found_anagrams['word'].split(' | ')
  else
    []
  end
end

# RETURNS LIST OF WORDS IN WORDBANK
def wordbank_word_array
  stored_array = $dictionary.execute("SELECT * FROM wordbank")
  word_list = []
  stored_array.each do |hash_entry|
    word_list << hash_entry['word']
  end
  word_list
end

# RETURNS BOOLEAN OF WHETHER WORD HAS BEEN SEARCHED
def searched_before?(string)
  wordbank_word_array.include?(string.downcase)
end

# RETURNS BOOLEAN OF WHETHER ANAGRAMS EXIST
def check_anagram(str)
  retrieve_anagrams(str).length > 0
end

# RETURNS BOOLEAN OF WHETHER MULTIPLE ANAGRAMS EXIST
def check_multiple_anagram(str)
  retrieve_anagrams(str).length > 1
end

# UPDATES WORDBANK WITH NEW WORD
# IF WORD EXISTS, UPDATES TIME STAMP
def add_to_wordbank(word)
  word = word.downcase
  if searched_before?(word)
    $dictionary.execute(" UPDATE wordbank SET sqltime=CURRENT_TIMESTAMP WHERE word='#{word}' ")
  else
    $dictionary.execute("INSERT OR IGNORE INTO wordbank (word, multiple_anagrams_found) VALUES (?, ?) ", [word, "#{check_multiple_anagram(word)}"])
  end
end

# RETURNS HASH OF DEFINITIONS FROM DICTIONARY
def lookup(word)
  entry = $dictionary.execute(" SELECT * FROM entries WHERE word='#{word.downcase.capitalize}' ")
  entry
end

# DISPLAYS USER FRIENDLY VERSION OF DEFINITION ARRAY
def display_definition(definition_array)
  if definition_array.length > 0
    definition_array.each do |definition|
      print definition['word']
      puts " (#{definition['wordtype']})"
      puts definition['definition']
      puts "-----------------------"
    end
  else
    puts "This dictionary contains no definitions of that word."
  end
end

# SELECTS RANDOM DICTIONARY ENTRY FOR WORD OF THE DAY
def word_of_the_day
  daily_word = $dictionary.execute( "SELECT * FROM entries ORDER BY Random() LIMIT 1")
end

# DISPLAYS FOUND ANAGRAMS
def display_anagrams(letters)
  puts "Your word has the following #{retrieve_anagrams(letters).length} anagram(s):"
  retrieve_anagrams(letters).each { |word| puts word}
end

# DISPLAYS WHEN USER LAST SEARCHED LETTERS
def display_last_searched(string, repeat)
  string = string.downcase
  print "You last searched '#{string}': "
  if repeat
    time = $dictionary.execute(" SELECT sqltime FROM wordbank WHERE word='#{string}'")
    puts time[0]['sqltime']
  else
    puts "Never."
  end
end

# RETURNS INTEGER OF HOW MANY WORDS IN WORDBANK
def wordbank_in_dictionary
  matches = $dictionary.execute ( "SELECT entries.word FROM entries CROSS JOIN wordbank ON entries.word = wordbank.word COLLATE NOCASE")
  ary = []
  matches.each do |def_hash|
    ary << def_hash['word']
  end
  ary = ary.uniq
  ary.length
end

# RETURNS INTEGER OF HOW MANY WORDS IN WORDBANK WITH MULTIPLE ANAGRAMS
def wordbank_with_multiple_anagrams
  stored_array = $dictionary.execute(" SELECT multiple_anagrams_found FROM wordbank WHERE multiple_anagrams_found='true' ")
  stored_array.length
end

# DIVIDES VALUES GIVING PERCENT AS A FLOAT
def give_percent(value1, value2)
  ((value1 / value2.to_f) * 100).round(1)
end

# DISPLAYS USER WORDBANK STATISTICS
def display_stats
  puts "Statistics"
  puts "--------------------"
  puts "Your library contains #{wordbank_word_array.length} searched strings."
  puts "#{give_percent(wordbank_in_dictionary, wordbank_word_array.length)} percent of your searched strings were found in the dictionary."
  puts "#{give_percent(wordbank_with_multiple_anagrams, wordbank_word_array.length)} percent of your search strings had multiple anagrams."

end


# DRIVER CODE

generate_wordbank
if prime_lookup_installed?
  puts "Anagram Dictionary is already installed."
else
  puts "Anagram Dictionary was not installed."
  puts "Installing Anagram Dictionary..."
  generate_prime_lookup
  generate_prime_hash_database
end
puts "Anagram Dictionary is now installed."


puts
puts "CLINT'S AMAZING ANAGRAM FINDER"
puts
puts
puts "WORD OF THE DAY"
puts "-----------------------"
display_definition(word_of_the_day)
puts

prompt = ">"
finished = false

until finished
  puts "Please enter your letters:"
  print prompt
  user_letters = gets.chomp
  puts

  repeat = searched_before?(user_letters)
  add_to_wordbank(user_letters)


  if check_anagram(user_letters)
    display_anagrams(user_letters)
  else
    puts "NO ANAGRAMS"
  end

  puts

  display_last_searched(user_letters, repeat)
  puts


  if check_anagram(user_letters)
    valid_input = false
    until valid_input
      puts "Would you like to see the definitions? (y/n)"
      print prompt
      user_answer = gets.chomp.downcase
      puts

      if user_answer == "y" || user_answer == "yes"
        display_definition(lookup(user_letters))
        valid_input = true
      elsif user_answer == "n" || user_answer == "no"
        puts "Obviously you are a lexical wizard."
        valid_input = true
      else
        puts "Please enter y or no..."
        puts
      end
    end
  end

  puts
  display_stats

  puts

  valid_input2 = false
  until valid_input2
  puts "Would you like to search another anagram? (y/n)"
  print prompt
  user_input = gets.chomp
    if user_input == "y" || user_input == "yes"
      valid_input2 = true
    elsif user_input == "n" || user_input == "no"
      finished = true
      valid_input2 = true
    else
      puts "Please enter y or n..."
    end
  end
puts

end

puts
puts "Thanks for using the Anagram Finder!"

