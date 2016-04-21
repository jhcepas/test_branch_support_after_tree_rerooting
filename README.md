Additional test cases inspiried by http://biorxiv.org/content/early/2015/12/25/035360
```
Software used:
R version 3.2.0 (2015-04-16) -- "Full of Ingredients"
ETE3 3.0.0b35
ETE2 2.3.10
Dendropy 4.1.0
BioPython 1.63b
Newick utilities 1.6
```

## Original tree
```
((C:1.0,D:1.0)10:0.001,(A:1.0, (B:1.0,X:1.0)30:0.01)20:0.1,E:1.0)0:0.0;

```
![ete3](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/original_tree.png)
## Tree after rooting to X
### test_ete3.py
```
test_ete3.py
(X:0.5,(B:1,(A:1,((C:1,D:1)10:0.001,E:1)20:0.1)30:0.01)1:0.5);
```
![test_ete3.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ete3.py.png)
### test_ete2.py
```
test_ete2.py
(X:0.5,(B:1,(A:1,((C:1,D:1)10:0.001,E:1)20:0.1)30:0.01)1:0.5);
```
![test_ete2.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ete2.py.png)
### test_dendropy_root.py
```
test_dendropy_root.py
(X:1.0,B:1.0,(A:1.0,((C:1.0,D:1.0)10:0.001,E:1.0)0:0.1)20:0.01)30:0.0;
```
![test_dendropy_root.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_dendropy_root.py.png)
### test_ape.sh
```
test_ape.sh
((((C:1,D:1)10:0.001,E:1)0:0.1,A:1)20:0.01,B:1,X:1)30;
```
![test_ape.sh](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ape.sh.png)
### test_newick_utilities.sh
```
test_newick_utilities.sh
(X:0.5,(B:1.0,(A:1.0,((C:1.0,D:1.0)10:0.001,E:1.0)0:0.1)20:0.01)30:0.5);
```
![test_newick_utilities.sh](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_newick_utilities.sh.png)
### test_biopython.py
```
test_biopython.py
(((((C:1.00000,D:1.00000)10.00:0.00100,E:1.00000)0.00:0.10000,A:1.00000)20.00:0.01000,B:1.00000)30.00:1.00000,X:0.00000):0.00000;
```
![test_biopython.py](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_biopython.py.png)
