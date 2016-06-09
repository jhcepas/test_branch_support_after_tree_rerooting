#! /usr/bin/env python

import sys
from Bio import Phylo
trees = Phylo.parse('test.nw','newick')
t = trees.next()
t.root_with_outgroup('X')
Phylo.write(t, sys.stdout, 'newick')



