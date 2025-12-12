 #!/bin/bash

logs="report.txt"

echo "<!DOCTYPE html>" >report.html
echo "<html>" >>report.html
echo "<head>" >>report.html
echo "<style>table, th, td {border: 1px solid black;}</style>" >>report.html
echo "</head>" >>report.html

echo "<body>" >>report.html
echo "<p>Access logs with IOC indicators:<p>" >>report.html
echo "<table>" >>report.html
while IFS= read -r line
do
	echo "<tr>" >>report.html
	echo "<td>" >>report.html
	echo "$line" | cut -d' ' -f1 >>report.html
	echo "</td>" >>report.html
	echo "<td>" >>report.html
        echo "$line" | cut -d' ' -f2 >>report.html
        echo "</td>" >>report.html
	echo "<td>" >>report.html
        echo "$line" | cut -d' ' -f3 >>report.html
        echo "</td>" >>report.html
	echo "</tr>" >>report.html
done < "$logs" 

echo "<body>" >>report.html
echo "<html>" >>report.html

mv report.html /var/www/html/
