%
% This code implements the classical four stage fourth order
% Runge Kutta method to solve an ODE system. After the calculation,
% it saves the workspace to a data file.
%
clear
figure(1)
%
m=2;
n=0;
A=0.05:0.05:1.5;
index=30;
T=zeros(1,30);
for index=1:30
w0=[A(1,index), 0];
h=0.05;
nstep=20/h;
%
w=zeros(nstep+1,m);
t=zeros(nstep+1,1);
t(1)=0;
w(1,1:m)=w0;
%
p=4;
d=[0,   1/2, 1/2, 1  ];
c=[0,   0,   0,   0  ;
   1/2, 0,   0,   0  ;
   0,   1/2, 0,   0  ;
   0,   0,   1,   0  ];
b=[1/6, 1/3, 1/3, 1/6];
k=zeros(p,m);
%
for j=1:nstep,
  for i=1:p,
    k(i,1:m)=h*f_sys(w(j,1:m)+c(i,1:i-1)*k(1:i-1,1:m), t(j)+d(i)*h);
  end
  w(j+1,1:m)=w(j,1:m)+b*k;
  t(j+1)=t(j)+h;
end


td=t(:,1);
yd=w(:,1);
%


%
a=6;
b=9;
tol=1.0e-10;
n=0;
%begin g.s.
g=(sqrt(5)-1)/2;
r1=a+(b-a)*(1-g);
f1=dd(r1,td,yd);
r2=a+(b-a)*g;
f2=dd(r2,td,yd);
%
%
while (b-a) > tol
  n=n+1;
  if f1 < f2
    b=r2;
    r2=r1
    f2=f1
    r1=a+(b-a)*(1-g)
    f1=dd(r1,td,yd)
  else
    a=r1
    r1=r2;
    f1=f2;
    r2=a+(b-a)*g;
    f2=dd(r2,td,yd);
  end
end
T(1,index)=(a+b)/2;
save data_d_T
end
plot(A(1,:),T(1,:)./(2*pi))
