editor.attach_amino_acid('pk1','glu')
select n, name n
select ca, name ca
select cb, name cb
select cg, name cg
select cd, name cd
select oe1, name oe1
set_dihedral n, ca, cb, cg, -121
set_dihedral ca, cb, cg, cd, -56
set_dihedral cb, cg, cd, oe1, -73
save glu.pdb,((glu))
