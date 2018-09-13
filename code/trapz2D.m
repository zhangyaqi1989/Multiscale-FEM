function [int] = trapz2D(xlow, xhigh, ylow, yhigh, fun)
n = 4;
x = linspace(xlow, xhigh, n);
y = linspace(ylow, yhigh, n);
F = zeros(n, n);
for i = 1:n
    for j = 1:n
        F(i, j) = fun(x(i), y(j));
    end
end
int = trapz(y, trapz(x, F, 2));
end

