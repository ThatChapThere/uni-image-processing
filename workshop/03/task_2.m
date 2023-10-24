x_image = imread('x.png');
x_image = rgb2gray(x_image);

% a)

% Original size
m = size(x_image, 2); % Width
n = size(x_image, 1) % Height

% New size
p = 1000; % Width
q = 1000; % Height

% Scaling factors
s1 = p/m; % Width
s2 = q/n; % Height

x_linear_interpolated = zeros(q, p);
for i = 1:p - 1
    for j = 1:q - 1
        q / s2
        x_linear_interpolated(j, i) = x_image(round(j / s2) + 1, round(i / s1) + 1);
    end
end

imshow(x_linear_interpolated)