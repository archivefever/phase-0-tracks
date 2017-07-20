# Virus Predictor

# I worked on this challenge [by myself, with: David Skaggs ].
# We spent 2 hours on this challenge.

# EXPLANATION OF require_relative
# Require_relative is keyword that indicates a file whose code is to be made available in the new file. Require_relative differs from require because require needs a full path to the file it references, whereas require_relative looks only in the local directory.
#
require_relative 'state_data'

class VirusPredictor

# Method is responsible for initializing class and taking data from the hash and assigning it to instance variables.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

# Method calls two methods defined below.
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

# Method takes data from the state hash and printing out what the estimated number of deaths will be; analyzes population density to determine the number of deaths by state.
  def predicted_deaths
    # (population_density, population, state)
    # predicted deaths is solely based on population density

    if @population_density >= 200
      multiplier = 0.4
    elsif @population_density >= 150
      multiplier = 0.3
    elsif @population_density >= 100
      multiplier = 0.2
    elsif @population_density >= 50
      multiplier = 0.1
    else
      multiplier = 0.05
    end
    number_of_deaths = (@population * multiplier).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# Method takes data from hash and outputs how fast the virus will spread by speed, based on population density.
  def speed_of_spread
  # (population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
STATE_DATA.each do |state, pop_data|
state = VirusPredictor.new(state, pop_data[:population_density], pop_data[:population])
state.virus_effects
end

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

#=======================================================================
# Reflection Section

The hash rocket (=>) separates the string keys and values (which are hashes and defined with brackets) in the first syntax, while in the second symbols are used as keys, which obviates the need for a hash rocket or brackets -- the hash can be declared with commas only.

Require_relative is keyword that indicates a file whose code is to be made available in the new file. Require_relative differs from require because require needs a full path to the file it references, whereas require_relative looks only in the local directory.

Methods such as .each, .each_key, .each_pair, and .each_value can be used to iterate through hashes and perform functions with the key/value data collected from the hash. The .map method can be used to iterate through a hash but it will evaluate to an array. The .map! method therefore is not available to hashes.

The variables (arguments) which were fed into virus_effects struck me as unnecessary since the methods already had access to the instance variables which are available throughout the class.

I really appreciated Davina's advice about refactoring -- that it's not so much the number of lines of code that need to be considered, but how many operations the computer will be performing.

=end