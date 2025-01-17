#!/bin/bash
MOVIES=("Devara" "RRR" "PUSHPA" "PANJA")

echo "Movie name is ${MOVIES[2]}"
echo "Movie name is ${MOVIES[1]}"
echo "Movie name is ${MOVIES[0]}"
echo "Movie name is ${MOVIES[3]}"

echo "all movie are: ${MOVIES[@]}"