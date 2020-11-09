function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    [X, y_check] = preprocess(path_to_testset, histogram, count_bins);
    n = rows(X);
    bias = ones(n, 1);
    X_tilde = [X, bias];
    good = 0;
    for i = 1:n
        y = dot(w', X_tilde(i, :));
        if ((y >= 0) && (y_check(i) == 1)) || ((y <= 0) && (y_check(i) == -1))
            good = good + 1;
        endif
    endfor
    percentage = good / n;
endfunction