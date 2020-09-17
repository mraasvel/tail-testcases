HOW TO USE:
	copy the executable of your tail function into this directory.
	if the executable name is NOT "tail", you can change the variable "exec_name" inside of the test_cases.sh file to match your executable name
	type "./test_cases.sh" or "bash test_cases.sh" into the terminal to run the program
	
	the only thing not tested is stdin without using cat: this is commented out at the bottom of the program.
	there are 40 testcases, the program ends once it encounters a [KO] (difference between your program and the tail function)

	the "STDIN TESTS" and "PATHNAME TESTS" don't use the -c option, comment these out if you don't have this functionality

Testcases tested by test_cases.sh

STDIN tests
	cat <file> | ./tail
	cat <file> | ./tail -
	cat <file> | ./tail <file2>
	cat <file> | ./tail - -
	cat <file> | ./tail - - <file2>
	cat <file> | ./tail - - <file2> <file3>

STDIN tests with -c
	cat <file> | ./tail -c 10
	cat <file> | ./tail - -c0
	cat <file> | ./tail -c0 <file2> -c2345
	cat <file> | ./tail - -c 5 - -c12
	cat <file> | ./tail -c 5000 - - <file2> -c 25
	cat <file> | ./tail - - <file2> <file3> -c10000

PATHNAME tests
	./tail <file>
	./tail <file1> <file2>
	./tail <file1> <fil2> <file3>

PATHNAME tests with -c
	./tail -c 1234 <file1>
	./tail -c 1234 <file1> <file2> -c50
	./tail -c 1 -c 2 -c 5 -c 0 <file1> -c10 <file2> <file3>

ERROR tests
	no permissions
	directory
	incorrect -c options
	nonexistant files
	multiple errors in single function call

OTHER tests
	file with 0 newlines
	multiple large files (30k KB = 30 million bytes)
	empty files
	small files
	combination of the above
	only newlines
	stdin tests without cat
