function [r,v]=x2r_transform(x, vx, t)
    % parametry
    Rz = 6.37314*1e6 ;
    g = 10*6.6732*5.9736/(6.37314)^2;
    e1=[1;0;0];
    
    % orbita geostacjonarna
    om0 = 2*pi/86400;
    R0 = (g*(Rz/om0)^2)^(1/3);
    
    al=om0*t;
    c=cos(al);
    s=sin(al);
    
    om_mtx = [c -s 0; s c 0; 0 0 1];
    om1_mtx = [s c 0; -c s 0; 0 0 0];

    v0 = om0 * R0;

    r1 = om_mtx * (x + e1);
    r = r1 * R0;

    v = v0 * (om_mtx' * (vx + om1_mtx * r1));