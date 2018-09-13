function idx = loc2glo(N, m, n, i)
% N: number of elements in one direction
if i <= 2 % bottom
    idx = (N+1)*(n-1) + m + i - 1;
else % top 
    if i == 3
        d = 1;
    else % i == 4
        d = 0;
    end
    idx = (N+1)*n + m + d;
end

end

