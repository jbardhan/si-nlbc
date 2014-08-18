editor.attach_amino_acid('pk1','cys')
select n, name n
select ca, name ca
select cb, name cb
select sg, name sg
set_dihedral n, ca, cb, sg, -60
save cys.pdb,((cys))
