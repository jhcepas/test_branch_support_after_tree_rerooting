#!/usr/bin/env python

from cogent import LoadTree
tr = LoadTree('test.nw')
print tr.rootedWithTip("X")


