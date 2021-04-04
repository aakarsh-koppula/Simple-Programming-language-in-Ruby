# Class that creates nodes for linked list

class Node
  attr_accessor :value, :next

  def Node.new_x x
    temp = Node.new # create new node and initialize vars to nil
    temp.value = x # Set @value of new node using setter method
    temp.next = nil
    temp                    # Return new node
  end
end