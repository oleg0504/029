#!/bin/bash
curl http://yoko.ukrtux.com:8899/versions.txt --output version.txt -silent
sort version.txt | uniq -c | sort -n | tail -1
