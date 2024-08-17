@echo off
set "currentDir=%cd%"
setx MY_WORKING_DIR "%currentDir%"
echo built ntfetch (:
start ntfetch
