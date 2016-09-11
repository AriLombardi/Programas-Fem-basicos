function y = L(x,deg,i,j,xquad,w)

pquad=x(i)+xquad*(x(i+1)-x(i));
wquad=w*(x(i+1)-x(i));

[sh,dummy]=shape(x(i),x(i+1),deg,j,pquad);
z=f(pquad);
y=sum(z.*sh.*wquad');