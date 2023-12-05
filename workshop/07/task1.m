broken_text = imread('broken-text.tif');
coins = imread('coins.gif');
noisy_fingerprint = imread('noisy-fingerprint.tif');
shapes = imread('shapes.tif');

% We will try to:
% - Fix broken text
% - Do something interesting with the coins
% - Remove the nose from the fingerprint
% - Do something interesting with the shapes

% === Fixing Broken Text ===

% The diamond structure element has radius as an argument, not width
text_fixer_se = strel('diamond', 1);

% Dilate using structuring element
fixed_text = imdilate(broken_text, text_fixer_se);
imshow(fixed_text);

% === Testing Closing on Coins Image ===
%closed_coins = imdilate(coins, text_fixer_se);
bincoins = coins == 1;
imshow(bincoins);
sum(coins(:) == 1)