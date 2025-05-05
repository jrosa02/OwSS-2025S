function u=get_hmax(t,p,x,u)
%Hamiltonian maximizer
%the solution of H_u(t, p, x,u)=0
tau=0.04;u=p(:,3)/tau;