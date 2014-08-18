editor.attach_amino_acid('pk1','asp')
select n, name n
select ca, name ca
select cb, name cb
select cg, name cg
select od1, name od1
set_dihedral n, ca, cb, cg, -160
set_dihedral ca, cb, cg, od1, 15
save asp.pdb,((asp))
