#!/bin/bash

MOVIES=("Mahanati" "Eega" "Baahubali")

echo "First movie is: ${MOVIES[0]}"

echo "Second movie is: ${MOVIES[0]}"

echo "Third movie is: ${MOVIES[0]}"

# If we want the list of all movies to be printed on console then we need to give @

echo "List of all movies are: ${MOVIES[@]}"