function x_sym_jac = persistent_jacobian(u)

Q = eye(length(u), length(u));

x_sym = sym("x_sym", [7 1]);
u_sym = sym("u_sym", [3 1]);

r = sqrt((x_sym(1) + 1)^2 + x_sym(2)^2 + x_sym(3)^2);

dx = sym('dx', [6 1]); % predefine dx as symbolic 6x1 vector
dx(1) = x_sym(4);
dx(2) = x_sym(5);
dx(3) = x_sym(6);
dx(4) = 2*x_sym(5) + (1 + x_sym(1))*(1 - r^(-3)) + u_sym(1);
dx(5) = -2*x_sym(4) + x_sym(2)*(1 - r^(-3)) + u_sym(2);
dx(6) = -x_sym(3)*r^(-3) + u_sym(3);
dx(7) = u_sym'*Q*u_sym;

x_sym_jac = jacobian(dx, x_sym);
end