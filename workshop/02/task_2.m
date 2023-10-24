image = uint8(zeros(200, 200));

w = size(image, 1);
h = size(image, 2);

radius = 100;
for row = 1:w
    for col = 1:h
        dx = w/2 - row;
        dy = h/2 - col;
        if(sqrt(dx^2 + dy^2)) < radius
            % This does weird stuff with a radius of less than 100 because
            % the col variable starts at the left of the overall image not
            % the left of the circle, and yet is always divided by.
            image(row, col) = min(255 * col / radius, 255);
        end
    end
end

imshow(image)