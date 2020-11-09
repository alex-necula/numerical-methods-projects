function [Q, R] = GrammSchmidt(A)
    Q = [];
    n = columns(A);
    for i = 1:n
        s = 0;
        for k = 1:i-1
            s = s + dot(A(:,i), Q(:,k)) * Q(:,k);
        endfor
        U = A(:,i) - s;
        Q = [Q, U / norm(U)];
    endfor
    R = (Q') * A;
endfunction