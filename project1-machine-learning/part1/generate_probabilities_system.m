function [A, b] = generate_probabilities_system(rows)
    n = sum(1:rows);
    A = zeros(n);
    b = ones(n,1);
    b(1:n-rows) = 0;

    A(1,1) = 4; % upper corner
    A(1,[2,3]) = -1;

    A(n,n) = 4; % lower-right corner
    A(n, [n-rows, n-1]) = -1;

    A(n-rows+1, n-rows+1) = 4; % lower-left corner
    A(n-rows+1, [n-2*rows+2, n-rows+2]) = -1;

    k = 1; % left side of triangle
    i = 2;
    while i <= n-2*rows+2
        A(i,i) = 5;
        A(i, [i-k, i+1, i+k+1, i+k+2]) = -1;
        k = k+1;
        i += k;
    endwhile

    k = 2; % right side of triangle
    i = 3;
    while i <= n-rows
        A(i,i) = 5;
        A(i, [i-k, i-1, i+k, i+k+1]) = -1;
        k = k+1;
        i += k;
    endwhile

    for i = n-rows+2:n-1 % bottom side of triangle
        A(i,i) = 5;
        A(i, [i-1, i+1, i-rows, i-rows+1]) = -1;
    endfor

    k = 3; % inside of triangle
    for i = 5:n-rows-1
        if (A(i,i) == 0)
            A(i,i) = 6;
            A(i, [i-k, i-k+1, i-1, i+1, i+k, i+k+1]) = -1;
        else
            k = k+1/2; % k = the level in the triangle
        endif
    endfor

endfunction
