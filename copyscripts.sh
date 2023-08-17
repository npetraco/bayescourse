#!/bin/bash
NOTEDIR="/Users/karen2/latex/class/fos705/Applied_Bayes"
WEBDIR="/Users/karen2/latex/web/vanilla_site/class/bayescourse"
# Copy over Notes:
for file in $NOTEDIR/Notes/*/*.pptx; do 
	rsync -vtr "$file" $WEBDIR/Notes/;
done
# Copy over accompanying scripts
for file in $NOTEDIR/Notes/*/scripts/*.R; do 
  rsync -vtr "$file" $WEBDIR/Notes_scripts_bank/; 
done