#!/bin/bash
source_dir=/home/che/Documents/*
backup_dir=/mnt/Virtual
find $source_dir -mtime -1 -exec cp -r {} $backup_dir/$(date +%Y%m%d) \;




#-----------------------------------with user input---------------------
#echo Enter source directory
#read source_dir
#echo Enter destination directory
#read backup_dir
#find $source_dir  -mtime -1 -exec cp -r {} $backup_dir/$(date +%Y%m%d) \;

