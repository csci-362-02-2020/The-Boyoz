#1bin/sh


cd ..
cd Results

rm *.html


echo "<html>" >> results.html
echo "<head>" >> results.html
echo "<style>" >> results.html

echo "table, th, td {" >> results.html
echo "  border: 1px solid black;" >> results.html
echo "}" >> results.html

echo "#t01 {" >>results.html
echo  "background-color: #e8e8e8;" >>results.html
echo "}" >>results.html


echo "</style>" >> results.html
echo "</head>" >> results.html

echo "<body>" >> results.html
echo "<h2>Tanaguru Testing</h2>" >> results.html
echo "<p>By The Boyoz</p>" >> results.html

echo "<table width: 90%; id=\"t01\">" >> results.html
echo "	<tr>" >> results.html
echo "		<th>ID</th>" >> results.html
echo "		<th>Requirement</th>" >> results.html
echo "		<th>Class</th>" >> results.html
echo "		<th>Method</th>" >> results.html
echo "		<th>Input</th>" >> results.html
echo "		<th>ExpectedOutput</th>" >> results.html
echo "		<th>Output</th>" >> results.html
echo "		<th>Result</th>" >> results.html
echo "	</tr>" >> results.html
