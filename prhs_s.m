function dp=prhs_s(t,x,u,p)

persistent x_sym_jac
if isempty(x_sym_jac)
    x_sym_jac = persistent_jacobian(u);
end %if

x_sym = sym("x_sym", [7 1]);
u_sym = sym("u_sym", [3 1]);

prhs_lambda_sym = x_sym_jac*p;

prhs_lambda = matlabFunction(prhs_lambda_sym, 'Vars', {x_sym, u_sym});


% Adjoint equations
dp=prhs_lambda(x, u);
%w0=9;ksi=0.01;tau=0.04;k=250;
%dp(1)=w0^2*cos(x(1))*p(2)+(x(1)-pi);
%dp(2)=-p(1)+2*ksi*w0*p(2);
%dp(3)=-k*p(2)+p(3)/tau;
% Additional variable p’=H_u(t)
%dp(4)=p(3)/tau-u;