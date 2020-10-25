#1bin/sh

#Moves up to the main folder
cd ..

#Compiles all classes in TestCaseExecutables
javac TestCaseExecutables/*.java

for file in TestCases/*.txt
	do
		i=0
	echo $file read
while read line
	do
		lines[$i]="$line";
		i=$((i+1));
		done < $file
		
	declare id=${lines[0]}
	declare requirement=${lines[1]}
	declare class=${lines[2]}
	declare method=${lines[3]}
	declare input=${lines[4]}
	declare expectedOutput=${lines[5]}
	#declare output
	
	echo $id
	echo $requirement
	echo $class
	echo $method
	echo $input
	echo $expectedOutput
	echo 

	sleep 1

	#java $method $input

	done
	
