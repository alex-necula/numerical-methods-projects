function [centroids] = clustering_pc(points, NC)
    N = size(points, 1);
    D = size(points, 2);

    % initialization 
    for i = 1:NC
        for k = 1:N/NC 
            clusters(k, :, i) = points(i + (k-1)*NC, :);
        endfor
    endfor
    for i = 1:NC
        centroids(i, :) = mean(clusters(:,:,i))';
    endfor

    for step = 1:20
        clusters = zeros(N, D, NC); % padded 3D matrix with zeros
        clusterIdx = ones(1, NC); % indexes of first padding row in each cluster
        for p = 1:N
            for i = 1:NC
                distance(i) = norm(points(p,:) - centroids(i, :));
            endfor
            [~, minIdx] = min(distance);
            clusters(clusterIdx(minIdx),:,minIdx) = points(p,:);
            clusterIdx(minIdx) = clusterIdx(minIdx) + 1;
        endfor
        for i = 1:NC
            if clusters(1,1,i) != 0 % checking if there are elements in the cluster
                cluster = clusters(1:clusterIdx(i) - 1, :, i); % removing padding
                if clusters(2,1,i) != 0 % checking if there is more than 1 element in cluster
                    centroids(i, :) = mean(cluster)';
                else 
                    centroids(i, :) = cluster;
                endif
            else
                centroids(i, :) = 0;
            endif
        endfor
    endfor
endfunction
