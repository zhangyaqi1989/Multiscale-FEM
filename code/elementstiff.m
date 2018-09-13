function [K, f] = elementstiff(X, Y, m, n)


epsilon = 0.05;
P = 1.5;
nSamples = 40; % sample points in trapz in each direction
K = zeros(4, 4);
vs = cellVertices(X, Y, m, n);
xlow = vs(1, 1);
xhigh = vs(3, 1);
ylow = vs(1, 2);
yhigh = vs(3, 2);

x = linspace(xlow, xhigh, nSamples);
y = linspace(ylow, yhigh, nSamples);

for i = 1:4 
    for j = 1:4
        % basefun(X, Y, m, n, x, y, node, type)
        F = zeros(nSamples, nSamples);
        % calculate F
        for p = 1:nSamples
            for q = 1:nSamples
                F(p, q) = dot(basefun(X, Y, m, n, x(p), y(q), i, 2), ...
                    basefun(X, Y, m, n, x(p), y(q), j, 2))*...
                    (1/(2 + P*sin(2*pi*x(p)/epsilon))/(2 + P*sin(2*pi*y(q)/epsilon)));
%                 F(p, q) = dot(basefun(X, Y, m, n, x(p), y(q), i, 2), ...
%                     basefun(X, Y, m, n, x(p), y(q), j, 2));
            end
        end
        K(i, j) = trapz(y, trapz(x, F, 2));
    end
end
f = zeros(4, 1);
for i = 1:4
    F = zeros(nSamples, nSamples);
    for p = 1:nSamples
        for q = 1:nSamples
            F(p, q) = -1*basefun(X, Y, m, n, x(p), y(q), i, 1);
        end
    end
    f(i) = trapz(y, trapz(x, F, 2));
end
end