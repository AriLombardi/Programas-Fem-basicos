function [y,d]=shape(a,b,deg,j,xquad)

y=zeros(length(xquad),1);
d=zeros(length(xquad),1);
x=a+(0:deg)/deg*(b-a);
xj=x(j);
x(j)=[];
i=1;
for xp=xquad
    y(i)=prod(xp-x)/prod(xj-x);
    dd=0;
    for s=1:deg
        z=x;
        z(s)=[];
        dd=dd+prod(xp-z);
    end
    d(i)=dd/prod(xj-x);
    i=i+1;
end

