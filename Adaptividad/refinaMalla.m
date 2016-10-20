function [ p,e,t ] = refinaMalla(g,p,e,t,estrategia,theta)
% Refina la malla [p,e,t] de la geometría g.
% Los valores de los estimadores deben estar en el archivo 'estimadores.txt'
% estrategia = 1: refina los elementos con estimador > theta*max(estimadores)
% estrategia = 2: ordena estimadores de mayor a menor, suma desde el mayor
%   los cuadrados de los estimadores hasta que la suma supera theta * (suma total),
%   y refina esos elementos.

load estimadores.txt        % carga los estimacores calculados con freefem 
Nel=length(estimadores);
marcados=[];                % va a contener los elementos marcados

if estrategia == 1          % estategia del máximo
    maxEstim=max(estimadores);      % clacula el máximo estimador
    for i=1:Nel
        if (estimadores(i)>theta*maxEstim) 
            marcados=[marcados;i];      % agrega el elemento i
        end
    end
else                        % estragia de la suma
    [est_ord,ind]=sort(estimadores,'descend');      % ordena de mayor a menor los estimadores
    suma_total=sum(estimadores.^2);
    suma_acum=0;
    ii=0;
    while suma_acum<theta*suma_total
        ii=ii+1;
        suma_acum=suma_acum+est_ord(ii)^2;
        marcados=[marcados;ind(ii)];            % agrega el elemento i
    end
end
[p,e,t]=refinemesh(g,p,e,t,marcados);         % refina la malla (y sobreescribe los datos)  
figure
pdemesh(p,e,t)              % grafica la malla
end
        


