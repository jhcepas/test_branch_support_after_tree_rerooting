Additional test cases inspiried by http://biorxiv.org/content/early/2015/12/25/035360
```
Software used:
R version 3.2.0 (2015-04-16) -- "Full of Ingredients"
ETE3 3.0.0b35
ETE2 2.3.10
Dendropy 4.1.0
BioPython 1.63b
Newick utilities 1.6
BioPerl 1.006925
PyCogent 1.5.3
```
###Relevant discussion:
BioPython: https://github.com/biopython/biopython/issues/745

Dendropy: https://github.com/jeetsukumaran/DendroPy/issues/53

BioPerl: https://github.com/bioperl/bioperl-live/issues/157

newick-utilities: https://github.com/tjunier/newick_utils/issues/15

## Original tree
```
((C:1.0,D:1.0)10:0.001,(A:1.0, (B:1.0,X:1.0)30:0.01)20:0.1,E:1.0)0:0.0;

```
![ete3](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/original_tree.png)
## Tree after rooting to X
### test_ete3.py
```python
#! /usr/bin/python

from ete3 import Tree
t = Tree('test.nw')
t.set_outgroup(t & "X")
print t.write()
```
```
(X:0.5,(B:1,(A:1,((C:1,D:1)10:0.001,E:1)20:0.1)30:0.01)1:0.5);

```
![test_ete3.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ete3.py.png)
### test_ete2.py
```python
#! /usr/bin/python

from ete2 import Tree
t = Tree('test.nw')
t.set_outgroup(t & "X")
print t.write()
```
```
(X:0.5,(B:1,(A:1,((C:1,D:1)10:0.001,E:1)20:0.1)30:0.01)1:0.5);

```
![test_ete2.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ete2.py.png)
### test_dendropy.py
```python
#! /usr/bin/env python

from dendropy import Tree, TaxonNamespace

def node_label_method(tree, outgroup):
    '''Interpret node labels as node attributes (default).'''    
    outgroup_node = tree.find_node_with_taxon_label(outgroup)
    new_root = outgroup_node.parent_node
    tree.reseed_at(new_root)
    return tree

def rooted_bipartition_method(tree, outgroup):
    '''Interpret node labels as branch support values.'''

    benc = tree.encode_bipartitions()
    support_values = {}
    for nd in tree:
        support_values[nd.bipartition] = float(nd.label) if nd.label is not None else 1.0

    outgroup_node = tree.find_node_with_taxon_label(outgroup)
    new_root = outgroup_node.parent_node
    tree.reseed_at(new_root)
    tree.encode_bipartitions()
    for nd in tree:
        nd.label = support_values.get(nd.bipartition, "not_specified")
    tree.seed_node.edge.length = None
    return tree

tree = Tree.get(file=open('test.nw'), schema="newick")#, rooting="force-rooted")
rooted_bipartition_method(tree, 'X')
nw = tree.as_string(schema='newick').strip()
print nw.replace('[&R] ', '')

# Related discussion: https://github.com/jeetsukumaran/DendroPy/issues/53
```
```
(B:1.0,X:1.0,(A:1.0,((C:1.0,D:1.0)10.0:0.001,E:1.0)20.0:0.1)30.0:0.01);

```
![test_dendropy.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_dendropy.py.png)
### test_ape.sh
```bash
#! /bin/bash
R --quiet --vanilla < test_ape.R |grep "\[1\]"|cut -f2 -d " "|cut -f2 -d '"' 
```
```
((((C:1,D:1)10:0.001,E:1)0:0.1,A:1)20:0.01,B:1,X:1)30;

```
![test_ape.sh](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ape.sh.png)
### test_newick_utilities.sh
```bash
#! /bin/bash 
./nw_reroot test.nw X
```
```
(X:0.5,(B:1.0,(A:1.0,((C:1.0,D:1.0)10:0.001,E:1.0)0:0.1)20:0.01)30:0.5);

```
![test_newick_utilities.sh](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_newick_utilities.sh.png)
### test_biopython.py
```python
#! /usr/bin/env python

import sys
from Bio import Phylo
trees = Phylo.parse('test.nw','newick')
t = trees.next()
t.root_with_outgroup('X')
Phylo.write(t, sys.stdout, 'newick')



```
```
(((((C:1.00000,D:1.00000)10.00:0.00100,E:1.00000)0.00:0.10000,A:1.00000)20.00:0.01000,B:1.00000)30.00:1.00000,X:0.00000):0.00000;

```
![test_biopython.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_biopython.py.png)
### test_bioperl.sh
```bash
#!/bin/sh

# Fixes the newick output of bioperl so it can be read by ete
./test_bioperl.pl |sed  's/)X/,X:0)/g'
```
```
((B:1.0,(A:1.0,((C:1.0,D:1.0)10:0.001,E:1.0)0:0.1)20:0.01)30:1,X:0);
```
![test_bioperl.sh](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_bioperl.sh.png)
### test_pycogent.py
```python
#!/usr/bin/env python

from cogent import LoadTree
tr = LoadTree('test.nw')
print tr.rootedWithTip("X")


```
```
(B:1.0,X:1.0,(A:1.0,((C:1.0,D:1.0)10:0.001,E:1.0)20:0.1)30:0.01);

```
![test_pycogent.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_pycogent.py.png)
