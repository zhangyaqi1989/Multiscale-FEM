% this is a preparation file
%% trapezoidal rule in 1D
n = 1000;
x = linspace(0, 1, n);
y = x.^2/2;
trapz(x, y)

%% trapezoidal rule in 2D
x = -3:.1:3;
y = -5:.1:5;
[X, Y] = meshgrid(x, y);
F = X.^2 + Y.^2;
I = trapz(y, trapz(x, F, 2))

%% 2D mesh
figure;
clf;
hold on;
N = 10;
x = linspace(0, 1, N+1);
y = x;
% [X, Y] = meshgrid(x);
% for i = 1:N
%     for j = 1:N
%         vs = cellVertices(x, y, i, j);
%         vs = [vs; vs(1, :)];
%         plot(vs(:, 1), vs(:, 2));
%         hold on;
%     end
% end
% axis([0, 1, 0, 1])
vs = cellVertices(x, y, 1, 1);
nPoints = 100;
[X, Y] = meshgrid(linspace(vs(1, 1), vs(2, 1), nPoints), linspace(vs(1, 2), vs(4, 2), nPoints));
Z = zeros(nPoints, nPoints);
for k = 1:4
    for i = 1:nPoints
        for j = 1:nPoints
            node = k;
            type = 1;
            Z(i, j) = basefun(x, y, 1, 1, X(i, j), Y(i, j), node, type);
        end
    end
    subplot(2, 2, k);
    h = surf(X, Y, Z);
    set(h,'edgecolor','none');
    title(['# ', num2str(k), ' basis function'])
    view(3);
end

% scatter3(X, Y, Z)
%% map from local index to global index
N = 10;
n = 1;
m = 2;
for i = 1:4
    loc2glo(N, m, n, i)
end

%% test element stiffness matrix
N = 10;
x = linspace(0, 1, N+1);
y = x;
[K, f] = elementstiff(x, y, 1, 1)