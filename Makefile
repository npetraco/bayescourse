# Handy Makefile to copy over and push changes out to website 

default:
# just copy over site page and push everything in the local to remote
	cp bayescourse.html index.html
	git add --all
	git commit -m "update site page"
	git push -u origin master
	
cp:
# first copy out anything new in the permanent root to the local and then push to the remote
	cp bayescourse.html index.html
	./copyscripts.sh # copy over any new/changed notes and scripts too
	git add --all
	git commit -m "update all"
	git push -u origin master

all:
# make a local backup of Notes/scripts, then copy over new material and push
	tar -zcvf backup/Notes.backup.tar.gz Notes                           # back up previous version of Notes but gitignore
	tar -zcvf backup/Notes_scripts_bank.backup.tar.gz Notes_scripts_bank # back up previous version of scripts but gitignore
	cp bayescourse.html index.html
	./copyscripts.sh                                                     # copy over any new/changed notes and scripts too
	git add --all
	git commit -m "update all"
	git push -u origin master
