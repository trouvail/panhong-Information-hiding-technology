a=imread('lena.bmp');%����ͼ������ֵ��b��
b=im2bw(a);%ת��Ϊ��ֵͼ��
figure;
imshow(b);
title('(a)ԭͼ��');

figure;
c=dct2(b);%������ɢ���ұ任
imshow(c);
title('(b)DCT�任ϵ��');

figure;
mesh(c);%����������ͼ
title('(c)DCT�任ϵ��(������ͼ)');