clf;
epsilon = 0.05;
P = 1.5;
N = 100;

x = linspace(0, epsilon, N + 1);
y = linspace(0, epsilon, N + 1);
z = zeros(N+1, N+1);
for i = 1:N+1
    for j = 1:N+1
%         z(i, j) = 3*rand(1, 1);
        z(i, j) = 1/((2 + P*sin(2*pi*x(i)/epsilon))*(2 + P*sin(2*pi*y(j)/epsilon)));
    end
end
h = surf(x, y, z);
xlim([-0.01, epsilon]);
% set(h,'edgecolor','none');
view(3)
hold on;
% plot3(X1,Y1,Z1,...)
x1 = -0.01*ones(N + 1, 1);
y1 = linspace(0, epsilon, N + 1);
z1 = z(1, :)';
plot3(x1, y1, z1, 'r', 'LineWidth', 1.5);
xlabel('x')
ylabel('y')
zlabel('a')


