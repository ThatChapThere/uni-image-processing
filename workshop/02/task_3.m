image = imread('Lenna.png');

gray_image = rgb2gray(image);

row1 = 0;
row2 = 50;

col1 = 75;
col2 = 200;

B = uint8(zeros(col2 - col1, row2 - row1))

ROW = 0;
for row = row1:row2
    ROW = ROW + 1;
    COL = 0;
    for col = col1:col2
        COL = COL + 1;
        B(ROW,COL) = gray_image(row,col);
    end
end