Execution Starts in main.rb

Give the name/path of the SPL program file in main.rb on line 9 

The archive has 6 test cases (spl programs) the project was tested with
they are named spl_test1.txt, spl_test2.txt.......spl_test7.txt

Run the 'main.rb' to start execution

This is an implemention of a so-called Simple Programming Language Interpreter or SPLI in
Ruby, whose purpose is to execute programs written in the Simple Programming Language (SPL). SPL
has a small set of instructions (a few simple statements and control structures), but uses an awkward
postx notation for its syntax (i.e., operands rst, operator last).

SPL has just two data structures, integer numbers and linked lists. Linked list elements can be
integers or linked lists themselves. identifiers must be declared before they are used, but are not typed
(i.e., SPL uses dynamic typing, like Ruby and Python). Code instructions are numbered, starting at
0. Program execution always starts at address line 0. SPL has the following set of statements. Each
statement occupies exactly one line.

identifier NEWID -  	This statement declares a new identifier, which can be used
			in subsequent statements. The identifier is initialized with
			the null value (i.e., an empty list)

id list COMBINE -	The value bound to id is appended to the list bound to
			list. The value bound to id (i.e., an integer or a
			list) becomes the rst element of the list bound to list.
			If id is bound to a list l1, l1 will become the rst element of list 

list1 list2 COPY -	The list bound to list1 is deep-copied and bound to identifier
			list2.

identifier1 identifier2 HEAD - 	The rst element of the list bound to identifier1 is bound to
				identifier2. This list is not modied


identifier1 identifier2 TAIL - 	A list containing all elements but the rst of identifier1 is
				bound to identifier2. The list is not copied.

identifier integer ASSIGN -	This statement assigns (binds) an integer constant to
				identifier.

identifier CHS- 		This statement changes the sign of the integer value bound to
			identifier.

identifier1 identifier2 ADD - 	This statement adds the integers bound to the two arguments
				and stores the result in identifier1.

identifer1 positive int IF -	If identifier1 is an empty list or the number zero, jump to
				instruction at line positive int

HLT 		-		Terminates program execution.
