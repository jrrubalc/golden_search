%
clear
%
load -ascii data7.txt
td=data7(:,1);
yd=data7(:,2);
td=data7(:,1);
yd=data7(:,2);
%
Ta=[3:0.04:7];
n=size(Ta,2);
da=zeros(1,n);
%
for k=1:n,
  da(k)=dd(Ta(k),td,yd);
end
%
save data_d_T
%
%
