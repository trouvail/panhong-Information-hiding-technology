% lenaͼ���һ��С���任
b=imread('lena.bmp');
a=rgb2gray(b);
nbcol=size(a,1);
[ca1,ch1,cv1,cd1]=dwt2(a,'db4');
cod_ca1=wcodemat(ca1,nbcol);
cod_ch1=wcodemat(ch1,nbcol);
cod_cv1=wcodemat(cv1,nbcol);
cod_cd1=wcodemat(cd1,nbcol);
figure;
image([cod_ca1,cod_ch1;cod_cv1,cod_cd1]);
title('(a)ͼ��һ��С���ֽ�');