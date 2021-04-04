require_relative 'Spl_program'
class Parser
  attr_accessor :i, :file_array

  def initialize
    super
    @i = 0
    @file_array = []
  end

  def parse(file_obj)
    while i < file_obj.size
      @file_array[i] = file_obj[i].split
      @i += 1
    end
    spl_object = Spl_program.new(@file_array)
    return spl_object
  end
end