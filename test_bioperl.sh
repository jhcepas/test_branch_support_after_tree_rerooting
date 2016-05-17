#!/bin/sh

# Fixes the newick output of bioperl so it can be read by ete
./test_bioperl.pl |sed  's/)X/,X)/g'
