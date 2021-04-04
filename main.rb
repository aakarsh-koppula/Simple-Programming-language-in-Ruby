# including dependencies
# Execution starts here
require_relative 'Linkedlist'
require_relative 'Spl_program'
require_relative 'variable_dict.rb'
require_relative 'Parser'

# PROVIDE THE NAME/PATH OF THE SPL PROGRAM FILE BELOW
spl_file = File.open('spl_test2.txt')


file_data = spl_file.readlines.map(&:chomp)
pa = Parser.new   # CALLING THE PARSER ON THE CONTENTS OF THE SPL PROGRAM FILE
spl_object = pa.parse(file_data)  # creating an object of spl program that stores the contents and maintains PC
dict = VariableDict.new # creating an object of variable_dict class that stores all the variables in SPL in a Hash

#  Function to print the values of all variables used till moment of invocation

def printall(dicthash, spl_obj)
  dicthash.var_dictionary.each do |key, value|
    if value.type == 'list'
      puts "#{key} : #{value.create_arr.inspect}"
    else
      puts "#{key} : #{value.create_arr[0].inspect}"
    end
  end
  puts "PC : #{spl_obj.pc} "
end
spl_object.pc = 0


flag = nil # a flag to check if SPL has completed execution

# Function to implement command 'a'
def runall(spl_object,dict)
  while spl_object.spl[spl_object.pc][spl_object.spl[spl_object.pc].size-1] != 'HLT'
    case spl_object.spl[spl_object.pc][spl_object.spl[spl_object.pc].size-1]
    when 'NEWID' # this case calls new_id function
      Instructions.new_id(dict,spl_object)
      spl_object.pc += 1

    when 'COMBINE'  # this case calls combine_ins function
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]].combine_ins(dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1

    when 'COPY' # this case calls deep_copy function
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]] = Linkedlist.new
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]].deep_copy(dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1

    when 'HEAD' # this case calls head1 function
      dict.var_dictionary[spl_object.spl[spl_object.pc][1] ]= Linkedlist.head1(dict.var_dictionary[spl_object.spl[spl_object.pc][1]],
                                                                               dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1

    when 'TAIL' # this case calls tail function
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]].tail(dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1

    when 'ASSIGN' # this case calls assign_ins function
      dict.var_dictionary[spl_object.spl[spl_object.pc][0]].assign_ins(spl_object.spl[spl_object.pc][1].to_i)
      spl_object.pc += 1

    when 'CHS' # this case calls chs function
      dict.var_dictionary[spl_object.spl[spl_object.pc][0]].chs
      spl_object.pc += 1

    when 'ADD' # this case calls add_ins function
      dict.var_dictionary[spl_object.spl[spl_object.pc][0]].add_ins(dict.var_dictionary[spl_object.spl[spl_object.pc][1]])
      spl_object.pc += 1

    when 'IF' # this case call if_ins function

      spl_object = dict.var_dictionary[spl_object.spl[spl_object.pc][0]].if_ins(spl_object.spl[spl_object.pc][1].to_i, spl_object)

    when 'HLT'  # this case terminates function execution
      break
    end

  end
  printall(dict,spl_object)
end

# driver code that starts l/a/q command loop
while flag != 'done'
  puts 'Enter command (l/a/q)' 
  input = gets.chomp
  case input
  when 'a', 'A' # if the user commands 'a'
    runall(spl_object,dict)
    flag = 'done'
    break
  when 'q', 'Q'  # if the user commands 'q'
    break

  when 'l', 'L'  # if the user commands 'l'
    case spl_object.spl[spl_object.pc][spl_object.spl[spl_object.pc].size-1]
    when 'NEWID'
      Instructions.new_id(dict, spl_object)
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'COMBINE'
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]].combine_ins(dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'COPY'
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]] = Linkedlist.new
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]].deep_copy(dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'HEAD'
      dict.var_dictionary[spl_object.spl[spl_object.pc][1] ]= Linkedlist.head1(dict.var_dictionary[spl_object.spl[spl_object.pc][1]],
                                                                               dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'TAIL'
      dict.var_dictionary[spl_object.spl[spl_object.pc][1]].tail(dict.var_dictionary[spl_object.spl[spl_object.pc][0]])
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'ASSIGN'
      dict.var_dictionary[spl_object.spl[spl_object.pc][0]].assign_ins(spl_object.spl[spl_object.pc][1].to_i)
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'CHS'
      dict.var_dictionary[spl_object.spl[spl_object.pc][0]].chs
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'ADD'
      dict.var_dictionary[spl_object.spl[spl_object.pc][0]].add_ins(dict.var_dictionary[spl_object.spl[spl_object.pc][1]])
      spl_object.pc += 1
      printall(dict, spl_object)

    when 'IF'

      spl_object = dict.var_dictionary[spl_object.spl[spl_object.pc][0]].if_ins(spl_object.spl[spl_object.pc][1].to_i, spl_object)
      printall(dict, spl_object)

    when 'HLT'
      printall(dict, spl_object)
      break
    end
  else # if the user gives incorrect command
    puts 'wrong command, try again'

  end
end



