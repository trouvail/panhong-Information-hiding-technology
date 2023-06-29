image = imread('lena.bmp');
% [m, n] = size(image);
m = 512;
n = 512;

figure;

for layer = 1:8
	layer_image = zeros(m, n);
	for i = 1:m
		for j = 1:n
			layer_image(i, j) = bitget(image(i, j), layer);
		end
	end
	subplot(2, 4, layer);
	imshow(layer_image);
	title(layer);
end