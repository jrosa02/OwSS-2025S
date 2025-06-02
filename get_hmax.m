function u=get_hmax(t,p,x,u)
%Hamiltonian maximizer
%the solution of H_u(t, p, x,u)=0
%pochodna względem u
p = p(:, 1:end-1);
B_T = [0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1];
u=p(:, 4:end);