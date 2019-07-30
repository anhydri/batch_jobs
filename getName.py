#!/bin/python

import sys

def identifyVar(var):
	splitVar = var.split("/") 
	nameVar = splitVar[-1]
	return nameVar

print(identifyVar(sys.argv[1])) 
