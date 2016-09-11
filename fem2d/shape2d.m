function [sh,dsh] = shape2d(qpoints)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for ii = 1:size(qpoints,1)
    x=qpoints(ii,1);
    y=qpoints(ii,2);
    sh(:,ii)=[1-x-y;x;y];
    dsh(:,ii,:)=[-1 1 0;-1 0 1];    
end

