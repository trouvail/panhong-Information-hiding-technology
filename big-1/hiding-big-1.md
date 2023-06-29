- 黑白二值（叠像术）

```MATLAB
clear;
[A,M] = imread('fig1.jpg', 'jpg');
figure('name','原图');
imshow(A);

[B1,N1] = imread('fig2.jpg', 'jpg');
figure('name','伪装1');
imshow(B1);

[B2,N2] = imread('fig3.jpg', 'jpg');
figure('name','伪装2');
imshow(B2);

bw = im2bw(A);
figure('name','二值');
imshow(bw);
imwrite(bw,'bw.bmp');%二值图

bw1 = im2bw(B1);
figure('name','二值1');
imshow(bw1);
imwrite(bw1,'w1.bmp');%伪装二值图1

bw2 = im2bw(B2);
figure('name','二值2');
imshow(bw2);
imwrite(bw2,'w2.bmp');%伪装二值图2

[ C1,C2 ] = decwithimg( bw,bw1,bw2 );% 利用自定义函数decwithimg()分解得到有伪装的子图

figure('name','z1');
imshow(C1);
imwrite(C1,'z1.bmp');% 带伪装子图一

figure('name','z2');
imshow(C2);
imwrite(C2,'z2.bmp');% 带伪装子图二

D = C1.*C2;% 两张图像叠加还原，应该用乘法。

figure('name','origin');
imshow(D);
imwrite(D,'origin.bmp');% 恢复图片
```



- 灰度图像（叠像术）

```MATLAB
clear;
[A,M] = imread('fig1.jpg', 'jpg');
figure('name','原图');
imshow(A);

[B1,N1] = imread('fig2.jpg', 'jpg');
figure('name','伪装1');
imshow(B1);

[B2,N2] = imread('fig3.jpg', 'jpg');
figure('name','伪装2');
imshow(B2);

gray = rgb2gray(A);
gray=double(gray)/255;%把矩阵由UNIT8转换为实型  
gray1 = rgb2gray(B1);
gray1=double(gray1)/255;%把矩阵由UNIT8转换为实型  
gray2 = rgb2gray(B2);
gray2=double(gray2)/255;%把矩阵由UNIT8转换为实型  

bsd = im2hf(gray);
figure('name','原图半色调');
imshow(bsd);
imwrite(bsd,'bsd.bmp');%原图半色调

bsd1 = im2hf(gray1);
figure('name','伪装半色调1');
imshow(bsd1);
imwrite(bsd1,'w1.bmp');%伪装半色调1

bsd2 = im2hf(gray2);
figure('name','伪装半色调2');
imshow(bsd2);
imwrite(bsd2,'w2.bmp');%伪装半色调1

[ C1,C2 ] = decwithimg( bsd,bsd1,bsd2 );% 利用自定义函数decwithimg()分解得到有伪装的子图

figure('name','z1');
imshow(C1);
imwrite(C1,'z1.bmp');% 带伪装子图一

figure('name','z2');
imshow(C2);
imwrite(C2,'z2.bmp');% 带伪装子图二

D = C1.*C2;% 两张图像叠加还原，应该用乘法。

figure('name','origin');
imshow(D);
imwrite(D,'origin.bmp');% 恢复图片
```




- decwithimg（实现分解黑白二值图为两张有意义子图）

```MATLAB
function [ C1,C2 ] = decwithimg( bw,bw1,bw2 ) 

for i = 1:256
    for j = 1:256
        if bw(i,j) == 0
            if bw1(i,j) == 0 && bw2(i,j) == 0
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end  
            elseif bw1(i,j) == 1 && bw2(i,j) == 0
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end
            elseif bw1(i,j) == 0 && bw2(i,j) == 1
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 1;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end
            else
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 1;
                end
            end
        else
            if bw1(i,j) == 0 && bw2(i,j) == 0
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
            elseif bw1(i,j) == 1 && bw2(i,j) == 0
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
            elseif bw1(i,j) == 0 && bw2(i,j) == 1
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
            else
                random_zyl_num = randi([0 3]);
                if(random_zyl_num==0)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 0;C1(2*i-1,2*j) = 1;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 0;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==1)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 1;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 0;
                end
                if(random_zyl_num==2)
                    C1(2*i-1,2*j-1) = 0;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 1;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 0;C2(2*i,2*j) = 1;
                end
                if(random_zyl_num==3)
                    C1(2*i-1,2*j-1) = 1;C1(2*i,2*j-1) = 1;C1(2*i-1,2*j) = 0;C1(2*i,2*j) = 0;
                    C2(2*i-1,2*j-1) = 1;C2(2*i,2*j-1) = 0;C2(2*i-1,2*j) = 1;C2(2*i,2*j) = 0;
                end
            end
        end
    end
end

end
```







- im2hf（实现灰度图片半色调）

```MATLAB
function [ I ] = im2hf( B )

a = 7 / 16;  
b = 3 / 16;  
c = 5 / 16;  
d = 1 / 16;%定义误差分配规则  
  
for i=1:256%对每行进行处理  
    for j=1:256%对每列进行处理  
        if B(i,j)<1/2%进行阈值比较  
            I(i,j) = 0;  
        else  
            I(i,j) = 1;  
        end  
        if j>1&&j<256&&i<256
            wc=(B(i,j)-I(i,j));%定义误差  
            B(i,j+1)=B(i,j+1)+wc*a;  
            B(i+1,j-1)=B(i+1,j-1)+wc*b;  
            B(i+1,j)=B(i+1,j)+wc*c;  
            B(i+1,j+1)=B(i+1,j+1)+wc*d;%误差分配  
        end
    end  
end  

end
```