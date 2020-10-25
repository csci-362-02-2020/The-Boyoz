#1bin/sh

#Moves up to the main folder
cd ..

#Compiles all classes in TestCaseExecutables
javac TestCaseExecutables/*.java

for file in TestCases/*.txt
	do
		i=0
	#echo $file read
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
	declare output
	
	#echo $id
	#echo $requirement
	#echo $class
	#echo  method to test = $method
	#echo $input
	#echo expected output = $expectedOutput
	#echo 

	#sleep 1
	cd TestCaseExecutables

	if [ $method == "rgb2Hsl" ]
		then
			echo $id
			output=$(java rgb2HslDriver $input)
			#echo $output
	
	elif [ $method == "hex2Rgb" ]
		then
			echo $id
			output=$(java hex2RgbDriver $input)
			#echo $output
	
	elif [ $method == "calculate" ]
		then
			echo $id
			output=$(java calculateDriver $input)
			#echo $output
			
	elif [ $method == "distanceColor" ]
		then
			echo $id
			output=$(java distanceColorDriver $input)
			#echo $output
			
	elif [ $method == "getContrastRatio" ]
		then
			echo $id
			output=$(java getContrastRatioDriver $input)
			#echo $output
	fi
	
	
	#Check to see if test passed or failed
	if [ "$output" == "$expectedOutput" ]
		then
			echo pass
		else 
			echo fail
	fi
	
	cd ..
	
	done
	
