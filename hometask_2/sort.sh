#!/bin/bash
curl http://yoko.ukrtux.com:8899/versions.txt --output version.txt -silent
sort -V  version.txt

