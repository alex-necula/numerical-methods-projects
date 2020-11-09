function [Q, R] = Householder(A)
    n = columns(A);
    m = rows(A);
    Q = eye(m);
    for p = 1:min(m-1,n)
        V = zeros(m,1);
        for i = p+1:m
            V(i) = A(i,p);
        endfor
        x = sign(A(p,p)) * norm(A(p:m,p));
        V(p) = A(p,p) + x;
        H = eye(m) - 2* (V * V') / (V' * V);
        A = H * A;
        Q = Q * H;
    endfor
    R = A;
endfunction