# Class that stores the SPL program and maintains a program counter

class Spl_program
  attr_accessor :pc, :s
  attr_reader :spl
  
  def initialize(x)
    @spl = x
    @pc = 0
    @s = @spl.size
    @spl.freeze
  end
end
