require_relative 'Linkedlist'

# A class that implements a dictionary to store variables

class VariableDict
  attr_accessor :var_dictionary
  attr_reader :num_var

  def initialize
    @num_var = 0
    @var_dictionary = {}
  end

  # function that adds variables used with NEWID to dictionary

  def add_to_dict(x)
    @var_dictionary[x] = Linkedlist.new
    @num_var += 1
  end
end