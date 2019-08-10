#/bin/bash
cd $1-magisk-module;
zip -r ../zips/$1-module.zip . -x ".git*";
