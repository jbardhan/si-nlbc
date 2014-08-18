boxlength = 29.9469998677572;
ksi = 2.837;
CONV = 332.112;
forwardPosQ = [ 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.22 0.24 0.26 0.28 0.3 0.32 0.34 0.36 0.38 0.4 0.42 0.44 0.46 0.48 0.5 0.52 0.54 0.56 0.58 0.6 0.62 0.64 0.66 0.68 0.7 0.72 0.74 0.76 0.78 0.8 0.82 0.84 0.86 0.88 0.9 0.92 0.94 0.96 0.98 1 ]';
forwardPosTotals = [ 0.161835 0.267666 0.290294 0.23903 0.0950807 -0.119713 -0.388646 -0.70567 -1.06082 -1.4968 -2.00526 -2.62642 -3.2583 -3.98738 -4.84631 -5.73317 -6.74533 -7.73361 -8.8049 -10.0031 -11.2344 -12.5862 -14.0548 -15.6062 -17.1969 -18.8235 -20.5488 -22.4008 -24.3766 -26.3871 -28.4536 -30.5632 -32.8324 -35.2082 -37.6408 -40.0871 -42.6838 -45.2849 -48.0493 -50.9012 -53.8362 -56.8513 -59.9079 -62.9952 -66.1683 -69.4317 -72.7446 -76.2016 -79.7043 -83.3184 ]';
reversedBackwardPosTotals = [ 0.158889 0.296546 0.28947897 0.25629827 0.14643327 -0.01018573 -0.27339973 -0.57855673 -0.93944173 -1.42701873 -1.97734473 -2.55714073 -3.25810373 -3.97966573 -4.79988773 -5.68083473 -6.64995473 -7.66533473 -8.75470473 -9.95207473 -11.18454473 -12.54975473 -14.00824473 -15.50525473 -17.08996473 -18.79345473 -20.55209473 -22.36076473 -24.31234473 -26.29876473 -28.34161473 -30.55778473 -32.80164473 -35.18428473 -37.60402473 -40.14189473 -42.76582473 -45.36692473 -48.04475473 -50.86131473 -53.73373473 -56.71231473 -59.80149473 -62.93883473 -66.17265473 -69.35500473 -72.65661473 -76.10493473 -79.62274473 -83.26944473 ]';
correctedFPtotals = forwardPosTotals - 0.5*ksi*CONV*forwardPosQ.^2 / boxlength;
correctedBPtotals = reversedBackwardPosTotals - 0.5*ksi*CONV*forwardPosQ.^2 / boxlength;
forwardNegQ = [ -0.02 -0.04 -0.06 -0.08 -0.1 -0.12 -0.14 -0.16 -0.18 -0.2 -0.22 -0.24 -0.26 -0.28 -0.3 -0.32 -0.34 -0.36 -0.38 -0.4 -0.42 -0.44 -0.46 -0.48 -0.5 -0.52 -0.54 -0.56 -0.58 -0.6 -0.62 -0.64 -0.66 -0.68 -0.7 -0.72 -0.74 -0.76 -0.78 -0.8 -0.82 -0.84 -0.86 -0.88 -0.9 -0.92 -0.94 -0.96 -0.98 -1 ]';
forwardNegTotals = [ -0.260747 -0.626865 -1.03802 -1.52584 -2.162 -2.83667 -3.73139 -4.66846 -5.80186 -7.01244 -8.44941 -9.95655 -11.6428 -13.4635 -15.4933 -17.6224 -19.8966 -22.4015 -25.064 -27.868 -30.8355 -33.9837 -37.2216 -40.7407 -44.3212 -48.0765 -51.9044 -55.895 -59.951 -64.2551 -68.5381 -72.9942 -77.77 -82.6219 -87.6154 -92.4999 -97.5429 -102.639 -108.021 -113.466 -119.004 -124.661 -130.565 -136.426 -142.427 -148.752 -155.265 -161.822 -168.516 -175.185 ]';
reversedBackwardNegTotals = [ -0.299177 -0.636837 -1.05325 -1.515509 -2.131081 -2.870085 -3.723308 -4.729328 -5.685985 -6.949095 -8.284085 -9.828645 -11.431815 -13.254785 -15.191695 -17.346725 -19.672495 -22.168145 -24.832265 -27.677855 -30.595965 -33.659835 -36.791675 -40.232085 -43.890715 -47.629765 -51.479305 -55.482375 -59.654895 -63.897205 -68.200935 -72.691205 -77.184455 -81.914235 -86.633765 -91.597165 -96.796285 -102.094475 -107.537555 -113.031235 -118.700435 -124.426285 -130.245185 -136.356165 -142.678345 -148.939385 -155.420675 -161.992485 -168.682105 -175.469085 ]';
correctedFNtotals = forwardNegTotals - 0.5*ksi*CONV*forwardNegQ.^2 / boxlength;
correctedBNtotals = reversedBackwardNegTotals - 0.5*ksi*CONV*forwardNegQ.^2 / boxlength;
Qdata = [0; forwardPosQ; forwardPosQ; forwardNegQ; forwardNegQ;]; 
Edata = [0; correctedFPtotals; correctedBPtotals; correctedFNtotals; correctedBNtotals;];
I = find(abs(Qdata) < 0.2);
lsmatConstrained = [Qdata(I).^2 Qdata(I)];
lsmatUnconstrained = [Qdata(I).^2 Qdata(I) ones(length(Qdata(I)),1)];
xConstrained = lsmatConstrained \ Edata(I);
xUnconstrained = lsmatUnconstrained \ Edata(I);
L_constrained = xConstrained(1);
L_unconstrained = xUnconstrained(1);
phiStatic_constrained = xConstrained(2);
phiStatic_unconstrained = xUnconstrained(2);
offset_unconstrained = xUnconstrained(3);
