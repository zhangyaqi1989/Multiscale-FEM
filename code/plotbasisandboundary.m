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
% x = linspace(xlow, xhigh, nSamples);
% s = zeros(nSamples, 1);
% for i = 1:nSamples
%     s(i) = basefun(X, Y, m, n, x(i), ylow, node, 1);
% end

% plot(x, s, 'r-', 'LineWidth', 1.5)
% hold on;
nPoints = nSamples;
[x, y] = meshgrid(linspace(vs(1, 1), vs(2, 1), nPoints), linspace(vs(1, 2), vs(4, 2), nPoints));
z = zeros(nPoints, nPoints);
for i = 1:nPoints
    for j = 1:nPoints
        type = 1;
        z(i, j) = basefun(X, Y, 1, 1, x(i, j), y(i, j), node, type);
    end
end
surf(x, y, z);
xlabel('x');
ylabel('y');
zlabel('basis function');
xlim([-0.01, 0.1]);
ylim([-0.01, 0.1]);
hold on;
x1 = linspace(0, 0.1, nPoints);



y1 = -0.01*ones(nPoints, 1);
z1 = z(:, 1);
plot3(x1, y1, z1, 'r-', 'LineWidth', 1.5);

x2 = -0.01*ones(nPoints, 1);
y2 = linspace(0, 0.1, nPoints);
z2 = z(1, :);
plot3(x2, y2, z2, 'r-', 'LineWidth', 1.5);
% plot(x, sb, 'b-.', 'LineWidth', 1.5)
% str = 'Boundary condition on $$\Gamma_{1}$$ (bottom edge)';
% title(str, 'Interpreter','latex');
% xlabel('x')
% ylabel('boundary value');


% legend(['Multiscale Basis'], ['Bilinear Basis']);
