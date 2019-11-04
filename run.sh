#!/bin/bash
time=`date +"%y%m%d_%H%M"`
python main.py > ./output/result/${time}.out 2>&1
