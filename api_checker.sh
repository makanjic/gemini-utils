#!/bin/bash

source .venv/bin/activate

while read key; do
	export GEMINI_API_KEY=$key
	python3 chat.py
	if [ $? -eq 0 ]; then
		echo SUCCESS $key
	else
		echo FAILURE $key
	fi
	export GEMINI_API_KEY=
	unset GEMINI_API_KEY
done
