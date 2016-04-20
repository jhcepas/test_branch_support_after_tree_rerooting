#! /bin/bash 

for x in test_ete3.sh test_dendropy_root.py test_ape.sh test_newick_utilities.sh test_biopython.py
do 
    echo $x; 
    ./$x; 
    ./$x|ete3 view --text --attr name support --sin; 
    ./$x|ete3 view  --attr name support --sin -i $x.png; 
    echo;  
done
