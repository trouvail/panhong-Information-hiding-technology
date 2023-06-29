x=rgb2gray(imread('lena.bmp'));
y=double(rgb2gray(imread('fig1.jpg')));
[m,n]=size(y);

origin=x;

%加密
for i=1:m
    for j=1:n
        if checksum(x,i,j)~=y(i,j)
            random=int8(rand()*3);
            switch random
                case 0
                    x(2*i-1,2*j-1)=bitset(x(2*i-1,2*j-1),1,~bitget(x(2*i-1,2*j-1),1));
                case 1
                    x(2*i-1,2*j)=bitset(x(2*i-1,2*j),1,~bitget(x(2*i-1,2*j),1));
                case 2
                    x(2*i,2*j-1)=bitset(x(2*i,2*j-1),1,~bitget(x(2*i,2*j-1),1));
                case 3
                    x(2*i,2*j)=bitset(x(2*i,2*j),1,~bitget(x(2*i,2*j),1));
            end
        end
    end
end

imwrite(x,'watermarkedImage.bmp');

subplot(2,2,1);
imshow(origin,[]);
title('原始图片');

subplot(2,2,2);
imshow(y,[]);
title('水印');

subplot(2,2,3);
imshow(x,[]);
title('密图');