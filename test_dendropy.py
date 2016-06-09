#! /usr/bin/env python

from dendropy import Tree, TaxonNamespace

def node_label_method(tree, outgroup):
    '''Do not interpret node labels as branch support values'''    
    outgroup_node = tree.find_node_with_taxon_label(outgroup)
    new_root = outgroup_node.parent_node
    tree.reseed_at(new_root)
    return tree

def rooted_bipartition_method(tree, outgroup):
    '''Interpret node labels as branch support values, do they
    are remapped to branches when tree outgroup changes.'''

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
