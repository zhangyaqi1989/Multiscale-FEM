function [vs] = cellVertices(X, Y, m, n)
% counterclockwise
% vs = [x1, y1; x2, y2; x3, y3; x4, y4]; 4*2 
vs = [X(m), Y(n); X(m+1) Y(n); X(m+1), Y(n+1); X(m), Y(n+1)];

end

