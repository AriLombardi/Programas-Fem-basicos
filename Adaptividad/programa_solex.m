function [p,e,t,u]=programa_solex(g,p,e,t,estrategia,theta,its)
%
%

% crea el archivo err.txt que guardar� el historial de errores
aaa=[];
save 'err.txt' aaa -ascii

for it = 1:its
    size(t,2)
    mesh_Matlab2ff(p,e,t,'pruebamesh');
    !freefem++ fem2d_ff_estimador_solex.edp -nowait
    if it<its 
        [p,e,t]=refinaMalla(g,p,e,t,estrategia,theta);
    end
    
end
figure
pdemesh(p,e,t)
load u.txt u;

figure
pdemesh(p,e,t,u)

load err.txt

disp('Nb nodos --- error L2 --- error semi H1')
err

disp('Orden L2')
(log(err(2:its,2))-log(err(1:its-1,2)))./(log(err(2:its,1))-log(err(1:its-1,1)))

errh1 = [err(:,1) err(:,2)+err(:,3)];
disp('Orden H1')
(log(errh1(2:its,2))-log(errh1(1:its-1,2)))./(log(errh1(2:its,1))-log(errh1(1:its-1,1)))

end

