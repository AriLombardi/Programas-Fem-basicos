function [ p,e,t ] = refinaMalla(g,p,e,t,estrategia,theta)
% Refina la malla [p,e,t] de la geometría g.
% Los valores de los estimadores deben estar en el archivo 'estimadores.txt'
% estrategia = 1: refina los elementos con estimador > theta*max(estimadores)
% estrategia = 2: ordena estimadores de mayor a menor, suma desde el mayor
% hasta que la suma supera theta * suma total, y refina esos elementos.

load estimadores.txt
Nel=length(estimadores);
marked=[];

if estrategia == 1
    maxEstim=max(estimadores);
    for i=1:Nel
        if (estimadores(i)>theta*maxEstim) marked=[marked;i];
        end
    end
else
    [est_ord,ind]=sort(estimadores,'descend');
    suma_total=sum(estimadores);
    suma_acum=0;
    ii=0;
    while suma_acum<theta*suma_total
        ii=ii+1;
        suma_acum=suma_acum+est_ord(ii);
        marked=[marked;ind(ii)];
    end
end
[p,e,t]=refinemesh(g,p,e,t,marked);
figure
pdemesh(p,e,t)
end
        


