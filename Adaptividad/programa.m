function [p,e,t,u]=programa(g,p,e,t,estrategia,theta,its)
%
%

for it = 1:its
    size(t,2)
    mesh_Matlab2ff(p,e,t,'pruebamesh');
    !freefem++ fem2d_ff_estimador.edp -nowait
    if it<its 
        [p,e,t]=refinaMalla(g,p,e,t,estrategia,theta);
    end
    
end
figure
pdemesh(p,e,t)
load u.txt u;

figure
pdemesh(p,e,t,u)
end

