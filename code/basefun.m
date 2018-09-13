function value = basefun(X, Y, m, n, x, y, node, type)
% type == 1: function value
% type == 2: gradient value
[vs] = cellVertices(X, Y, m, n);
nextnode = node + 1;
if nextnode > 4
    nextnode = 1;
end
prenode = node - 1;
if prenode < 1
    prenode = 4;
end
if type == 1 % function value
    if node == 1 || node == 3
        mux = mu(vs(nextnode, 1), vs(node, 1), x);
        muy = mu(vs(prenode, 2), vs(node, 2), y);
    end
    if node == 2 || node == 4
        mux = mu(vs(prenode, 1), vs(node, 1), x);
        muy = mu(vs(nextnode, 2), vs(node, 2), y);
    end
    value = mux*muy;
end

if type == 2 % gradient value
    if node == 1 || node == 3
        mux = mu(vs(nextnode, 1), vs(node, 1), x);
        mugradx = mugrad(vs(nextnode, 1), vs(node, 1), x);
        muy = mu(vs(prenode, 2), vs(node, 2), y);
        mugrady = mugrad(vs(prenode, 2), vs(node, 2), y);
    end
    if node == 2 || node == 4
        mux = mu(vs(prenode, 1), vs(node, 1), x);
        mugradx = mugrad(vs(prenode, 1), vs(node, 1), x);
        muy = mu(vs(nextnode, 2), vs(node, 2), y);
        mugrady = mugrad(vs(nextnode, 2), vs(node, 2), y);
    end
    value = [mugradx*muy; mugrady*mux];
end

end

function r = fun(t) % can be used for x and y
    epsilon = 0.05;
    P = 1.5;
    r = 2*t - epsilon/(2*pi)*P*cos(2*pi*t/epsilon);
end

function r = mu(tend, tstart, t) % cen be used for x and y
    %%% bilinear
%     r = (tend - t)/(tend - tstart); % bilinear base function
    %%% multiscale
    fend = fun(tend);
    r = (fend - fun(t))/(fend - fun(tstart));
end

function r = mugrad(tend, tstart, t) % can be used for x and y
    epsilon = 0.05;
    P = 1.5;
    %%% multiscale
    numerator = -(2 + P*sin(2*pi*t/epsilon));
    denominator = fun(tend) - fun(tstart);
    %%% bilinear 
%     numerator = -1; % bilinear base funtion
%     denominator = tend - tstart;


    r = numerator/denominator;
end



