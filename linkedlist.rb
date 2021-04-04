require_relative 'Node'
require_relative 'Instructions'
require 'objspace'

# Linked list class that inherits Instructions class

class Linkedlist < Instructions
  attr_accessor :first, :last, :size, :type

  # @first and @last default to nil, @size initialized to zero
  def initialize
    @size = 0
    @type = 'list'
  end

  # A function to add a node to linked list, used in deep copy.

  def addToList(x)
    if @first.nil? # Queue empty? new node is both first and last
      @first = @last = Node.new_x x
    else
      @last.next = Node.new_x x # Otherwise insert at back and update @last
      @last = @last.next
    end
    @size += 1                        # Update @size
    self                              # Return receiver to enable cascading of enqueue calls
  end

  # implementation of COMBINE instruction

  def combine_ins(obj)
    super
    if obj.type != 'list'
      temp = Node.new_x(obj.first.value)
      temp.next = self.first
      self.first = temp
    else
      temp = Node.new_x(obj)
      temp.next = self.first
      self.first = temp
    end
    @size += 1
  end

  # implementation of HEAD instruction

  def self.head1(obj1,obj2)
    if obj1.first.nil?
      obj1.first = obj1.last = Node.new
    end
    if obj2.first.value.is_a? Linkedlist
      obj1 = obj2.first.value
      return obj1
    else
      obj1.first.value = obj2.first.value.to_int
      obj1.first.next = nil
      obj1.last = obj1.first
      obj1.size = 1
      return obj1
    end
  end

  # implementation of COPY with recursion

  def deep_copy(obj)
    super
    n = obj.first
    until n.nil? do
      if n.value.is_a? Linkedlist
        k = Linkedlist.new
        self.addToList(k.deep_copy(n.value))
      else
        self.addToList(n.value)
      end
      n = n.next
    end
    return self
  end

  # implementing an IF clause for SPL

  def if_ins(i,spl)
    if self.create_arr == [] or self.create_arr == [0]
      spl.pc = i
      return spl
    else
      spl.pc += 1
      return spl
    end
  end

  # implementing TAIL instruction

  def tail(obj)
    n = obj.first
    self.first = n.next
    self.last = obj.last
    self.size = obj.size
  end

  # A function to get an array representation of linked list for the purpose of printing.

  def create_arr
    k = []
    n = self.first
    until n.nil? do
      if n.value.is_a? Linkedlist
        k.append(n.value.create_arr)
      else
        k.append(n.value)
      end
      n = n.next
    end
    return k
  end
end