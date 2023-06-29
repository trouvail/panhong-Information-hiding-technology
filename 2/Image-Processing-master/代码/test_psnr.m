a=imread('lena.bmp');
b=imread('lena1.bmp');
[PSNR, MSE]=psnr(a,b)
a1=rgb2gray(a);
b1=rgb2gray(b);
[PSNR1, MSE1]=psnr(a1,b1)