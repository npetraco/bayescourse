# Handy Makefile to copy over and push changes out to website 

default:
	cp bayescourse.html index.html
	git add --all
	git commit -m "update site page"
	git push -u origin master
	
all:
	cp bayescourse.html index.html
	./copyscripts.sh # copy over any new/changed notes and scripts too
	git add --all
	git commit -m "update all"
	git push -u origin master
