clf;
N = 10;
X = linspace(0, 1, N + 1);
Y = linspace(0, 1, N + 1);
m = 1;
n = 1;
vs = cellVertices(X, Y, m, n);
xlow = vs(1, 1);
xhigh = vs(3, 1);
ylow = vs(1, 2);
yhigh = vs(3, 2);

node = 1;
nSamples = 100;
x = linspace(xlow, xhigh, nSamples);
s = zeros(nSamples, 1);
sb = linspace(1, 0, nSamples);
for i = 1:nSamples
    s(i) = basefun(X, Y, m, n, x(i), ylow, node, 1);
end

plot(x, s, 'r-', 'LineWidth', 1.5)
hold on;
plot(x, sb, 'b-.', 'LineWidth', 1.5)
str = 'Boundary condition on $$\Gamma_{1}$$ (bottom edge)';
title(str, 'Interpreter','latex');
xlabel('x')
ylabel('boundary value');
legend(['Multiscale Basis'], ['Bilinear Basis']);


