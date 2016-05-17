#!/usr/bin/perl
use warnings;
use strict;
use Bio::TreeIO;
use IO::String;
my $treeio = Bio::TreeIO->new(-file   => "test.nw",
                              -format => 'newick');
my $tree = $treeio->next_tree;
my $node = $tree->find_node(-id => 'X');
$tree->reroot($node);

my $out = new Bio::TreeIO(-format => 'newick');
$out->write_tree($tree); 





