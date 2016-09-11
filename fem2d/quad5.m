function [xnod,ynod,w]=quad5

% 7 node quadrature formula on the reference triangle
% degree of precision: 4
  
  xnod=zeros(1,7);
  ynod=zeros(1,7);
  w=zeros(1,7);

  third =1/3;%0.3333333333333333333333333333;
  a=(9-2*sqrt(15))/21;  %0.0597158717;
  b=(6+sqrt(15))/21;  %0.4701420641;
  c=(9+2*sqrt(15))/21;  %0.7974269853;
  d=(6-sqrt(15))/21;  %0.1012865073d0;
   
  w(1)=0.225;
  w(2)=(155+sqrt(15))/2400*2;  %0.1323941527;
  w(3)=(155+sqrt(15))/2400*2;  %0.1323941527;
  w(4)=(155+sqrt(15))/2400*2;  %0.1323941527;
  w(5)=(155-sqrt(15))/2400*2;  %0.1259391805;
  w(6)=(155-sqrt(15))/2400*2;  %0.1259391805;
  w(7)=(155-sqrt(15))/2400*2;  %0.1259391805;
  
  lam=zeros(3,7);

  lam(1,1)=third;
  lam(2,1)=third;
  lam(3,1)=third;
 
  lam(1,2)=a;
  lam(2,2)=b;
  lam(3,2)=b;  
  
  lam(1,3)=b;
  lam(2,3)=b;
  lam(3,3)=a;  

  lam(1,4)=b;
  lam(2,4)=a;
  lam(3,4)=b;

  lam(1,5)=c;
  lam(2,5)=d;
  lam(3,5)=d;

  lam(1,6)=d;
  lam(2,6)=d;
  lam(3,6)=c;

  lam(1,6)=d;
  lam(2,6)=d;
  lam(3,6)=c;
  
  lam(1,7)=d;
  lam(2,7)=c;
  lam(3,7)=d;

  xnod=lam(1,:);
  ynod=lam(2,:);  










