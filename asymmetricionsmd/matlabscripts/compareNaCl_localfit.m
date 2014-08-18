'do not run! need to take out the partial kJ conversion!'
return
clear all
cd chloride;
chlorideFEPlocal;
cf = 4.184;

vdmat = [Qdata.^2 Qdata];
clFEP = struct('q',Qdata,'dG',Edata,'L_con',L_constrained,'L_uncon',L_unconstrained,...
'phi_con',phiStatic_constrained,'phi_uncon',phiStatic_unconstrained,'x_con',xConstrained,...
'x_uncon',xUnconstrained,'offset',offset_unconstrained);
xLinear = [Qdata.^2]\Edata;
foohandle=plot(clFEP.q(1:2:end),cf*clFEP.dG(1:2:end),'bo','linewidth',1.5,'markersize',10);
hold on
set(gca,'fontsize',16);
xlabel('q')
ylabel('\Delta G^{charging} (kJ/mol)')
plot(clFEP.q,cf*vdmat*clFEP.x_con,'b','linewidth',2);
[junk,index]=min(clFEP.q); 
E_final_cl = clFEP.dG(index);
xLinearCl = 2 * E_final_cl;
plot(clFEP.q,cf*.5*[clFEP.q.^2]*xLinearCl,'mo','linewidth',2);

cd ../sodium;
sodiumFEPlocal;
naFEP = struct('q',Qdata,'dG',Edata,'L_con',L_constrained,'L_uncon',L_unconstrained,...
'phi_con',phiStatic_constrained,'phi_uncon',phiStatic_unconstrained,'x_con',xConstrained,...
'x_uncon',xUnconstrained,'offset',offset_unconstrained);
plot(naFEP.q,naFEP.dG,'kx','linewidth',2);
plot(naFEP.q,vdmat*naFEP.x_con,'ro','linewidth',1.5);
[junk,index]=max(naFEP.q);
E_final_na = naFEP.dG(index);
xLinearNa = 2 * E_final_na;
%xblah = [Qdata.^2]\Edata;
plot(naFEP.q,.5*[naFEP.q.^2] *xLinearNa,'g*','linewidth',1.5)

plot(clFEP.q,clFEP.dG,'b.','linewidth',2);
plot(naFEP.q,naFEP.dG,'kx','linewidth',2);
legend('Cl FEP','Cl Affine response','Cl Linear response','Na FEP','Na Affine response','Na Linear response', 'location','southeast');
%legend('Cl FEP','Cl Affine response','Na FEP','Na Affine response', 'location','southeast');

cd ..

    
figure;
foohandle=plot(clFEP.q,clFEP.dG,'bd','linewidth',2,'markersize',8);
hold on;
set(gca,'fontsize',16);
xlabel('q')
ylabel('\Delta G^{charging} (kcal/mol)')
plot(clFEP.q,vdmat*clFEP.x_con,'c<','linewidth',2);
plot(naFEP.q,naFEP.dG,'kx','linewidth',2);
plot(naFEP.q,vdmat*naFEP.x_con,'ro','linewidth',1.5);
legend('Cl FEP','Cl Affine response','Na FEP','Na Affine response', 'location','southeast');

