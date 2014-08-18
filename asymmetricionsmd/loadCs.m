boxlength = 29.9469998677572;
ksi = 2.837;
CONV = 332.112;
forwardPosQ = [ 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.22 0.24 0.26 0.28 0.3 0.32 0.34 0.36 0.38 0.4 0.42 0.44 0.46 0.48 0.5 0.52 0.54 0.56 0.58 0.6 0.62 0.64 0.66 0.68 0.7 0.72 0.74 0.76 0.78 0.8 0.82 0.84 0.86 0.88 0.9 0.92 0.94 0.96 0.98 1 ]';
forwardPosTotals = [ 0.173134 0.310355 0.381475 0.415097 0.385922 0.311745 0.245899 0.108849 -0.0634758 -0.304148 -0.585716 -0.88445 -1.23993 -1.58838 -2.02294 -2.48343 -2.98258 -3.50249 -4.07186 -4.715 -5.40064 -6.15509 -6.90206 -7.71536 -8.55646 -9.45129 -10.4114 -11.4086 -12.4406 -13.4931 -14.6263 -15.7985 -17.0002 -18.2356 -19.5533 -20.8728 -22.2211 -23.6916 -25.1398 -26.6879 -28.3039 -29.9626 -31.6129 -33.3175 -35.0744 -36.8574 -38.7112 -40.6631 -42.6682 -44.6884 ]';
reversedBackwardPosTotals = [ 0.161399 0.2606118 0.3732708 0.3947976 0.3763858 0.3350959 0.2181779 0.0942569000000001 -0.0981860999999999 -0.3298091 -0.5736561 -0.8861091 -1.2003831 -1.5831241 -2.0192481 -2.4888551 -2.9967081 -3.5578641 -4.1435131 -4.7533941 -5.4174951 -6.1473711 -6.9272171 -7.7092321 -8.5642851 -9.4772021 -10.3916361 -11.3588821 -12.3726621 -13.4664321 -14.5478821 -15.6932221 -16.8649721 -18.1206721 -19.3862121 -20.7367521 -22.1267421 -23.5914021 -25.0498021 -26.5692621 -28.1408121 -29.7959221 -31.4984921 -33.2087621 -35.0053921 -36.8382721 -38.6851221 -40.5830521 -42.5780521 -44.6081721 ]';
correctedFPtotals = forwardPosTotals - 0.5*ksi*CONV*forwardPosQ.^2 / boxlength;
correctedBPtotals = reversedBackwardPosTotals - 0.5*ksi*CONV*forwardPosQ.^2 / boxlength;
forwardNegQ = [ -0.02 -0.04 -0.06 -0.08 -0.1 -0.12 -0.14 -0.16 -0.18 -0.2 -0.22 -0.24 -0.26 -0.28 -0.3 -0.32 -0.34 -0.36 -0.38 -0.4 -0.42 -0.44 -0.46 -0.48 -0.5 -0.52 -0.54 -0.56 -0.58 -0.6 -0.62 -0.64 -0.66 -0.68 -0.7 -0.72 -0.74 -0.76 -0.78 -0.8 -0.82 -0.84 -0.86 -0.88 -0.9 -0.92 -0.94 -0.96 -0.98 -1 ]';
forwardNegTotals = [ -0.179107 -0.418171 -0.697744 -1.01438 -1.40857 -1.85582 -2.35854 -2.87081 -3.46956 -4.1086 -4.81419 -5.61003 -6.4571 -7.34302 -8.28256 -9.28064 -10.3217 -11.4378 -12.6697 -13.9891 -15.3728 -16.836 -18.3557 -19.9544 -21.5739 -23.3303 -25.1254 -26.9397 -28.8943 -30.8665 -32.9811 -35.1036 -37.3807 -39.6489 -42.0102 -44.5097 -46.9852 -49.5669 -52.1683 -54.9023 -57.739 -60.5638 -63.5571 -66.5839 -69.7451 -72.9146 -76.107 -79.3991 -82.7322 -86.1385 ]';
reversedBackwardNegTotals = [ -0.188859 -0.439792 -0.747562 -1.089485 -1.494832 -1.932563 -2.43065 -2.980337 -3.552249 -4.180284 -4.876318 -5.666751 -6.503535 -7.376108 -8.331183 -9.306692 -10.361062 -11.529402 -12.742242 -14.049672 -15.435892 -16.855142 -18.356942 -19.912252 -21.534062 -23.265022 -25.022572 -26.904962 -28.783802 -30.802692 -32.864532 -34.991252 -37.197212 -39.514852 -41.865012 -44.303072 -46.794912 -49.366242 -52.035012 -54.780872 -57.563022 -60.446082 -63.403932 -66.451452 -69.568662 -72.694692 -75.964202 -79.235342 -82.570032 -86.023232 ]';
correctedFNtotals = forwardNegTotals - 0.5*ksi*CONV*forwardNegQ.^2 / boxlength;
correctedBNtotals = reversedBackwardNegTotals - 0.5*ksi*CONV*forwardNegQ.^2 / boxlength;
Qdata = [0; forwardPosQ; forwardPosQ; forwardNegQ; forwardNegQ;]; 
Edata = [0; correctedFPtotals; correctedBPtotals; correctedFNtotals; correctedBNtotals;];
I = find(abs(Qdata)<0.2);
lsmatConstrained = [Qdata(I).^2 Qdata(I)];
lsmatUnconstrained = [Qdata(I).^2 Qdata(I) ones(length(Qdata(I)),1)];
xConstrained = lsmatConstrained \ Edata(I);
xUnconstrained = lsmatUnconstrained \ Edata(I);
L_constrained = xConstrained(1);
L_unconstrained = xUnconstrained(1);
phiStatic_constrained = xConstrained(2);
phiStatic_unconstrained = xUnconstrained(2);
offset_unconstrained = xUnconstrained(3);
