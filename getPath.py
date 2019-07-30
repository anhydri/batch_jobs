#!/bin/python

import sys

def identifyVar(var):
	splitVar = var.split("/") 
	del splitVar[-1]
	pathVar = "/".join(splitVar)
	return pathVar

print(identifyVar(sys.argv[1]))
