#!/usr/bin/bash

for dir in $(fd -IH --max-depth=1 module .); do
	cd $dir;
	git stash;
	git checkout master;
	git stash apply;
	git add .;
	git commit -m "Added .gitattributes file";
	git push;
done

