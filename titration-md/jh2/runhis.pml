editor.attach_amino_acid('pk1','his')
select n, name n
select ca, name ca
select cb, name cb
select cg, name cg
select nd1, name nd1
set_dihedral n, ca, cb, cg, 70
set_dihedral ca, cb, cg, nd1, 98
save his.pdb,((his))
