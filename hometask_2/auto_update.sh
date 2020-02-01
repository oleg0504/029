#!/bin/bash
sudo apt update -qq && sudo apt upgrade -qq -y > /var/log/update-$(date +%Y%m%d).log
