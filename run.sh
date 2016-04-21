#! /bin/bash 
echo 'Additional test cases inspiried by http://biorxiv.org/content/early/2015/12/25/035360'

echo '```'
echo Software used:
R --version|grep Full 
echo 'ETE3' `ete3 version` 
echo 'ETE2' `ete3 version` 
echo Dendropy `python -c 'import dendropy; print dendropy.__version__'`
echo BioPython `python -c 'import Bio; print Bio.__version__'`
echo Newick utilities 1.6
echo '```'
echo 
echo 'Test output:'
 

for x in test_ete3.py test_ete2.py test_dendropy_root.py test_ape.sh test_newick_utilities.sh test_biopython.py
do 
    echo '```'
    echo $x; 
    ./$x; 
    ./$x|ete3 view --text --attr name support --sin; 
    ./$x|ete3 view  --attr name support --sin --ss --sbl -i $x.png; 
    echo '```';  
done

ete3 view  --attr name support --sin --ss --sbl -i original_tree.png -t test.nw;

echo '## Original tree'
echo '![ete3](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/original_tree.png)' 
echo '## Tree after rooting to X'
echo '### ete3'
echo '![ete3](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ete3.py.png)'
echo '### ete2'
echo '![ete3](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ete2.py.png)'
echo '### dendropy'
echo '![dendropy](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_dendropy_root.py.png)'
echo '### biopython'
echo '![biopython](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_biopython.py.png)'
echo '### newick utilities'
echo '![newick_u](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_newick_utilities.sh.png)'
echo '### ape'
echo '![ape](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/test_ape.sh.png)'
