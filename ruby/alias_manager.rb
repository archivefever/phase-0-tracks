=begin

Clint Thacker
CHI Nighthawks

 Pseudo code and write a method that takes a spy's real name and creates a fake name

  -reverse first/last name orer
  -change the vowels to the next vowel in 'aeiou'
  -change the consonants to the next consonant in the alphabet

- define variables:
  alpha = ('a'..'z').to_a
  vowels = ["a", "e", "i", "o", "u"]
  consonants = alpha - vowels

- write an encoder method for shifting index one forward for each character fed into either vowel array or the consonat array
  - loop through array, accounting for edge cases ("z" -> "b" and "u" -> "a")
  - if character is 'aeiou' (using vowels.include?(#character)) then shift foward one index in vowel array
  - otherwise shift forward one index in consonant array

- add the characters to an empty string so that the method evaluates to a string

#######

- Convert name string ("Clint Thacker") to lowercase (.downcase method) and into an array of two strings ("clint", "thacker")
- Break each individual string in the array into its own array consisting of individual characters ("c", "l", "i", "n", "t")

-call encoder method on first name string and capitalize
-call encoder method on last name string and capitalize
- add strings together for final reversed, character-shifted alias name

=end


def spy_interface

  # define method to generate alias name when fed first/last name
  def alias_generator(name)

    # define method for encoding individual strings
    def encoder(split_name)
      # intialize variables
      alpha = ('a'..'z').to_a
      vowels = ["a", "e", "i", "o", "u"]
      consonants = alpha - vowels
      result = ""

      # loop through array, shifting vowels and consonants
      # account for edge cases
      split_name.map! do |character|
        if vowels.include?(character)
          if character == "u"
            character = "a"
          else
            character = vowels[vowels.index(character) + 1]
          end
        else
          if character == "z"
            character = "b"
          else
            character = consonants[consonants.index(character) + 1]
          end
        end
      end
      # method will evaluate as encoded string
      split_name.join("")
    end

    # Split name into two arrays of individual lower-case characters
    # Reverse order of first and last names
    first_code_name = name.downcase.split(' ')[1].split('')
    last_code_name = name.downcase.split(' ')[0].split('')

    # Method evaluates to capitalized string names
    encoder(first_code_name).capitalize + " " + encoder(last_code_name).capitalize
  end

  # DRIVER CODE

  # Initiliaze variables for prompt, spy input, and empty arrays
  prompt = ">"
  spy_input = ""

  enigma_list = {}

  # Ask user for names to be encoded
  puts "Please enter names to be encoded (type 'quit' when finished):"

  # Loop until user enters quit
  while spy_input != "quit"
      print prompt
      spy_input = gets.chomp
      if spy_input != "quit"
        # Disregard input of enter only
        if !spy_input.empty?
          # Store user input and new alias in hash
          enigma_list.store(spy_input, alias_generator(spy_input))
        end
      end
  end

  # Iterate through the hash printing true name and spy name together

  enigma_list.each { |true_name, spy_name| puts "#{true_name} is also known as #{spy_name}." }

end


spy_interface