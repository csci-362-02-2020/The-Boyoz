#1bin/sh
#Automated Testing Script Written By
#Nathan Bell, Logan Sitar, and Paul Thomas

#Moves up to the main folder
cd ..

#Clears any previously stored results
rm Results/*.txt

#Compiles all classes in TestCaseExecutables
javac TestCaseExecutables/*.java


for file in TestCases/*.txt #loop though all test cases
	do
		i=0
while read line #fill an array with the data from the test cases
	do
		lines[$i]="$line";
		i=$((i+1));
		done < $file
		
	#move values from array into varibles
	declare id=${lines[0]}
	declare requirement=${lines[1]}
	declare class=${lines[2]}
	declare method=${lines[3]}
	declare input=${lines[4]}
	declare expectedOutput=${lines[5]}
	declare output
	declare passFail
	

	cd TestCaseExecutables #move to the location of the drivers


	#Figure out what driver goes with the given test case
	if [ $method == "rgb2Hsl" ]
		then	
			output=$(java rgb2HslDriver $input)
	
	elif [ $method == "hex2Rgb" ]
		then
			output=$(java hex2RgbDriver $input)
	
	elif [ $method == "calculate" ]
		then
			output=$(java calculateDriver $input)
			
	elif [ $method == "distanceColor" ]
		then
			output=$(java distanceColorDriver $input)
			
	elif [ $method == "getContrastRatio" ]
		then
			output=$(java getContrastRatioDriver $input)
	fi
	
	
	#Check to see if test passed or failed
	if [ "$output" == "$expectedOutput" ]
		then
			passFail=pass
		else 
			passFail=fail
	fi
	
	cd ..
	cd Results
	
	echo $id >> results.txt
	echo $requirement >> results.txt
	echo $class >> results.txt
	echo $method >> results.txt
	echo $input >> results.txt
	echo $expectedOutput >> results.txt
	echo $output >> results.txt
	echo $passFail >> results.txt
	echo >> results.txt
	
	cd ..
	
	done
	
	rm -f TestCaseExecutables/*.class #clears all compiled java classes
	
