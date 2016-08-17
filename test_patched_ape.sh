#! /bin/bash
R --quiet --vanilla < test_patched_ape.R |grep "\[1\]"|cut -f2 -d " "|cut -f2 -d '"' 
