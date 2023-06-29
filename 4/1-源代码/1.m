x=imread('fig1.jpg');
y=imresize(x, [256, 256]);
I=rgb2gray(y); 
figure; 
imshow(I); 
title('灰度图像'); 
m=imread('fig2.jpg');
mm=imresize(m, [256, 256]); 
II=rgb2gray(mm); 
K=im2bw(II); 
figure; 
imshow(K); 
title('二值图像');

[Mc,Nc]=size(K);
v=uint8(zeros(size(y)));

for i=1:Mc
    for j=1:Nc
        v(i,j)=bitset(I(i,j),1,K(i,j));
    end
end
imwrite(v,'zyl_wm.png','png');
figure; 
imshow(v,[]); 
title('watermarked Image');

s=imread('zyl_wm.png'); 
[Mw,Nw]=size(s); 
w=uint8(zeros(size(s))); 
for i=1:Mw 
    for j=1:Nw 
        w(i,j)=bitget(s(i,j),1); 
    end 
end 
figure; 
imshow(w,[]); 
title('Recovered Watermark');