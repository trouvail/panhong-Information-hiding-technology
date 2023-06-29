a=imread('lena.bmp');%读入图像，像素值在b中
b=im2bw(a);%转换为二值图像
figure;
imshow(b);
title('(a)原图像');

figure;
c=dct2(b);%进行离散余弦变换
imshow(c);
title('(b)DCT变换系数');

figure;
mesh(c);%画网格曲面图
title('(c)DCT变换系数(立体视图)');