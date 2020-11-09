function [w] = learn(X, y, lr, epochs)
    n = rows(X);
    m = columns(X);
    w = rand(m+1,1) / 5 - 0.1;

    for i = 1:m
        X(:,i) = (X(:,i) - mean(X(:,i))) / std(X(:,i));
    endfor

    bias = ones(n, 1);
    X_tilde = [X, bias];
    for epoch = 1:epochs
        index = randi(n, 64, 1);
        X_batch = X_tilde(index, :);
        y_batch = y(index, 1);
        s = 0;
        for i = 1:m+1
            for j = 1:64
            s += (X_batch(j,:)*w - y_batch(j)) * X_batch(j,i);
            endfor
            w(i) = w(i) - lr * 1/n * s;
        endfor
    endfor
endfunction
