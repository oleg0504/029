#!/bin/bash
#sudo apt update -qq && sudo apt upgrade -qq -y > /var/log/update-$(date +%Y%m%d).log
cronjob="0 0 * * 0 apt update -qq && apt upgrade -qq -y > /var/log/update-$(date +%Y%m%d).log"
(crontab -u $USER -l; echo "$cronjob" ) | crontab -u $USER -
