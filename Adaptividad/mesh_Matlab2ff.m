function [  ] = mesh_Matlab2ff(p,e,t,file)
% Guarda la malla generada por matlab (p,e,t) en el archivo file con
% formato msh de freefem
% Modificar condiciones para los labels

nv=length(p);
nt=length(t);
ne=length(e);
fid = fopen([file +'.msh'],'wt');
fprintf(fid,'%1.0f %1.0f %1.0f\n', [nv nt ne]);
for i=1:nv
    x=p(1,i);
    y=p(2,i);
    % agregar condiciones para distintos tipos de bordes
    bl=1;
    fprintf(fid,'%1.12f %1.12f %1.0f\n', [x y bl]);
end
for i=1:nt
    v1=t(1,i);
    v2=t(2,i);
    v3=t(3,i);
    fprintf(fid,'%1.0f %1.0f %1.0f %1.0f\n', [v1 v2 v3 0]);
end
for i=1:ne
    v1=e(1,i);
    v2=e(2,i);
    % agregar condiciones para distintos tipos de borde 
    bl=1;
    fprintf(fid,'%1.0f %1.0f %1.0f\n', [v1 v2 bl]);
end
fclose(fid);
end

