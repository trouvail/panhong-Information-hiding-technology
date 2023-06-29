# 信息隐藏技术第二次实验 —— `图像信号处理`

> **学号：2013921  
姓名：周延霖  
专业：信息安全**

## 一、常用语音处理算法简介
---

### **1、傅立叶变换与短时傅立叶变换**

![](https://great.wzznft.com/i/2023/03/15/w9ap75.png)


### **2、小波变换**


![](https://great.wzznft.com/i/2023/03/15/w9b01j.png)



### **3、离散余弦变换**


![](https://great.wzznft.com/i/2023/03/15/w9bdp7.png)



## 二、代码实现与解释
---

在本次实验中所有的代码均用MATLAB来实现，具体代码如下所示：



### **1、傅里叶变换**


```MATLAB
b=imread('lena.bmp');% 读入图像，像素值在b中
figure;
I=im2bw(b);
imshow(I);
title('(a)原始图像');

figure;
fa=fft2(I);% 使用fft函数进行快速傅立叶变换
ffa=fftshift(fa);% fftshift函数调整fft函数的输出顺序，将零频位置移到频谱的中心 
image(abs(ffa));
title('(b)幅度谱');

figure;
mesh(abs(ffa));% 画网格曲面图
title('(c)幅度谱的能量分布(立体视图)');
```


利用`fft2()`函数进行傅里叶变换，利用`fftshift()`函数调整`fft2()`函数的输出顺序，将零频位置移到频谱的中心



### **2、一级小波分解**

```MATLAB
% lena图像的一级小波变换
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
title('(a)图像一级小波分解');
```


利用`dwt2()`函数进行一级小波分解


### **3、二级小波分解**


```MATLAB
%图像的二级小波变换
b=imread('lena.bmp');
a=rgb2gray(b);
nbcol=size(a,1);
[ca1,ch1,cv1,cd1]=dwt2(a,'db4');
[ca2,ch2,cv2,cd2]=dwt2(ca1,'db4');
cod_ca1=wcodemat(ca1,nbcol);
cod_ch1=wcodemat(ch1,nbcol);
cod_cv1=wcodemat(cv1,nbcol);
cod_cd1=wcodemat(cd1,nbcol);
cod_ca2=wcodemat(ca2,nbcol);
cod_ch2=wcodemat(ch2,nbcol);
cod_cv2=wcodemat(cv2,nbcol);
cod_cd2=wcodemat(cd2,nbcol);
tt=[cod_ca2,cod_ch2;cod_cv2,cod_cd2];
tt=imresize(tt,[size(ca1,1),size(ca1,1)]);
figure;
image([tt,cod_ch1;cod_cv1,cod_cd1]);
title('(b)图像二级小波分解');
```

利用`dwt2()`函数进行一级小波分解后，对`ca1`再次分解，可以得到二级小波分解



### **4、离散余弦变换**





```MATLAB
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
title('(c)DCT变换系数');
```


利用`dct2()`函数进行离散余弦变换



## 三、实验结果
---

### **1、傅里叶变换**






下图为lena的二值图像

![](https://great.wzznft.com/i/2023/03/15/8yqjyr4.png)


下图为对其做傅里叶变换得到幅度谱

![](https://great.wzznft.com/i/2023/03/15/w9vc5u.png)


下图为立体分布

![](https://great.wzznft.com/i/2023/03/15/w9vzxo.png)


### **2、一级小波分解**

对lena的灰度图像进行小波分解，再伪彩色处理，共分为如下四部分：


1. 近似部分
2. 水平方向细节部分
3. 垂直方向细节部分
4. 对角线方向细节部分

最终如下图所示：


![](https://great.wzznft.com/i/2023/03/15/w9wk6p.png)





### **3、二级小波分解**



对一级小波分解的近似部分再进行小波分解，可得到二级小波分解，最终结果如下图所示：


![](https://great.wzznft.com/i/2023/03/15/w9xgu6.png)




### **4、离散余弦变换**


下图为lena的二值图像

![](https://great.wzznft.com/i/2023/03/15/wa6p4w.png)


下图为对其做离散余弦变换得到幅度谱

![](https://great.wzznft.com/i/2023/03/15/wa6uwd.png)


下图为立体分布

![](https://great.wzznft.com/i/2023/03/15/wa7mui.png)



## 四、参考文献

- PentatonicScale,图像处理PSNR及其计算（OpenCV和matlab实现）,http://blog.csdn.net/laoxuan2011/article/details/51519062.



## 五、总结与展望
---


在本次实验中，首先学习了一些普遍的常用图像处理方法以及一些公式，比如二维离散傅立叶变换、二维离散小波变换等，然后通过在`MATLAB`中复现用快速傅立叶变换、一级小波分解、二级小波分解、离散余弦变换来对图像信号进行处理，对所学到的理论知识进行相应的应用，对`MATLAB`的应用也更加的熟练，最后期待自己未来更好的发展，`心想事成、万事胜意、未来可期`















