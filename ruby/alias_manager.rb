=begin
 pseudo code and write a method that takes a spy's real name and creates a fake name

change the vowels to the next vowel in 'aeiou'
change the consonants to the next consonant in the alphabet

- Convert name string ("Clint Thacker") to lowercase (.downcase method) and into an array of two strings ("clint", "thacker")
- Break each individual string in the array into its own array consisting of individual characters ("c", "l", "i", "n", "t")
define variables:
  alpha = ('a'..'z').to_a
  vowels = ["a", "e", "i", "o", "u"]
  consonants = alpha - vowels

define next_vowel and next_consonant methods

- loop through array
  - if character is 'aeiou' using vowels.include?(#character) then next_vowel method


  - otherwise #some operation to move character forward in character array

Edge cases?



=end



def alias_generator(name)

  # define method for encoding strings
  def encoder(split_name)
    # intialize variables
    alpha = ('a'..'z').to_a
    vowels = ["a", "e", "i", "o", "u"]
    consonants = alpha - vowels
    result = ""

    # loop through array, shifting vowels and consonants
    split_name.map! do |character|
      if vowels.include?(character)
        if character == "u"
          result += "a"
        else
          result += vowels[vowels.index(character) + 1]
        end
      else
        if character == "z"
          result += "b"
        else
          result += consonants[consonants.index(character) + 1]
        end
      end
    end
    # method will evaluate as encoded string
    result
  end

  # Split name into two arrays of individual lower-case characters
  # Reverse order of first and last names
  first_code_name = name.downcase.split(' ')[1].split('')
  last_code_name = name.downcase.split(' ')[0].split('')

  # Method evaluates to capitalized string names
  encoder(first_code_name).capitalize + " " + encoder(last_code_name).capitalize

end

p alias_generator("Felicia Torres")
