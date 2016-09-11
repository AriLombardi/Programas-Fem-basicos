function z = u_D(x)
% z=ones(1,size(x,1));
z = cos(pi*x(:,1)').*cos(pi*x(:,2)');

end