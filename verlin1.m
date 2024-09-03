%usage:
% setround(-1): round toward downward
% setround(0): round to nearest
% setround(1): round toward upward
% setround(2): round Round toward zero
clear
format longE
N=5;
A=[1 2 -3 5 9; -2 3 5 7 1; 9 -8.5 3 2 1;-1 -3 7 3.5 1;-2 3 -1 1 1];
b=[1; 2; -3; -5; -1]	;
R=inv(A);
x=R*b;
solution=x
setround(-1); % down
Gd=abs(R*A-eye(N));
rd=A*x-b;
setround(1); % up
Gu=abs(R*A-eye(N));
ru=A*x-b;
center=(ru+rd)/2;
radius=center-rd;
ru=max(rd,ru);
Gu=max(Gd,Gu);
R_norm=norm(R,inf);
G_norm=norm(Gu,inf);
Rru=abs(R*center+abs(R)*radius);
setround(-1); % down
Rrd=abs(R*center+abs(R)*radius)
D=1-G_norm;
if D>0
  setround(1); %  up
  Rru=max(Rrd,Rru);
  Rr_norm=norm(Rru,inf);
  error=Rr_norm/D;
  kappa=Gu*ones(N,1);
  error2=Rru+(error*kappa);
  com_wise_erro=error2
  cwerror=max(error2);
else
  puts('false\n');
endif 