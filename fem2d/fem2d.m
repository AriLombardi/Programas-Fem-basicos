clear all

% generación de la malla
% alternativa 1: cargarla

% load coordinates.dat 
% load elements3.dat;
% load dirichlet.dat;

% alternativa 2: usar initmesh
[p,e,t]=initmesh('squareg','Hmax',1);
[p,e,t]=refinemesh('squareg',p,e,t);
[p,e,t]=refinemesh('squareg',p,e,t);
[p,e,t]=refinemesh('squareg',p,e,t);
[p,e,t]=refinemesh('squareg',p,e,t);
coordinates = p';
elements3 = t(1:3,:)';
dirichlet = e(1:2,:)';



Nel = length(elements3);
FreeNodes=setdiff(1:length(coordinates),unique(dirichlet));
A=sparse(length(coordinates),length(coordinates));
b=sparse(length(coordinates),1);
u = sparse(length(coordinates),1);

% Assembly
for k = 1: Nel
    indices = elements3(k,:);
    coords = coordinates(indices,:);
    ML=zeros(3,3);
    bL=zeros(3,1);
    for i = 1:3
        for j = 1:3
            ML(i,j) = formaBilinealLocal(coords,i,j);
        end
        bL(i)= formaLinealLocal(coords,i);
    end
    A(indices,indices) = A(indices,indices) + ML;
    b(indices) = b(indices) + bL;
end

% Dirichlet conditions
u(unique(dirichlet))= u_D(coordinates(unique(dirichlet),:));
b = b-A*u;

% computing the solution
u(FreeNodes)=A(FreeNodes,FreeNodes)\b(FreeNodes);

% graphics
show(elements3,[],coordinates,full(u));

% error
[erroru, errordu]=computeErrors(coordinates, elements3, u)
