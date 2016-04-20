library("ape")
tr <- read.tree("test.nw")
tr <- root(tr, "X")
write.tree(tr)