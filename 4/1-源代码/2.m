x=imread('fig1.jpg');
u=imresize(x, [256, 256]); 
I=rgb2gray(u); 
figure; 
imshow(I); 
title('灰度图像');

y=I;
for t=1:24
    s=bitget(2013921,t); 
    y(1,t)=bitset(I(1,t),1,s); 
end

imwrite(y,'zyl_wm2.png','png'); 
figure; 
imshow(y,[]); 
title('Watermarked Image-2');

v=imread('zyl_wm2.png'); 
w=zeros(1);
for t=1:24
    k=bitget(v(1,t),1); 
    w=bitset(w,t,k); 
end 

str=['学号是：',num2str(w)]; 
disp(str);
