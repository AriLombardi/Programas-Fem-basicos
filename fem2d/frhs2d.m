function [z] = frhs2d(x)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


% z=ones(1,size(x,1));

% z=-2*(x(:,1)'.^2+x(:,2)'.^2-2);

z=2*pi^2*cos(pi*x(:,1)').*cos(pi*x(:,2)');

end

