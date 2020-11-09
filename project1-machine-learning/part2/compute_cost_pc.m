function [cost] = compute_cost_pc(points, centroids)
    NC = rows(centroids);
    N = rows(points);
    cost = 0;
    for p = 1:N
        for i = 1:NC
            distance(i) = norm(points(p,:) - centroids(i, :));
        endfor
        cost += min(distance);
    endfor
endfunction

