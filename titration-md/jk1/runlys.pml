editor.attach_amino_acid('pk1','lys')
select n, name n
select ca, name ca
select cb, name cb
select cg, name cg
select cd, name cd
select ce, name ce
select nz, name nz
set_dihedral n, ca, cb, cg, -70
set_dihedral ca, cb, cg, cd, 178
set_dihedral cb, cg, cd, ce, -70
set_dihedral cg, cd, ce, nz, -39
save lys.pdb,((lys))
