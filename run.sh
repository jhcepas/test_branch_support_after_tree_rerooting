#! /bin/bash 
echo 'Additional test cases inspiried by http://biorxiv.org/content/early/2015/12/25/035360'
R --version|grep Full 
echo 'ETE' `ete3 version` 
echo Dendropy `python -c 'import dendropy; print dendropy.__version__'`
echo BioPython `python -c 'import Bio; print Bio.__version__'`
echo Newick utilities 1.6

echo 
echo 'Testing:'

 

for x in test_ete3.sh test_dendropy_root.py test_ape.sh test_newick_utilities.sh test_biopython.py
do 
    echo $x; 
    ./$x; 
    ./$x|ete3 view --text --attr name support --sin; 
    ./$x|ete3 view  --attr name support --sin --ss -i $x.png; 
    echo;  
done
