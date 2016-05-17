#! /bin/bash 
echo 'Additional test cases inspiried by http://biorxiv.org/content/early/2015/12/25/035360'

echo '```'
echo Software used:
R --version|grep Full 
echo 'ETE3' `ete3 version` 
echo 'ETE2' `python -c 'import ete2; print ete2.__version__'`
echo Dendropy `python -c 'import dendropy; print dendropy.__version__'`
echo BioPython `python -c 'import Bio; print Bio.__version__'`
echo Newick utilities 1.6
echo BioPerl `perl -e 'use Bio::Perl; print Bio::Perl->VERSION."\n"'`
echo '```'
echo 

ete3 view  --attr name support --sin --ss --sbl -i original_tree.png -t test.nw;

echo '## Original tree'
echo '```'
cat test.nw
echo '```'
echo '![ete3](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/original_tree.png)' 


echo '## Tree after rooting to X' 

for x in test_ete3.py test_ete2.py test_dendropy.py test_ape.sh test_newick_utilities.sh test_biopython.py test_bioperl.sh
do 
    echo '###' $x
    echo '```'
    echo $x; 
    ./$x; 
    echo
    echo '```';  
    #./$x|ete3 view --text --attr name support --sin; 
    ./$x |ete3 view  --attr name support --sin --ss --sbl -i $x.png; 
    echo "![$x](https://github.com/jhcepas/test_branch_support_after_tree_rerooting/blob/master/$x.png)"
done
