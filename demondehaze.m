clc;clear ;
% close all; 
for ID=33

s=num2str(ID);
S='./hazy\h';
s1=[S,s,'.bmp'];
f=imread(s1);

f1=double(f);
% f1 = imresize(f1,0.5);
[m,n,~]=size(f1);

% A=max(max(f1));
% A=reshape(A,1,3);
A=[255,255,255];
f2=f1;
f3=f1;
f4=f1;
tt1=1-(f1(:,:,1)./A(1));
tt2=1-(f1(:,:,2)./A(2));
tt3=1-(f1(:,:,3)./A(3));

% betat=100;betar=1;
betat=100;betar=.1;
[t1,R1]=admgp(log(tt1+eps),betat,betar);
[t2,R2]=admgp(log(tt2+eps),betat,betar);
[t3,R3]=admgp(log(tt3+eps),betat,betar);


e=0.4;%default value;
% e=0.1;
r1=A(1)+(f1(:,:,1)-A(1))./max(exp(t1),e);
r2=A(2)+(f1(:,:,2)-A(2))./max(exp(t2),e);
r3=A(3)+(f1(:,:,3)-A(3))./max(exp(t3),e);

f3(:,:,1)=ls1(r1);
f3(:,:,2)=ls1(r2);
f3(:,:,3)=ls1(r3);
ff3=imadjust(f3,[0,0,0;1,1,1],[],0.7);

figure;imshow(uint8(f1));
figure;imshow(ff3);
end
