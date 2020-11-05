#1bin/sh
#Automated Testing Script Written By
#Nathan Bell, Logan Sitar, and Paul Thomas


#Runs separte script for setting up the html results file
cd scripts
bash fileSetup.sh

#Moves up to the main folder
cd ..

#Compiles all classes in TestCaseExecutables
javac testCaseExecutables/*.java


for file in testCases/*.txt #loop though all test cases
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
	

	cd testCaseExecutables #move to the location of the drivers


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
	cd reports
	
	#appends testing information to the html file
	echo "	<tr>" >> testReport.html
	echo "		<td>$id</td>" >> testReport.html
	echo "		<td>$requirement</td>" >> testReport.html
	echo "		<td>$class</td>" >> testReport.html
	echo "		<td>$method</td>">> testReport.html
	echo "		<td>$input</td>" >> testReport.html
	echo "		<td>$expectedOutput</td>" >> testReport.html
	echo "		<td>$output</td>">> testReport.html
	echo "		<td>$passFail</td>" >> testReport.html
	echo "	</tr>" >> testReport.html
	
	
	
	cd ..
	
	done
	
	#opens the result file to the browser
	firefox reports/testReport.html
	
	rm -f testCaseExecutables/*.class #clears all compiled java classes
	
