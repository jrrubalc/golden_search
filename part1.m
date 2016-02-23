%
% This code implements the classical four stage fourth order
% Runge Kutta method to solve an ODE system. After the calculation,
% it saves the workspace to a data file.
%
clear
%
m=2;
w0=[.1, 0];
h=0.1;
nstep=25/h;
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


figure
hold on
plot(t(:,1),w(:,1)./.1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w0=[1, 0];
h=0.1;
nstep=25/h;
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

plot(t(:,1),w(:,1),'-r')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w0=[1.5, 0];
h=0.1;
nstep=25/h;
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

plot(t(:,1),w(:,1)./1.5,'-g')
xlabel('t')
ylabel('y(t)/y(0)')
title('Figure 1: y(t)/y(0) against t for t in [0,25]')
h1=legend('y(0)=0.1, y'';(0)=0.0','y(0)=1.0, y''(0)=0.0','y(0)=1.5, y''(0)=0.0')