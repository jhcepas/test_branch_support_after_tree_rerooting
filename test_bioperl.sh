#!/bin/sh

# Fixes the newick output of bioperl so it can be read by ete for automatically
# generating an img
./test_bioperl.pl |sed  's/)X/,X:0)/g'|python nhx2nw.py


