function [z] = formaLinealLocal(vertices,i)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

MJ=[vertices(2,1)-vertices(1,1) vertices(3,1)-vertices(1,1); ...
    vertices(2,2)-vertices(1,2) vertices(3,2)-vertices(1,2)];
qpoints = [.5 0;.5 .5;0 .5];
w=[1 1 1]/6;
phw=det(MJ)*w;
phqpoints = (MJ*qpoints'+repmat(vertices(1,:),size(qpoints,1),1)')';
ff=frhs2d(phqpoints);
[sh,dummy]=shape2d(qpoints);

z=sum(phw.*ff.*sh(i,:));

end

