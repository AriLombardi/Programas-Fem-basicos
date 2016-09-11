function z=bilineal(x,deg,i,j,k,xquad,w)

pquad=x(i)+xquad*(x(i+1)-x(i));
wquad=w*(x(i+1)-x(i));

[dummy,dshj]=shape(x(i),x(i+1),deg,j,pquad);
[dummy,dshk]=shape(x(i),x(i+1),deg,k,pquad);
alpha = diffCoef(pquad);

z=sum(alpha.*dshj.*dshk.*wquad');
end