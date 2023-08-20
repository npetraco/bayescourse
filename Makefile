# Handy Makefile to copy over and push changes out to website 

default:
# Just copy over site page and push everything in the local to remote
	cp bayescourse.html index.html
	git add --all
	git commit -m "update site page"
	git push -u origin master
	
all:
# Make a local backup of current version Notes/scripts in the local. Next copy over new material from the root and push out to the remote
	tar -zcvf backup/Notes.backup.tar.gz Notes                           # back up previous version of Notes in local. Will be gitignored
	tar -zcvf backup/Notes_scripts_bank.backup.tar.gz Notes_scripts_bank # back up previous version of scripts in local. Will be gitignored
	cp bayescourse.html index.html
	./copyscripts.sh                                                     # copy over any new/changed notes and scripts from root
	git add --all
	git commit -m "update all"
	git push -u origin master
