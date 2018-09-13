epsilon = 0.05;
P = 1.5;
N = 100;

x = linspace(0, 1, N + 1);
y = linspace(0, 1, N + 1);
z = zeros(N+1, N+1);
for i = 1:N+1
    for j = 1:N+1
%         z(i, j) = 3*rand(1, 1);
        z(i, j) = 1/((2 + P*sin(2*pi*x(i)/epsilon))*(2 + P*sin(2*pi*y(j)/epsilon)));
    end
end
h = surf(x, y, z);
% set(h,'edgecolor','none');
view(2);
memory