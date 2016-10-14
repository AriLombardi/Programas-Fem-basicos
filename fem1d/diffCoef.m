function y = diffCoef(x)
% y=ones(length(x),1);
% y=(x.^2+1)';
y=((x<.5)+10*(x>=.5))';