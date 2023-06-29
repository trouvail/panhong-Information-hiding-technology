b=imread('lena.bmp');% 读入图像，像素值在b中
figure;
I=im2bw(b);
imshow(I);
title('(a)原始图像');

figure;
fa=fft2(I);% 使用fft函数进行快速傅立叶变换
ffa=fftshift(fa);% fftshift函数调整fft函数的输出顺序，将零频位置移到频谱的中心 
image(abs(ffa));
title('(b)幅度谱');

figure;
mesh(abs(ffa));% 画网格曲面图
title('(c)幅度谱的能量分布(立体视图)');