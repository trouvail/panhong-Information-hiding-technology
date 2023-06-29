image = imread('lena.bmp');
% [m, n] = size(image);
m = 512;
n = 512;
temp_image = image;
zero_image = zeros(m, n);

for layer = 1:8
	for i = 1:m
		for j = 1:n

			zero_image(i, j) = bitset(zero_image(i, j), layer, bitget(image(i, j), layer));
			
			temp_image(i, j) = bitset(temp_image(i, j), layer, 0);
		end
	end

	figure;

	subplot(1, 2, 1); 
	imshow(zero_image, []); 
	title(['pre-', num2str(layer), '-layer-img']);

	subplot(1, 2, 2); 
	imshow(temp_image, []); 
	title(['without-', num2str(layer), '-layer-img']);

end







