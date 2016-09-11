function z = formaBilinealLocal(vertices, i, j)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
MJ=[vertices(2,1)-vertices(1,1) vertices(3,1)-vertices(1,1); ...
    vertices(2,2)-vertices(1,2) vertices(3,2)-vertices(1,2)];
iMJ=MJ\eye(2,2);
qpoints = [.5 0;.5 .5;0 .5];
w=[1 1 1]/6;
[dummy,dsh]=shape2d(qpoints);
gi=iMJ'*dsh(:,1:3,i);
gj=iMJ'*dsh(:,1:3,j);
phw=det(MJ)*w;
z=0;
for ii = 1:3
    z=z+phw(ii)*gi(:,ii)'*gj(:,ii);
end
end

