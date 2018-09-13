clc; clear;
tic
% setting parameters
N = 10;
nSamples = 10;
M = nSamples;
P = 1.5;
fprintf('Coarse Grid %d X %d \n', N, N);
fprintf('Fine Grid %d X %d \n', M, M);
usebilinear = true;
% domain [0, 1]X[0, 1]
x = linspace(0, 1, N+1);
y = x;
nNodes = (N+1)*(N+1);
K = zeros(nNodes, nNodes);
F = zeros(nNodes, 1);
% assemble global stiff matrix K and load F
for i = 1:N
    for j = 1:N
        [k, f] = elementstiff(x, y, i, j);
%         idx = loc2glo(N, m, n, i)
        for p = 1:4
            for q = 1:4
                global_p = loc2glo(N, i, j, p);
                global_q = loc2glo(N, i, j, q);
                K(global_p, global_q) = K(global_p, global_q) + k(p, q);
            end
        end
        for p = 1:4
            global_p = loc2glo(N, i, j, p);
            F(global_p) = F(global_p) + f(p);
        end
    end
end

% add boundary condition
zeroValueIdx = zeros(nNodes, 1);
count = 0;
for i = 1:N
    for j = 1:N
        vs = cellVertices(x, y, i, j);
        for p = 1:4
            coordx = vs(p, 1);
            coordy = vs(p, 2);
            if coordx == 0 || coordx == 1 || coordy == 0 || coordy == 1
                count = count + 1;
                zeroValueIdx(count) = loc2glo(N, i, j, p);
            end
        end
    end
end
zeroValueIdx = zeroValueIdx(1:count);

for i = 1:length(zeroValueIdx)
    K(zeroValueIdx(i), :) = 0;
    K(:, zeroValueIdx(i)) = 0;
    K(zeroValueIdx(i), zeroValueIdx(i)) = 1;
    F(zeroValueIdx(i)) = 0;
end
disp('Finish Assembly');
% solve
u = K\F;
disp('Finish Solving Au=f')
toc
Z = reshape(u, N+1, N+1)';
[X, Y] = meshgrid(x, y);
figure(1);
h = surf(X, Y, Z);
% title('Node value')
% set(h,'edgecolor','none');

figure(2)
% nSamples = 10;
for i = 1:N
    for j = 1:N
        % basefun(X, Y, m, n, x, y, node, type)
        vs = cellVertices(x, y, i, j);
        xlow = vs(1, 1);
        xhigh = vs(3, 1);
        ylow = vs(1, 2);
        yhigh = vs(3, 2);
        xs = linspace(xlow, xhigh, nSamples);
        ys = linspace(ylow, yhigh, nSamples);
        zs = zeros(nSamples, nSamples);
        for node = 1:4
            gloidx = loc2glo(N, i, j, node);
            nodevalue = u(gloidx);
            for p = 1:nSamples
                for q = 1:nSamples
                    zs(p, q) = zs(p, q) + nodevalue*(basefun(x, y, i, j,...
                        xs(p), ys(q), node, 1));
                end
            end
        end
        surf(xs, ys, zs');
        hold on;
    end
end
% title('Interpolation Field');
% memory
