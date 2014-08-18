clear all
cd chloride;
chlorideFEPlocal;

vdmat = [Qdata.^2 Qdata];
clFEP = struct('q',Qdata,'dG',Edata,'L_con',L_constrained,'L_uncon',L_unconstrained,...
'phi_con',phiStatic_constrained,'phi_uncon',phiStatic_unconstrained,'x_con',xConstrained,...
'x_uncon',xUnconstrained,'offset',offset_unconstrained);
xLinear = [Qdata.^2]\Edata;

foohandle=plot(clFEP.q,clFEP.dG,'bd','linewidth',1.5,'markersize',12);
hold on
set(gca,'fontsize',16);

I = find(Qdata <=0);
[fooN,IsortN]=sort(Qdata(I));
xNegative_cl = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_cl_negative = phiStatic_unconstrained*Qdata + Qdata.^2 * xNegative_cl;
plot(Qdata(I),dG_cl_negative(I),'co','linewidth',2,'markersize',4);
I = find(Qdata >=0);
[fooP,IsortP]=sort(Qdata(I));
xPositive_cl = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_cl_positive = phiStatic_unconstrained*Qdata + Qdata.^2 * xPositive_cl;
plot(Qdata(I),dG_cl_positive(I),'mo','linewidth',2,'markersize',4);


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
plot(naFEP.q,naFEP.dG,'ks','linewidth',1.5,'markersize',12);

I = find(Qdata <=0);
xNegative_na = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_na_negative = phiStatic_unconstrained*Qdata + Qdata.^2 * xNegative_na;
plot(naFEP.q(I),dG_na_negative(I),'ro','linewidth',2,'markersize',4);
I = find(Qdata >=0);
xPositive_na = [Qdata(I).^2]\(Edata(I)-Qdata(I)* ...
			   phiStatic_unconstrained);
dG_na_positive = phiStatic_unconstrained*Qdata + Qdata.^2 * xPositive_na;
plot(naFEP.q(I),dG_na_positive(I),'go','linewidth',2,'markersize',4);


legend('Cl FEP','Cl affine q < 0','Cl affine q > 0','Na FEP',...
       'Na affine q < 0','Na affine q > 0', 'location','south');

cd ..

print -dpng sodium-chloride-asymmetric-fits.png
print -depsc2 sodium-chloride-asymmetric-fits.eps
