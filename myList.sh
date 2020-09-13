#1bin/sh

#Nathan Bell, Paul Joseph, Logan Sitar

#write a script myList.[script extension] for Unix that lists the top-level directory contents of its containing directory in an html file displayed in a browser


#Defining constants to be used in HTML code
directoryName=$(pwd)
siteTitle="MyList Top Level Directory Contents"
locationTitle=" Folder Location: $directoryName"


#Function to populate directory content
listFunction(){
	printf '%s<br>' *
}

#Create html fill
cat > myList.html <<_EOF_
	31
  <html>
  <head>
    <h1> $siteTitle </h1>
  </head>
  <body>
    <h2> $locationTitle </h2>
    <ul> $(listFunction) </ul>
    
  </body>
  </html>

_EOF_
#close html file

#open html in browser
firefox myList.html


