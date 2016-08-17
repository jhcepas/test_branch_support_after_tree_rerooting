#!/usr/bin/perl
use warnings;
use strict;
use Bio::TreeIO;
use IO::String;
my $treeio = Bio::TreeIO->new(-file   => "test.nw",
                              -format => 'newick', 
                              -internal_node_id => 'bootstrap');
my $tree = $treeio->next_tree;
my $node = $tree->find_node(-id => 'X');
$tree->reroot($node);

my $out = new Bio::TreeIO(-format => 'nhx');
$out->write_tree($tree); 





