function [x] = SST(A, b)
    n = columns(A);
    A = A(1:n, 1:n);
    x = [b(n) / A(n, n)];
    for i = n-1:-1:1
        x = [(b(i) - A(i, [i+1:n]) * x) / A(i,i); x];
    endfor
end
    