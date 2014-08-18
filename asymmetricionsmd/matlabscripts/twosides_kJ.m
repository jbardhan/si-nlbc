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

qfineNeg = -1:0.01:0;
qfinePos = 0:0.01:+1;

I = find(Qdata <=0);
[fooN,IsortN]=sort(Qdata(I));
xNegative_cl = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_cl_negative = phiStatic_unconstrained*Qdata + Qdata.^2 * ...
    xNegative_cl;
dG_cl_fine_negative = phiStatic_unconstrained*qfineNeg + qfineNeg.^2 * ...
    xNegative_cl;

plot(qfineNeg,cf*dG_cl_fine_negative,'b','linewidth',2);
I = find(Qdata >=0);
[fooP,IsortP]=sort(Qdata(I));
xPositive_cl = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_cl_positive = phiStatic_unconstrained*Qdata + Qdata.^2 * xPositive_cl;
dG_cl_fine_positive = phiStatic_unconstrained*qfinePos + qfinePos.^2 ...
    *xPositive_cl;
plot(qfinePos,cf*dG_cl_fine_positive,'b--','linewidth',2,'markersize',4);

%plot(clFEP.q,vdmat*clFEP.x_con,'c<','linewidth',2);
%[junk,index]=min(clFEP.q); 
%E_final_cl = clFEP.dG(index);
%xLinearCl = 2 * E_final_cl;
%plot(clFEP.q,.5*[clFEP.q.^2]*xLinearCl,'mo','linewidth',2);

cd ../sodium;
sodiumFEPlocal;
naFEP = struct('q',Qdata,'dG',Edata,'L_con',L_constrained,'L_uncon',L_unconstrained,...
'phi_con',phiStatic_constrained,'phi_uncon',phiStatic_unconstrained,'x_con',xConstrained,...
'x_uncon',xUnconstrained,'offset',offset_unconstrained);
plot(naFEP.q(1:2:end),cf*naFEP.dG(1:2:end),'rs','linewidth',1.5,'markersize',10);

I = find(Qdata <=0);
xNegative_na = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_na_negative = phiStatic_unconstrained*Qdata + Qdata.^2 * xNegative_na;
dG_na_fine_negative = phiStatic_unconstrained*qfineNeg +qfineNeg.^2*xNegative_na;
plot(qfineNeg,cf*dG_na_fine_negative,'r','linewidth',2,'markersize',4);
I = find(Qdata >=0);
xPositive_na = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_na_positive = phiStatic_unconstrained*Qdata + Qdata.^2 * xPositive_na;
dG_na_fine_positive = phiStatic_unconstrained*qfinePos + qfinePos.^2 * xPositive_na;
plot(qfinePos,cf*dG_na_fine_positive,'r--','linewidth',2,'markersize',4);


legend('Cl FEP','Cl affine q < 0','Cl affine q > 0','Na FEP',...
       'Na affine q < 0','Na affine q > 0', 'location','south');

cd ..

print -dpng sodium-chloride-asymmetric-fits-kJ.png
print -depsc2 sodium-chloride-asymmetric-fits-kJ.eps
