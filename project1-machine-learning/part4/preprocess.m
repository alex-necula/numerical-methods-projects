function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
    [names_cats, n1] = getImgNames(strcat(path_to_dataset, 'cats/'));
    [names_not_cats, n2] = getImgNames(strcat(path_to_dataset, 'not_cats/'));

    y = [ones(n1,1); -ones(n2,1)];
    X = zeros(n1 + n2, count_bins * 3);
    
    if (strcmp(histogram, 'RGB'))
        createHistogram = @rgbHistogram;
    else
        createHistogram = @hsvHistogram;
    endif

    for i = 1:n1    
        path_to_image = strcat(strcat(path_to_dataset, 'cats/'), names_cats(i, :));
        X(i, :) = createHistogram(path_to_image, count_bins);
    endfor

    for i = n1+1:n1+n2
        path_to_image = strcat(strcat(path_to_dataset, 'not_cats/'), names_not_cats(i - n1, :));
        X(i, :) = createHistogram(path_to_image, count_bins);
    endfor
endfunction
