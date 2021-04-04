require_relative 'Linkedlist'
require_relative 'variable_dict.rb'
require_relative 'Node'

# A class for all the instructions in SPL

class Instructions
  # function that implements NEWID
  def self.new_id(dict, splobj)
    dict.add_to_dict(splobj.spl[splobj.pc][0])
  end
  # abstract function that implements COMBINE

  def combine_ins(obj); end

  # abstract function that implements COPY

  def deep_copy(obj); end

  # abstract function that implements HEAD

  def head(obj); end

  # abstract function that implements TAIL

  def tail(obj); end

  #  function that implements ASSIGN

  def assign_ins(i)
    self.first = self.last = Node.new
    self.first.value = i
    self.first.next = self.last.next = nil
    self.type = 'int'
  end

  #  function that implements CHS

  def chs
    self.first.value = -self.first.value
  end

  #  function that implements ADD

  def add_ins(obj)
    self.first.value = self.first.value + obj.first.value
    obj.type = 'int'
    self.type = 'int'
  end

  # abstract function that implements IF

  def if_ins(i,spl); end

end