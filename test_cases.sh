check_if_diff()
{
	input=$1
	result=$(diff user_output tail_output)

	if [[ ! -z $result ]]
	then
		echo -n "Input: " 
		echo $input
		echo -e "ERROR: difference\nResult: [KO]\n"
		# # print out the difference between files, remove comment if you want to see the diff
		# echo $result | cat -e
		# echo
		# exit program if first error is encountered
		exit 1;
	fi
}

exec_name=ft_tail


# # Standard input tests (NO -c OPTION!)

cat ./files_to_read/1k1k.txt | ./$exec_name > user_output
cat ./files_to_read/1k1k.txt | tail > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name - > user_output
cat ./files_to_read/1k1k.txt | tail - > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name - > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name ./files_to_read/10b10.txt > user_output
cat ./files_to_read/1k1k.txt | tail ./files_to_read/10b10.txt > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name ./files_to_read/10b10.txt > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name - - > user_output
cat ./files_to_read/1k1k.txt | tail - - > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name - - > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name - - ./files_to_read/10b10.txt > user_output
cat ./files_to_read/1k1k.txt | tail - - ./files_to_read/10b10.txt > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name - - ./files_to_read/10b10.txt > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name - - ./files_to_read/10b10.txt ./files_to_read/50b50.txt > user_output
cat ./files_to_read/1k1k.txt | tail - - ./files_to_read/10b10.txt ./files_to_read/50b50.txt > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name - - ./files_to_read/10b10.txt ./files_to_read/50b50.txt > user_output"


# # Standard input tests using -c option

cat ./files_to_read/1k1k.txt | ./$exec_name -c 10 > user_output
cat ./files_to_read/1k1k.txt | tail -c 10 > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name -c 10 > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name - -c0 > user_output
cat ./files_to_read/1k1k.txt | tail - -c0 > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name - -c0 > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name -c0 ./files_to_read/10b10.txt -c2345 > user_output
cat ./files_to_read/1k1k.txt | tail -c0 ./files_to_read/10b10.txt -c2345 > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name -c0 ./files_to_read/10b10.txt -c2345 > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name - - -c 5 -c12 > user_output
cat ./files_to_read/1k1k.txt | tail - - -c 5 -c12 > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name - - -c 5 -c12 > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name -c 5000 - - -c 25 ./files_to_read/10b10.txt > user_output
cat ./files_to_read/1k1k.txt | tail -c 5000 - - -c 25 ./files_to_read/10b10.txt > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name -c 5000 - - -c 25 ./files_to_read/10b10.txt > user_output"

cat ./files_to_read/1k1k.txt | ./$exec_name - - ./files_to_read/10b10.txt ./files_to_read/50b50.txt -c 10000 > user_output
cat ./files_to_read/1k1k.txt | tail - - ./files_to_read/10b10.txt ./files_to_read/50b50.txt -c 10000 > tail_output
check_if_diff "cat ./files_to_read/1k1k.txt | ./$exec_name - - ./files_to_read/10b10.txt ./files_to_read/10b10.txt -c 10000 > user_output"


# # PATHNAME only tests

./$exec_name ./files_to_read/10b10.txt > user_output
tail ./files_to_read/10b10.txt > tail_output
check_if_diff "./$exec_name ./files_to_read/10b10.txt > user_output"

./$exec_name ./files_to_read/1k1k.txt ./files_to_read/1k1k.txt > user_output
tail ./files_to_read/1k1k.txt ./files_to_read/1k1k.txt > tail_output
check_if_diff "./$exec_name ./files_to_read/1k1k.txt ./files_to_read/1k1k.txt > user_output"

./$exec_name ./files_to_read/50b50.txt ./files_to_read/30k1.txt ./files_to_read/1k1k.txt > user_output
tail ./files_to_read/50b50.txt ./files_to_read/30k1.txt ./files_to_read/1k1k.txt > tail_output
check_if_diff "./$exec_name ./files_to_read/50b50.txt ./files_to_read/30k1.txt ./files_to_read/1k1k.txt > user_output"


# # PATHNAME only tests using -c option

./$exec_name -c 1234 ./files_to_read/1k1k.txt > user_output
tail -c 1234 ./files_to_read/1k1k.txt > tail_output
check_if_diff "./$exec_name -c 1234 ./files_to_read/1k1k.txt > user_output"

./$exec_name -c 1234 ./files_to_read/1k1k.txt ./files_to_read/1k1k.txt -c50 > user_output
tail -c 1234 ./files_to_read/1k1k.txt ./files_to_read/1k1k.txt -c50 > tail_output
check_if_diff "./$exec_name -c 1234 ./files_to_read/1k1k.txt ./files_to_read/1k1k.txt -c50 > user_output"

./$exec_name -c 1 -c 2 -c 5 -c 0 ./files_to_read/30k1.txt -c500000 ./files_to_read/50b50.txt ./files_to_read/1k1k.txt > user_output
tail -c 1 -c 2 -c 5 -c 0 ./files_to_read/30k1.txt -c500000 ./files_to_read/50b50.txt ./files_to_read/1k1k.txt > tail_output
check_if_diff "./$exec_name -c 1 -c 2 -c 5 -c 0 ./files_to_read/30k1.txt -c10 ./files_to_read/50b50.txt ./files_to_read/1k1k.txt > user_output"



# # ERROR TESTS

# file with no permissions to read
./$exec_name -c 5 ./files_to_read/noread &> user_output
tail -c 5 ./files_to_read/noread &> tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/noread &> user_output"

# file with no permissions to write
./$exec_name -c 5 ./files_to_read/nowrite &> user_output
tail -c 5 ./files_to_read/nowrite &> tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/nowrite &> user_output"

