editor.attach_amino_acid('pk1','tyr')
select n, name n
select ca, name ca
select cb, name cb
select cg, name cg
select cd1, name cd1
set_dihedral n, ca, cb, cg, -60
set_dihedral ca, cb, cg, cd1, 90
save tyr.pdb,((tyr))
