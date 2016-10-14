clear all

a=0;
b=1;
nn=1;
x=a+(0:nn)/nn*(b-a);
Nel = length(x)-1;

% Condiciones de Dirichlet ()
dir=[1 2]; % puede ser [1]: extremo izq, [2]: extremo der., o [1 2]: ambos
cdir=[0 0]; % valor de la condición de Dirichlet

% grado
deg=30;
[xquad,w]=gauleg(0,1,2*deg); % puntos de cuadratura en intervalo [0,1]
% [xquad,w]=gauleg(0,1,5);

% grados de libertad
ndf=Nel*deg-1;
xnodes=zeros(1,ndf+2);
for i=1:Nel
    xnodes(deg*(i-1)+1:deg*i)=x(i)+(0:(deg-1))/deg*(x(i+1)-x(i));
end
xnodes(ndf+2)=b;

% matriz de rigidez
A=sparse(ndf+2,ndf+2);
% rhs
b=zeros(ndf+2,1);

% Assemble
Ai=zeros(deg+1,deg+1);

for i=1:Nel
    for j=1:deg+1
        for k=1:deg+1
            Ai(j,k)=bilineal(x,deg,i,j,k,xquad,w);
        end
        b(deg*(i-1)+j)=b(deg*(i-1)+j)+L(x,deg,i,j,xquad,w);
    end
    ind=deg*(i-1)+1;
    
    A(ind:ind+deg,ind:ind+deg) = A(ind:ind+deg,ind:ind+deg)+Ai;
end

if (length(dir)==2)
    b(2:deg+1)=b(2:deg+1)-cdir(1)*A(2:deg+1,1);
    b(end-deg:end-1)=b(end-deg:end-1)-cdir(2)*A(end-deg:end-1,end);
    y=A(2:end-1,2:end-1)\b(2:end-1);
    y=[cdir(1);y;cdir(2)];
else
    if (dir(1)==1)
        b(2:deg+1)=b(2:deg+1)-cdir(1)*A(2:deg+1,1);
        y=A(2:end,2:end)\b(2:end);
        y=[cdir(1);y];
    else %dir(1)=2
        b(end-deg:end-1)=b(end-deg:end-1)-cdir(1)*A(end-deg:end-1,end);
        y=A(1:end-1,1:end-1)\b(1:end-1);
        y=[y;cdir(1)];
    end
end
        
xx=0:.01:1;
% solex=@(xx)1+xx.*(1-xx)/2;
% solex = @(xx)exp(xx).*(1-xx);

a1=1; a2=10;
C=(3+a2/a1)/(4*(a1+a2));
D=-(3+a1/a2)/(4*(a1+a2));
solex = @(xx)(-1/(2*a1)*xx.^2+C*xx).*(xx<.5) + (-1/(2*a2)*(xx-1).^2+D*(xx-1)).*(xx>=.5); 

% solex=@(x)10/pi^2*sin(pi*x);
% solex = @(x)exp(x)+x.^2;

plot(xx,solex(xx),'r');
max(y'-solex(xnodes))

hold on
plot(xnodes,y,'b')

