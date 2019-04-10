%sample_x=[1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5;1.5];
sample_z=[0.0001	0.0991	0.1981	0.2971	0.3961	0.4951	0.5941	0.6931	0.7921	0.8911	0.9901	1.0891	1.1881	1.2871	1.3861	1.4851	1.5841	1.6831	1.7821	1.8811	1.9801	2.0791	2.1781	2.2771	2.3761	2.4751	2.5741	2.6731	2.7721	2.8711	2.9701];
sample_vx=[0	-0.00633609	-0.00663832	-0.00918062	-0.01981	-0.0269034	-0.0268446	-0.0426354	-0.0526351	-0.0771519	-0.0870007	-0.0968522	-0.110087	-0.122814	-0.13664	-0.141325	-0.138651	-0.141701	-0.134135	-0.124838	-0.108272	-0.0868779	-0.061004	-0.0324431	0.018077	0.0636783	0.15246	0.270163	0.381283	0.533207	0.722804];

% A = importdata("LengthPointsVelocity_Vel.x_art.csv",';',2);
% B=sortrows(A.data,4);   %sort data by x-velocity
% B(:,1)=[];              %delete particle number markers
% B=unique(B,'rows');     %remove duplicate rows in B -- these are particles in the bin
% 
% F=scatteredInterpolant(B(:,1),B(:,2),B(:,3));   %interpolant of x component of velocity
% sample_vx=F(sample_x,sample_y);

figure(1)
hold on
scatter(sample_z,sample_vx)
xlabel('r_z')
ylabel('v_x')
title('t=10.0001s')
% daspect([1 1 1]);
%fitcurve=fit(transpose(sample_vx),transpose(sample_y),'smoothingspline');

%manually fit spline interpolant in editor
%then run: set(gca,'View',[90 -90])
%to flip axes the same way as Ghia paper