# file with no permissions to execute
./$exec_name -c 5 ./files_to_read/noexecute &> user_output
tail -c 5 ./files_to_read/noexecute &> tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/noexecute &> user_output"

# trying to open dir
./$exec_name -c 5 ./files_to_read/dir ./files_to_read/dir &> user_output
tail -c 5 ./files_to_read/dir ./files_to_read/dir &> tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/dir ./files_to_read/dir &> user_output"

./$exec_name -c 5 ./files_to_read/noread ./files_to_read/noread ./files_to_read/nowrite ./files_to_read/noread ./files_to_read/noexecute ./files_to_read/noread &> user_output
tail -c 5 ./files_to_read/noread ./files_to_read/noread ./files_to_read/nowrite ./files_to_read/noread ./files_to_read/noexecute ./files_to_read/noread &> tail_output
check_if_diff "./$exec_name -c 5./files_toread/noread ./files_to_read/nowrite ./files_to_read/noexecute &> user_output"


# using incorrect -c options
./$exec_name -c 5a ./files_to_read/noread &> user_output
tail -c 5a ./files_to_read/noread &> tail_output
check_if_diff "./$exec_name -c 5a ./files_to_read/noread &> user_output"

# nonexistant files
./$exec_name -c 5 ./files_to_read/doesntexist &> user_output
tail -c 5 ./files_to_read/doesntexist &> tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/doesntexist &> user_output"

#  multiple errors combined
./$exec_name -c 5 ./files_to_read/noread ./files_to_read/dir ./files_to_read/noread ./files_to_read/noread ./files_to_read/noread ./files_to_read/dir ./files_toread/nowrite &> user_output
tail -c 5 ./files_to_read/noread ./files_to_read/dir ./files_to_read/noread ./files_to_read/noread ./files_to_read/noread ./files_to_read/dir ./files_toread/nowrite &> tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/noread ./files_to_read/dir ./files_to_read/noread ./files_to_read/noread ./files_to_read/noread ./files_to_read/dir ./files_to_read/doesntexist ./files_toread/nowrite > user_output"

./$exec_name -c 5a ./files_to_read/noread ./files_to_read/dir ./files_to_read/noread ./files_to_read/noread ./files_to_read/noread ./files_to_read/dir ./files_toread/nowrite &> user_output
tail -c 5a ./files_to_read/noread ./files_to_read/dir ./files_to_read/noread ./files_to_read/noread ./files_to_read/noread ./files_to_read/dir ./files_toread/nowrite &> tail_output
check_if_diff "./$exec_name -c 5a ./files_to_read/noread ./files_to_read/dir ./files_to_read/noread ./files_to_read/noread ./files_to_read/noread ./files_to_read/dir ./files_toread/nowrite > user_output"


# # OTHER TESTS

# file with 0 newlines
./$exec_name -c 5 ./files_to_read/30k.txt > user_output
tail -c 5 ./files_to_read/30k.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/30k.txt > user_output"

# large files
./$exec_name -c 5 ./files_to_read/30k1k.txt > user_output
tail -c 5 ./files_to_read/30k1k.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/30k1k.txt > user_output"

./$exec_name -c 5 ./files_to_read/10k10k.txt > user_output
tail -c 5 ./files_to_read/10k10k.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/10k10k.txt > user_output"

cat ./files_to_read/10k10k.txt | ./$exec_name -c 5 > user_output
cat ./files_to_read/10k10k.txt | tail -c 5 > tail_output
check_if_diff "cat ./files_to_read/10k10k.txt | ./$exec_name -c 5 > user_output"

./$exec_name -c 5  ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt > user_output
tail -c 5 ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt ./files_to_read/10k10k.txt > user_output"

# empty files
./$exec_name -c 5 ./files_to_read/empty.txt > user_output
tail -c 5 ./files_to_read/empty.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/empty.txt > user_output"

./$exec_name -c 5 ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/empty.txt > user_output
tail -c 5 ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/empty.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/empty.txt > user_output"

./$exec_name -c 5 ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/10b10.txt > user_output
tail -c 5 ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/10b10.txt > tail_output
check_if_diff "./$exec_name -c 5  ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/10b10.txt > user_output"

# # empty files, large files and small files
./$exec_name -c 5 ./files_to_read/1k1k.txt ./files_to_read/empty.txt > user_output
tail -c 5 ./files_to_read/1k1k.txt ./files_to_read/empty.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/1k1k.txt ./files_to_read/empty.txt > user_output"

# # empty files, large files and small files
./$exec_name -c 5 ./files_to_read/1k1k.txt ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/1k1k.txt ./files_to_read/empty.txt ./files_to_read/1k1k.txt > user_output
tail -c 5 ./files_to_read/1k1k.txt ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/1k1k.txt ./files_to_read/empty.txt ./files_to_read/1k1k.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/1k1k.txt ./files_to_read/empty.txt ./files_to_read/empty.txt ./files_to_read/1k1k.txt ./files_to_read/empty.txt ./files_to_read/1k1k.txt > user_output"

# only newlines
./$exec_name -c 5 ./files_to_read/newlines.txt ./files_to_read/newlines1.txt > user_output
tail -c 5 ./files_to_read/newlines.txt ./files_to_read/newlines1.txt > tail_output
check_if_diff "./$exec_name -c 5 ./files_to_read/newlines.txt ./files_to_read/newlines2.txt > user_output"

# # stdin tests without using CAT (you have to give your own input here)
# # to test stdin: type the same thing, then press hotkey for EOF character (ctrl + d for me), then repeat for the tail function
# ./$exec_name -c 5 > user_output
# tail -c 5 > tail_output
# check_if_diff "./$exec_name -c 5 > user_output"


echo -e "No differences found\nResult: [OK]"
rm user_output
rm tail_output