#!/bin/bash
# to use this to automatically schedule SelfControl to turn on every day,
# save this script to /usr/local/bin and make it executable
# then open up `sudo crontab -e` and add something like this:
# 0 8 * * * /usr/local/bin/.selfcontrol.sh

defaults write org.eyebeam.SelfControl BlockDuration -int 480
defaults write org.eyebeam.SelfControl HostBlacklist -array twitter.com tweetdeck.twitter.com reddit.com
defaults read org.eyebeam.SelfControl
sudo /Applications/SelfControl.app/Contents/MacOS/org.eyebeam.SelfControl $(id -u $(whoami)) --install
