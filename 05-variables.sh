#!/bin/bash

echo "Please enter your name::" # text entered here will be added as value to variable

read -s USERNAME # Here USERNAME is the variable name;;; # Here -s command is for hiding the username 

echo "username entered: $USERNAME"

echo "Please enter your password::"

read -s PASSWORD # We are not printing password 