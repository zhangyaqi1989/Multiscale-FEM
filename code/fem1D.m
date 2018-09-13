% k(x) = 1/x
clf; clc;
n = 100;
h = 1/n;
x = linspace(0, 1, n);

A = zeros(n, n);

for i = 2:n-1
     A(i, i) = 1/(x(i)^2/2 - x(i-1)^2/2) + ...
         1/(x(i+1)^2/2 - x(i)^2/2);
     A(i, i - 1) = -1/(x(i)^2/2 - x(i-1)^2/2);
     A(i, i + 1) = -1/(x(i+1)^2/2 - x(i)^2/2);
end
A = A(2:n-1, 2:n-1);
f = h*ones(n-2, 1);
xfem = A\f;
y = 1/3*x.^2 - x.^3/3;
plot(x, [0; xfem; 0], 'o', 'MarkerSize',4);
hold on;
plot(x, y, '--');
xlabel('x');
ylabel('y');
legend('FEM', 'exact soln');
title('1D MsFEM');
    
