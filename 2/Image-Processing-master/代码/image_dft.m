b=imread('lena.bmp');% ����ͼ������ֵ��b��
figure;
I=im2bw(b);
imshow(I);
title('(a)ԭʼͼ��');

figure;
fa=fft2(I);% ʹ��fft�������п��ٸ���Ҷ�任
ffa=fftshift(fa);% fftshift��������fft���������˳�򣬽���Ƶλ���Ƶ�Ƶ�׵����� 
image(abs(ffa));
title('(b)������');

figure;
mesh(abs(ffa));% ����������ͼ
title('(c)�����׵������ֲ�(������ͼ)');