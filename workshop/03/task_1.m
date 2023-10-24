lenna = imread('Lenna.png');
lenna = rgb2gray(lenna);

% a)
lenna_transposed = lenna';
imshow(lenna_transposed);

% b)
lenna_flipped = lenna;
for x = 1:size(lenna, 2)
    lenna_flipped(:, x) = lenna(:, size(lenna, 2) + 1 - x);
end
figure
imshow(lenna_flipped);