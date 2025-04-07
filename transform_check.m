
r = [10000; 200000; 300000];
v = [4000; 5000; 6000];
t = 200;
[x,vx]=r2x_transform(r, v, t);
[r_d,v_d]=x2r_transform([0;0;0], vx, t);

disp(r)
disp(v)
disp(r_d)
disp(v_d)