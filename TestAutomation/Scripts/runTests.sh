#1bin/sh
#Automated Testing Script Written By
#Nathan Bell, Logan Sitar, and Paul Thomas

#Runs separte script for setting up the html results file
bash fileSetup.sh

#Moves up to the main folder
cd ..

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
	
	#appends testing information to the html file
	echo "	<tr>" >> results.html
	echo "		<td>$id</td>" >> results.html
	echo "		<td>$requirement</td>" >> results.html
	echo "		<td>$class</td>" >> results.html
	echo "		<td>$method</td>">> results.html
	echo "		<td>$input</td>" >> results.html
	echo "		<td>$expectedOutput</td>" >> results.html
	echo "		<td>$output</td>">> results.html
	echo "		<td>$passFail</td>" >> results.html
	echo "	</tr>" >> results.html
	
	
	
	cd ..
	
	done
	
	#opens the result file to the browser
	firefox Results/results.html
	
	rm -f TestCaseExecutables/*.class #clears all compiled java classes
	
