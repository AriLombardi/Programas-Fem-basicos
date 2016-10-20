function [p,e,t,u]=programa(g,p,e,t,estrategia,theta,its)
%   g: geometría
%   p,e,t: malla inicial
%   estrategia: 1 o 2 (estrategia de marcado)
%   theta: parámetro para usar en la estrategia de marcado
%   its: cantidad de iteraciones


for it = 1:its
    size(t,2)
    mesh_Matlab2ff(p,e,t,'pruebamesh');     % guarda la malla en formato freefem
    % ejecuta el freefem, resulelve y calcula estimadores
    % sin solución exacta
    % !freefem++ fem2d_ff_estimador.edp -nowait
    % con solución exacta
    !freefem++ fem2d_ff_estimador_solex.edp -nowait
    if it<its 
        [p,e,t]=refinaMalla(g,p,e,t,estrategia,theta);   % refina la malla teniendo en cuenta los estimadores   
    end
    
end
figure
pdemesh(p,e,t)
load u.txt u;

figure
pdemesh(p,e,t,u)
end

