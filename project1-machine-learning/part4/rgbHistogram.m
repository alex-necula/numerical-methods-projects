function [sol] = rgbHistogram(path_to_image, count_bins)
    rgb = imread(path_to_image);
    binranges = 0:256/count_bins:256;
    sol = [];
    for i = 1:3
        pixels = reshape(rgb(:,:,i),1,[]);
        bincounts = histc(pixels, binranges);
        sol = [sol, bincounts(1:count_bins)];
    endfor
end