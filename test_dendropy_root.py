#! /usr/bin/env python

from dendropy import Tree, TaxonNamespace
tree_str = '((C,D)10,(A,(B,X)30)20,E)0;'

tree = Tree.get(file=open('test.nw'), schema="newick")


#mrca = tree.find_node_with_taxon_label("X")
#tree.reroot_at_edge(mrca.edge, update_bipartitions=False)
outgroup_node = tree.find_node_with_taxon_label("X")
tree.to_outgroup_position(outgroup_node, update_bipartitions=False)
print(tree.as_string(schema='newick').strip())
