function [hsv] = rgb2hsv_homemade(rgb)
    [height, width, ~] = size(rgb);
    r = single(rgb(:,:,1)) / 255;
    g = single(rgb(:,:,2)) / 255;
    b = single(rgb(:,:,3)) / 255;

    h = zeros(height,width);
    s = zeros(height,width);

    c_max = max(max(r,g),b);
    c_min = min(min(r,g),b);
    delta = c_max - c_min;

    k = (r == c_max & delta != 0);
    h(k) = 60 * mod((g(k) - b(k)) ./ delta(k), 6);
    k = (g == c_max & delta != 0);
    h(k) = 60 * ((b(k) - r(k)) ./ delta(k) + 2);
    k = (b == c_max & delta != 0);
    h(k) = 60 * ((r(k) - g(k)) ./ delta(k) + 4);
    h = h / 360;

    k = (c_max != 0);
    s(k) = delta(k) ./ c_max(k);
    
    v = c_max;

    hsv = cat(3,h,s,v);
end