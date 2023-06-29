c=imread('watermarkedImage.bmp');
[m,n]=size(c);
secret=zeros(m/2,n/2);

for i=1:m/2
    for j=1:n/2
        secret(i,j)=checksum(c,i,j);
    end
end

%解密
imshow(secret,[]);
title('提取出的水印');