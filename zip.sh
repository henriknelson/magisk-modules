#/bin/bash
cd $2;
zip -r ../zips/$1 . -x ".git*";
