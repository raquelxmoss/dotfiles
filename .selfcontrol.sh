#!/bin/bash

defaults write org.eyebeam.SelfControl BlockDuration -int 480
defaults write org.eyebeam.SelfControl HostBlacklist -array twitter.com tweetdeck.twitter.com reddit.com
defaults read org.eyebeam.SelfControl
sudo /Applications/SelfControl.app/Contents/MacOS/org.eyebeam.SelfControl $(id -u $(whoami)) --install
