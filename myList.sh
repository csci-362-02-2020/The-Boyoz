#1bin/sh

#Nathan Bell

#write a script myList.[script extension] for Unix that lists the top-level directory contents of its containing directory in an html file displayed in a browser


ls >> myList.html
firefox myList.html

sleep 1
rm myList.html
