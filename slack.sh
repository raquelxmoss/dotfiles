#!/bin/bash
# don't forget -> chown raquelmoss:staff /usr/local/bin/slack.sh

defaults write org.eyebeam.SelfControl BlockDuration -int 480
defaults write org.eyebeam.SelfControl HostBlacklist -array slack.com
defaults read org.eyebeam.SelfControl
sudo /Applications/SelfControl.app/Contents/MacOS/org.eyebeam.SelfControl $(id -u $(whoami)) --install
