#!/bin/bash
link="http://10.0.17.6/IOC.html"

fullPage=$(curl -sL "$link")

#echo "$fullPage"

toolOutput=$(echo "$fullPage" | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table//tr")

echo "$toolOutput" | sed '/<tr>&#13;/d' | \
sed -e 's/<td[^>]*>//g' | \
sed -e 's/<\/td>&#13;//g' | \
sed -e '/<th>/d' | \
sed -e '/<\/tr>/d' | \
sed -e 's/^[[:space:]]*//g'| \
sed -n 'p;n' \
>IOC.txt
