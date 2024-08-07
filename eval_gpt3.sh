#!/bin/bash

# Measure the time taken for make gpt3-7b
{ time make gpt3-7b 1> evaluation/gpt3-7b_out.txt 2>&1; } 2> evaluation/gpt3-7b_time.txt

# Measure the time taken for make gpt3-13b
{ time make gpt3-13b 1> evaluation/gpt3-13b_out.txt 2>&1; } 2> evaluation/gpt3-13b_time.txt

# Measure the time taken for make gpt3-30b
{ time make gpt3-30b 1> evaluation/gpt3-30b_out.txt 2>&1; } 2> evaluation/gpt3-30b_time.txt
