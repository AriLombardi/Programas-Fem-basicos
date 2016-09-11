function [erroru,errordu] = computeErrors(p,t,u)

Nel=length(t);
area=zeros(1,Nel);
dx=zeros(1,Nel);
dy=zeros(1,Nel);
for n=1:Nel
    ux=u(t(n,1));
    uy=u(t(n,2));
    uz=u(t(n,3));
    x=p(t(n,1),:);
    y=p(t(n,2),:);
    z=p(t(n,3),:);
    area(n)=abs((y(1)-x(1))*(z(2)-x(2))-(y(2)-x(2))*(z(1)-x(1)))/2;
    dx(n)=((uz-ux)*(y(2)-x(2))-(uy-ux)*(z(2)-x(2)))/((z(1)-x(1))*(y(2)-x(2))-(y(1)-x(1))*(z(2)-x(2)));
    dy(n)=((uy-ux)*(z(1)-x(1))-(uz-ux)*(y(1)-x(1)))/((z(1)-x(1))*(y(2)-x(2))-(y(1)-x(1))*(z(2)-x(2)));
end

erroru=0;
H1x=0;
H1y=0;
[xnod,ynod,wvol]=quad5;
sh=shape2d([xnod' ynod']);

for n=1:Nel
    
  x0=p(t(n,1),1);
  x1=p(t(n,2),1);                     % x-coordinates of vertices
  x2=p(t(n,3),1);
  
  y0=p(t(n,1),2);      
  y1=p(t(n,2),2);                     % y-coordinates of vertices
  y2=p(t(n,3),2);   
  
  
  B=[x1-x0,x2-x0;y1-y0,y2-y0];        % Jacobian of elemental map      
  trans=[x0;y0];                      % translation vector 
  Binv=inv(B);                        % inverse
  Jdet=det(B);                        % determinant 

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ASSEMBLE VOLUME CONTRIBUTIONS

  for k=1:length(wvol)                 % LOOP OVER QUADRATURE POINTS

    [pphys]=B*[xnod(k);ynod(k)]+trans; % physical point
    xp=pphys(1);  
    yp=pphys(2); 
    dv=Jdet*wvol(k)*0.5;               % volume element  

    [uex,dxuex,dyuex]=exactsol(xp,yp);
    uph=u(t(n,1))*sh(1,k)+u(t(n,2))*sh(2,k)+u(t(n,3))*sh(3,k);
    
    erroru = erroru + (uex-uph)^2 * dv;
    H1x = H1x + (dx(n)-dxuex)^2 * dv;
    H1y = H1y + (dy(n)-dyuex)^2 * dv;
  end
end
    
errordu=sqrt(H1x+H1y);
erroru=sqrt(erroru);



