#!/bin/bash
rm -r zips/*
fd -t d -d 1 module $(pwd) --exec bash -c 'folder=$(echo {/} | cut -d- -f1);echo $folder;./build.sh $folder;'
