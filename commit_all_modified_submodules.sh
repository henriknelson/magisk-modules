#!/bin/bash

#IFS=" " read -ra modified <<< $(git status --porcelain .); declare -p modified;
#echo $modified;
#git ls-files --directory -o . | xargs -n 1 dirname | uniq
IFS=$'\n'
for line in $(git status --porcelain .); do
	IFS=$' ' read -ra newline <<< "$line";
	fs=${newline[0]};
	#echo "$fs";
	#echo ${newline[1]};
	#echo "__________"
	#continue;
	if [[ "$fs" == "M" ]]; then
		newname=${newline[1]};
		echo $newname;
		cd $newname;
		git add .;
		git commit -m "Updated $newname files";
		git push;
		cd ..;
		#continue;
		git add $newname;
		git commit -m "Updated submodule: $newname";
		git push;
	fi;
	#git push;
done;

exit;

for file in $(fd -IH -t d --max-depth 1 . .); do
	#echo $file;
	[[ -z $(git diff $file) ]] && echo "$file: new";
done
