editor.attach_amino_acid('pk1','arg')
select n, name n
select ca, name ca
select cb, name cb
select cg, name cg
select cd, name cd
select ne, name ne
select cz, name cz
set_dihedral n, ca, cb, cg, -71
set_dihedral ca, cb, cg, cd, 169
set_dihedral cb, cg, cd, ne, -53
set_dihedral cg, cd, ne, cz, -65
save arg.pdb,((arg))
