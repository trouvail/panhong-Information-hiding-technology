image = imread('lena.bmp');
% [m, n] = size(image);
m = 512;
n = 512;
temp_image = image;

figure;
for layer = 1:8
    for i = 1:m
        for j = 1:n
            temp_image(i, j) = bitset(temp_image(i, j), layer, 0);
        end
    end
    subplot (2, 4, layer); 
    imshow(temp_image); 
    title(['without-', num2str(layer), '-layer']);
end