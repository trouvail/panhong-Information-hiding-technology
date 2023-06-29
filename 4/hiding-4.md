# 信息隐藏技术第四次实验 —— `LSB隐藏法`

> **学号：2013921  
姓名：周延霖  
专业：信息安全**

## 一、实验要求
---

### **1.实验要求**

1. 在 MATLAB 中调试完成
2. 编程实现，写出实验报告，含程序代码和截图，word/pdf 格式
3. QQ 群提交作业


### **2.实验目的**

1. 实现将二值图像嵌入到位图中
2. 实现将学号嵌入到位图中





## 二、实验原理

### **1.特点**

1. 简单，易实现，容量大
2. 安全性不高，不能抵抗叠加噪声、有损压缩等破坏





### **2.基本原理**

对空域的LSB做替换，用来替换LSB的序列就是需要加入的水印信息、水印的数字摘要或者由水印生成的伪随机序列。由于水印信息嵌入的位置是LSB，为了满足水印的不可见性，允许嵌入的水印强度不可能太高。然而针对空域的各种处理，如游程编码前的预处理，会对不显著分量进行一定的压缩，所以LSB算法对这些操作很敏感




### **3.基本步骤**

1. 将原始载体图像的空域像素值由十进制转换成二进制
2. 用二进制秘密信息中的每一比特信息替换与之相对应的载体数据的最低有效位
3. 将得到的含秘密信息的二进制数据转换为十进制像素值，从而获得含秘密信息的图像





## 三、实验步骤



水印图像是二值图像，载体图像是与水印图像大小相同的 `256` 级灰度图像，进行 `LSB` 水印图像的嵌入和提取读取


### **1.将二值图像嵌入到位图中**


读取 `Lena 图像和 NK 图像`

其中 Lena 图像是**灰度图像**，NK 图像是**水印(二值)图像**


```MATLAB
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
```

- 函数原型：y=imread(filename,fmt)
- 功能：读取 fmt 指定格式的图像文件内容
- 输入参数：fileaname 表示图像文件名，字符串


原始图像如下所示：

![](https://i.imgtg.com/2023/04/10/6IWol.png)


将隐藏图像嵌入到载体图像的最低位平面，实现信息的隐藏

```MATLAB
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
```


嵌入水印后的图像如下所示：

![](https://i.imgtg.com/2023/04/10/6ITVb.png)


可以看出，在视觉方面伪装对象和载体对象无法区分

提取伪装对象的最低位平面，恢复隐藏的图像

```MATLAB
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
```


恢复后的水印图像如下所示：

![](https://i.imgtg.com/2023/04/10/6IBgP.png)





### **2.将学号(一个整数)嵌入到位图中**

利用 `LSB` 方法将学号`2013921`嵌入到载体图像中


读取 Lena 灰度图像并调整大小

```MATLAB
x=imread('fig1.jpg');
u=imresize(x, [256, 256]); 
I=rgb2gray(u); 
figure; 
imshow(I); 
title('灰度图像');
```

灰度图像如下所示：

![](https://i.imgtg.com/2023/04/10/6Io2F.png)

嵌入学号 `2013921` 后得到水印图像



```MATLAB
y=I;
for t=1:24
    s=bitget(2013921,t); 
    y(1,t)=bitset(I(1,t),1,s); 
end

imwrite(y,'zyl_wm2.png','png'); 
figure; 
imshow(y,[]); 
title('Watermarked Image-2');
```


水印图像如下所示：

![](https://i.imgtg.com/2023/04/10/6I5W6.png)


从水印图像中提取学号

```MATLAB
v=imread('zyl_wm2.png'); 
w=zeros(1);
for t=1:24
    k=bitget(v(1,t),1); 
    w=bitset(w,t,k); 
end 

str=['学号是：',num2str(w)]; 
disp(str);
```

最终结果如下所示，可以看到结果正确：


![](https://i.imgtg.com/2023/04/10/6Ibrg.png)











## 四、总结与展望
---


本次实验利用 `MATLAB` 对秘密图像进行 `LSB` 隐藏，将秘密信息隐藏在载体较低比特的噪声位，实现秘密信息的水印嵌入和提取算法



通过对所学到的理论知识进行相应的应用，对`MATLAB`的应用也更加的熟练，最后期待自己未来更好的发展，`心想事成、万事胜意、未来可期`




