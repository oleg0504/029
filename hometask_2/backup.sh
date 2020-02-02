#!/bin/bash
source_dir=/etc/*
backup_dir=/home
find $source_dir -mtime -1 -exec cp -r {} $backup_dir/$(date +%Y%m%d) \;




#-----------------------------------with user input---------------------
#echo Enter source directory
#read source_dir
#echo Enter destination directory
#read backup_dir
#find $source_dir  -mtime -1 -exec cp -r {} $backup_dir/$(date +%Y%m%d) \;

