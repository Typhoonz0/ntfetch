@echo off
set "currentDir=%cd%"
setx MY_WORKING_DIR "%currentDir%"
echo built lemfetch (:
start lemfetch
