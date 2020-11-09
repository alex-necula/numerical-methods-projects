function [sol] = hsvHistogram(path_to_image, count_bins)
    rgb = imread(path_to_image);
    hsv = rgb2hsv_homemade(rgb);
    binranges = 0:1.01/count_bins:1.01;
    sol = [];
    for i = 1:3
        pixels = reshape(hsv(:,:,i),1,[]);
        bincounts = histc(pixels, binranges);
        sol = [sol, bincounts(1:count_bins)];
    endfor
end