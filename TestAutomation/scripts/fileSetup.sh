#1bin/sh


cd ..
cd reports

rm *.html


echo "<html>" >> testReport.html
echo "<head>" >> testReport.html
echo "<style>" >> testReport.html

echo "table, th, td {" >> testReport.html
echo "  border: 1px solid black;" >> testReport.html
echo "}" >> testReport.html

echo "#t01 {" >>testReport.html
echo  "background-color: #e8e8e8;" >>testReport.html
echo "}" >>testReport.html


echo "</style>" >> testReport.html
echo "</head>" >> testReport.html

echo "<body>" >> testReport.html
echo "<h2>Tanaguru Testing</h2>" >> testReport.html
echo "<p>By The Boyoz</p>" >> testReport.html

echo "<table width: 90%; id=\"t01\">" >> testReport.html
echo "	<tr>" >> testReport.html
echo "		<th>ID</th>" >> testReport.html
echo "		<th>Requirement</th>" >> testReport.html
echo "		<th>Class</th>" >> testReport.html
echo "		<th>Method</th>" >> testReport.html
echo "		<th>Input</th>" >> testReport.html
echo "		<th>ExpectedOutput</th>" >> testReport.html
echo "		<th>Output</th>" >> testReport.html
echo "		<th>Result</th>" >> testReport.html
echo "	</tr>" >> testReport.html
