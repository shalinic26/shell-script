#!/bin/bash

echo "All Variables passed: $@"
echo "Number of variables: $#"
echo "Script name is: $0"
echo "Present working directory: $pwd"
echo "Home directory of current user: $HOME"
echo "Which user is running the script: $USER"
echo "Process ID of current script: $$"
sleep 60 &
echo "Process ID of last command in background: $!"