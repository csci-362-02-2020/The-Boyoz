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
		#Adds Driver to the given method to get driver name
	declare temp="Driver"
	declare method=$method$temp
	
	#Runs driver to get the output
	output=$(java $method $input)
	
	
	#Check to see if test passed or failed
	if [ "$output" == "$expectedOutput" ]
		then
			passFail="<td style=\"color:#228B22\">pass</td>"
		else 
			passFail="<td style=\"color:#FF0000\">fail</td>"
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
	echo "		$passFail" >> testReport.html
	echo "	</tr>" >> testReport.html
	
	
	
	cd ..
	
	done
	
	#opens the result file to the browser
	firefox reports/testReport.html
	
	rm -f testCaseExecutables/*.class #clears all compiled java classes
	
