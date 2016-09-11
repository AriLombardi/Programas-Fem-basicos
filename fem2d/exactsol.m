function [u,dx,dy]=exactsol(x,y)
% u=(1-x^2)*(1-y^2);
% dx=-2*x*(1-y^2);
% dy=-2*y*(1-x^2);

u=cos(pi*x)*cos(pi*y);
dx=-pi*sin(pi*x)*cos(pi*y);
dy=-pi*cos(pi*x)*sin(pi*y);