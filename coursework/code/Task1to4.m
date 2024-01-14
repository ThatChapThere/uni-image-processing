clear; close all;

save_report_images = true;

% Task 1: Pre-processing -----------------------
% Step-1: Load input image
I = imread('images/IMG_01.jpg');
%figure, imshow(I), title('Input Image');

% Step-2: Covert image to grayscale
I_gray = rgb2gray(I);
%figure, imshow(I_gray), title('Grayscaled Image');

% Step-3: Rescale image
I_scaled = imresize(I_gray, 0.5, 'bilinear');
figure, imshow(I_scaled), title('Scaled Image');

% Step-4: Produce histogram before enhancing
H_scaled = figure, imhist(I_scaled), title('Pre-enhancement Histogram');

% Step-5: Enhance image before binarisation
I_adjusted = imadjust(I_scaled);
figure, imshow(I_adjusted), title('Enhanced Image');

% Step-6: Histogram after enhancement
H_adjusted = figure, imhist(I_adjusted), title('Post-enhancement Histogram');

% Step-7: Image Binarisation
cutoffX = 500;
left_half =  I_adjusted(:,1:cutoffX);
right_half = I_adjusted(:,  cutoffX+1:end);
left_half  = im2bw(left_half,  70 /255);
right_half = im2bw(right_half, 130/255);
%figure, imshow(left_half);
%figure, imshow(right_half);
I_naively_binarised = im2bw(I_adjusted, 90/255);
%figure, imshow(I_naively_binarised), title('Binarised Image without Adaptive Thresholding');
I_binarised = [left_half right_half];
figure, imshow(I_binarised), title('Binarised Image with Adaptive Thresholding');

% Task 2: Edge detection ------------------------
[~, threshold] = edge(I_adjusted, 'prewitt');
threshold = threshold;
E_prewitt = edge(I_adjusted, 'prewitt', threshold);
%figure, imshow(E_prewitt), title('Prewit Edge Detectiont');

[~, threshold] = edge(I_adjusted, 'sobel');
E_sobel = edge(I_adjusted, 'sobel', threshold);
%figure, imshow(E_sobel), title('Sobel Edge Detection');

[~, threshold] = edge(I_adjusted, 'canny');
threshold = threshold * 6;
E_canny = edge(I_adjusted, 'canny', threshold);
figure, imshow(E_canny), title('Canny Edge Detection');

% laplacian
% reference mask somehow? It's in lecture 7
mask = [ 0 -1  0
	    -1  4 -1
	     0 -1  0];
mask = mask / 50;
E_laplacian = conv2(I_adjusted, mask);
%figure, imshow(E_laplacian), title('Laplacian Edge Detection');

% Task 3: Simple segmentation --------------------
close all;
mask = zeros(size(I_adjusted));
mask(1:end-1,1:end-1) = 1;
S = activecontour(I_adjusted, mask);
figure, imshow(S), title('Segmented Image');

% Task 4: Object Recognition --------------------

% Saving images for report --------------------

if save_report_images
	saveas(H_scaled, '../report/images/scaled_histogram.png');
	saveas(H_adjusted, '../report/images/enhanced_histogram.png');
	imwrite(I_scaled, '../report/images/scaled.png');
	imwrite(I_adjusted, '../report/images/enhanced.png');
	imwrite(I_binarised, '../report/images/binarised.png');
	imwrite(I_naively_binarised, '../report/images/naively_binarised.png');
	imwrite(E_prewitt, '../report/images/prewitt.png');
	imwrite(E_sobel, '../report/images/sobel.png');
	imwrite(E_canny, '../report/images/canny.png');
	imwrite(E_laplacian, '../report/images/laplacian.png');
end
