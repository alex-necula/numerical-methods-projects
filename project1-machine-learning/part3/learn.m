function [w] = learn(X, y)
    n = rows(X);
    bias = ones(n, 1);
    X_tilde = [X, bias];
    [Q, R] = Householder(X_tilde);
    w = SST(R, Q' * y);
end
