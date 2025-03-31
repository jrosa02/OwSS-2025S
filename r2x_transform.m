function [x,vx]=r2x_transform(r,v,t)
    % parametry
    Rz = 6.37314*1e6 ;
    g = 10*6.6732*5.9736/(6.37314)^2;
    e1=[1;0;0];

    % orbita geostacjonarna
    om0 = 2*pi/86400 ;
    R0 = (g*(Rz/om0)^2)^(1/3);
    v0=om0*R0;
    
    al=om0*t;
    c=cos(al);
    s=sin(al);

    om_mtx=[c -s 0;s c 0;0 0 1]';
    om1_mtx=[s c 0;-c s 0;0 0 0]';

    r1=r/R0;

    x=om_mtx*r1-e1;
    vx=om_mtx*(v/v0)-om1_mtx*r1;