# 信息隐藏技术第三次大作业 —— `研读文献`

> **学号：2013921  
姓名：周延霖  
专业：信息安全**



## 一、前情介绍
---


### **1.实验要求**

研读文献并复现其中的算法

- 内容：


在网上（例如`CNKI`）搜索一篇信息隐藏或数字水印的学术论文，复现其中的算法，有能力的同学可以对齐方法进行改进、实现


1. 写出实验报告，含程序代码和截图，word或pdf格式
2. 准备PPT
3. 课堂展示



### **2.选择文献**

在中国知网和万方等网站上搜索信息隐藏或数字水印的相关论文，在找寻大量论文后，发现了一个比较能提起我的兴趣的猫脸变换———也叫做`Arnold`变换，正因为这个名字的有趣性，所以在本次大作业中选择复现并改进





## 二、概念及背景
---

### **1.背景介绍**

图像作为人类认识和描述世界的一种基本方法，应用非常广泛，从古老的壁画、象形文字到现代的数字化视频，图像一直伴随着人类历史的发展。但是随着计算机网络和多媒体技术的迅速发展，人们越来越多的在互联网上输图像、视频等多媒体信息，开展如远程教学、网络办公等网络业务。许多重要的图像信息也会在互联网上传播，如：病人病例、设计图纸、电子政务、军事资料等，这些数据在网络传输时一旦被非法获取，则会泄露个人隐私，严重的甚至会影响国家安全，数字图像的安全保障问题日益凸显出来。这些重要的图像数据在互联网上传播时必须要进行有效的加密，图像置乱技术作为图像信息的一种加密算法应运而生


图像置乱就是把一幅给定的数字图像变成一幅杂乱无章的图像，这样其所要表达的真实信息就无法直观地得到，即使计算各种可能的组合也势必会花费巨大代价。但如果知道了置乱的方法和所采用的参数即密钥，只要进行逆置乱变换，即可恢复原始图像。因此，它既可以作为一种独立的图像加密技术，又可以用作数字图像水印、分存的预处理和后处理过程


图像置乱主要有位置置乱和灰度置乱两种。位置置乱即通过某种算法改变图像中各像素点的位置以达到图像加密的目的。灰度置乱就是通过改变各个像素点的灰度值来实现图像的加密。目前常用的图像置乱方法有：Arnold变换、幻方变换、分形Hilbert曲线、Tangram算法、Conway游戏、IFS模型、Gray码变换和广义Gray码变换、正交拉丁方、仿射变换、骑士巡游等。Arnold变换由于算法简单、置乱效果显著且具有周期性，在图像信息隐藏方面得到了很好的应用


### **2.概念介绍**

Arnold变换由于具有周期性，被广泛地应用于图像加密。但在利用其周期性进行解密时，有时会比较费时，因此编写了一种Arnold逆变换算法

接着在将二维改进到三维Arnold变换及逆变换

> (1)Arnold变换

Arnold 变换是 V.J Arnold 在遍历理论的研究中提出的一种变换，俗称猫脸变换(Cat Mapping）,假设在平面上的单位正方形内绘制一个猫脸图像，通过如下变换:

![a1](https://i.imgtg.com/2023/05/15/OMrmEI.png)



这个猫脸图像会由清晰变为模糊，这就是Arnold 变换。但是当具体到数字图像上，需要将上式中的二维 Arnold 变换改写为：

![a2](https://i.imgtg.com/2023/05/15/OMryaG.png)


其中，（x,y）是像素在原图像中的坐标，(x',y')是变换后该像素在新图像中的坐标，N 是图像矩阵的阶数，即图像的大小，一般指正方形图像


当对一幅图像进行 Arnold 变换时，就是把图像的像素点位置按照公式(2)进行移动，得到一个相对原图像混乱的图像。对—幅图像进行一次 Arnold 变换，就相当于对该图像进行了一次置乱。通常这一过程需要反复迭代多次才能达到满意的效果

利用 Arnold 变换对图像进行置乱。使有意义的数宇图像变成象白噪声一样的无意义图像，实现了信息的初步隐藏，并且置乱次数可以为水印系统提供密钥，从而增强了系统的安全性和保密性




> (2)Arnold变换的周期性及置乱恢复

Arnold 变换可以看作是裁剪和拼接的过程。通过这一过程，将数字图像矩阵中的像素重新排列，达到置乱的目的•。由于离散数宇图像是有限点集,对图像反复进行 Arnold 变换，迭代到一定步数时，必然会恢复原图，即 Arnold 变换具有周期性。利用这一周期特性可以实现逆置乱，下表是在不同阶数 N 下 Arnold 变换的周期。可以观察得出,Arnold 变换的周期性与图像大小有关，但并不成正比


![a3](https://i.imgtg.com/2023/05/15/OMrpID.png)

前面通过研究 Arnold 变换的周期性，已经得出了这样的结论：对于 N× N 的数字图像，只要满足 N为非1正整数，其 Arnold 变换均具有周期.用下代表NxN 的数宇图像的 Arnold 变换周期．若要对一幅进行过t(tE[1,TN])次Arnold置乱变换的数字图像进行恢复，只需对其继续进行(TN - 1)次 Arnold 置乱，即可得到与原图一模一样的图像；推广到任意置乱次数几，则需要继续进行(TN一nmodTN)次 Arnold 置乱变换




> (3)Arnold逆变换


Arnold 变换是一种简便的图像置乱方法，它的周期性是一个很好的性质，当反复利用 Arnold 变换，在某一个变换后，就能恢复成原图．Aenold 变换的周期性与图像大小有关，但并不成正比，因而在进行 Arnold 变换时，首先需要检测图像大小及置乱周期，而且在处理较大的图像时，利用周期性来恢复原图，势必会花费较长的时间。在实际中，将 Arnold 变换应用于数字图像水印时，应尽量减少它的时间和空间上的复杂度，这时，就只能考虑阶数小一点的图像，这就会限制水印图像的选择

于是，提出了一种 Arnold 变换的逆变换。由于Arnold 变换具有很好的代数结构，因而可以通过求 Arnold 变换的反函数来进行 Arnold 逆变换。对式(2）中的Arnold 变换定义方程进行推导，在已知(x’，y）和N 的情况下，求出(x,y）等价为：

![a4](https://i.imgtg.com/2023/05/15/OMrge1.png)

用数学函数的知识解这个方程组，会得到一些二元一次方程组，解之取解集的并集，得到 Arnold 变换的逆变换

但是这种方法讨论起来比较麻烦，可以用 Arnold 变换的变换矩阵的逆矩阵来作为 Arnold 逆变换的变换短阵，可以不用计算图像的大小和变换周期，大大节约了计算成本，只要知道变换的密钥，即变换次数，就可以利用 Arnold 逆变换变换同样的次数恢复出原图像


由 Arnold 逆变换的定义知道，当得到一幅经过n步 Arnold 变换的图像时，便可以利用 Arnold 逆变换迭代几步使一副置乱的图像恢复原图，而无需计算图像的大小及图像Arnold 变换的周期



## 三、原始方法复现
---


### **1.思路分析**


Arnold变换是一种二维映射并且具有可逆的特点，Arnold变换是V.J.Arnold 在研究遍历理论时提出的正方形区域的一种变换，该变换的特点是变换前后的像素位置虽然变乱，但是整个图像的面积不变，Arnold变换具有周期性即迭代到一定的次数能够变换为原图。Arnold 变换只能作用在方形图像上，在Arnold变换中和分别是变换前后的像素值，和在坐标图像中可表示为该图像的第行和第列。表示的是该图像在第行和第列的像素值。迭代次数增加会加深置乱程度，继续迭代达到周期时又可以变回原图。周期T为置乱的新图迭代为原图的最少次数


具体的各像素值位置置乱公式如下所示：


- x'=(5x+2y)mod(n)
- y'=(7x+3y)mod(n)

其中，与表示置乱后的像素值的行列位置，与表示原始图像的像素值的行列位置，表示图像的行数或列数

具体功能如下：

- 经过Arnold使变的“混乱不堪”，由于Arnold变换的周期性，继续使用Arnold变换，实现重现图像
- 利用Arnold变换的这种特性，可实现图像的加密与解密

理想状态经过Arnold使变的“混乱不堪”，让人眼看不出图像的真实内容

解密后图像又不失真



### **2.代码实现**

- 加密函数的代码如下：

```MATLAB
A=imread('1','jpg');
C=imread('1','jpg');

C=rgb2gray(C);
A=rgb2gray(A);

imshow(A);

for k=1:50
     for x=1:508
        for y=1:508
            x1=x+y;
            y1=x+2*y;
            if(x1>508)
                x1=mod(x1,508);
            end
            if(y1>508)
                y1=mod(y1,508);
            end

            if x1==0
                x1=508;
            end

            if y1==0
                y1=508;
            end

            B(x1,y1)=A(x,y);
        end
     end
     A=B;

     if(A==C)
        d=k;
     end
end

imshow(B);
imwrite(B,'2.png')
```


- 解密函数的代码如下：

```MATLAB
clear

A=imread('2.png');

for k=1:50
     for x=1:508
        for y=1:508
            x1=2*x-y;
            y1=y-x;

            if(x1>508)
                x1=mod(x1,508);
            end

            if(y1>508)
                y1=mod(y1,508);
            end

            if x1<0
                x1=x1+508;
            end

            if y1<0
                y1=y1+508;
            end

            if x1==0
                x1=508;
            end

            if y1==0
                y1=508;
            end

            B(x1,y1)=A(x,y);
        end
     end
     A=B;
end

imshow(B);
imwrite(B,'3.png');
```







### **3.结果展示**


> 加密功能测试

首先为加密功能测试

- 输入一个明文图像如下图所示

![1](https://i.imgtg.com/2023/05/15/OMrRR6.jpg)


- 输出一个置乱图像如下图所示


![2](https://i.imgtg.com/2023/05/15/OMrDWb.png)


> 解密功能测试


其次是解密功能测试



- 输入一个加密图像如下图所示


![2](https://i.imgtg.com/2023/05/15/OMrDWb.png)


- 输出一个解密图像如下图所示

![3](https://i.imgtg.com/2023/05/15/OMrtjP.png)



## 四、改进方法提高
---

随着科学技术的发展，网络通讯的速度越来越快，同时，随着手机像素和提高功能的进步，人们对于图像数据的传输和存储的需求日益增长


而在这过程中，隐私问题也越来越受到人们重视，对于图像数据的加密成为信息安全研究领域的重点研究问题


### **1.思路分析**

> (1)二维加密

1. 找到图片的大小，其中width表示宽度，height表示高度
2. 随机数生成密钥key_updown和key_leftright，分别表示列像素和行像素平移的距离
3. 分别进行两次循环，第一次对所有列像素进行平移，第二次对行像素进行平移
4. 最后的到加密后的图像


- 该算法采用对称加密算法，其中密钥为随机生成的平移步数，需要将其发给解密者，然后对行像素和列像素进行反向平移，即可解密


> (2)三维加密


对于一个二维图像image，图像大小为N*N，对于图像中的任一像素点p(x, y)，其中x属于[0, N - 1]，y属于[0, N - 1], 将其坐标变换为p(x', y')，坐标变换满足下矩阵变换式子，其中矩阵A称为变换矩阵：

![b](https://i.imgtg.com/2023/05/15/OMrPhF.png)


该加密算法的密钥为利用变换矩阵的加密的次数N，解密的办法，可以利用可逆矩阵对原图像进行N次变换，或者继续利用变换矩阵对图像进行加密，直至一个周期




### **2.代码实现**



- 二维加密函数的代码如下：

```MATLAB
from PIL import ImageColor
from PIL import Image
import random

dog = Image.open('1.jpeg')

width, height = dog.size

dog_updown = dog.copy()
key_updown = []

for i in range(width):
    x = random.randint(0, height)
    key_updown.append(x)
    for j in range(height):
        pix = dog.getpixel((i, j))
        dog_updown.putpixel((i, (j + x) % width), pix)

dog_updown.save('2.jpeg')

dog_leftright = dog_updown.copy()
key_leftright = []

for j in range(height):
    x = random.randint(0, width)
    key_leftright.append(x)
    for i in range(height):
        pix = dog_updown.getpixel((i, j))
        dog_leftright.putpixel(((i + x) % width, j), pix)

dog_leftright.save('3.jpeg')

for j in range(height):
    x = key_leftright[j]
    key_leftright.append(x)
    for i in range(height):
        pix = dog_leftright.getpixel((i, j))
        dog_updown.putpixel(((i - x + width) % width, j), pix)


for i in range(width):
    x = key_updown[i]
    for j in range(height):
        pix = dog_updown.getpixel((i, j))
        dog.putpixel((i, (j - x + height) % width), pix)

dog.save('1.jpeg')
```


- 三维加密函数的代码如下：

```MATLAB
from PIL import Image
from numpy import asarray

dog = Image.open('new_dog2.jpeg')

width, height = dog.size

dog_array = asarray(dog)

def arnold(x, y, z):
    xx = (x + y + z) % 255
    yy = (x + 2 * y + 2 * z) % 255
    zz = (x + 2 * y + 3 * z) % 255
    return [xx, yy, zz]

for i in range(0, width):
    for j in range(0, height):
        x = dog_array[i][j]
        [a, b, c] = arnold(x[0], x[1], x[2])
        dog_array[i][j] = [a, b, c]

new_dog = Image.fromarray(dog_array)

new_dog.save('new_dog.jpeg')
```



### **3.结果展示**

> (1)二维加密

原始图像：

![1](https://i.imgtg.com/2023/05/15/OMrHyl.webp)

进行列平移后：

![2](https://i.imgtg.com/2023/05/15/OMrLsg.webp)

进行行平移后：

![3](https://i.imgtg.com/2023/05/15/OMrSGK.jpg)

回复后的原始图像：

![1](https://i.imgtg.com/2023/05/15/OMrHyl.webp)




> (2)三维加密



一次arnold置换：


![4](https://i.imgtg.com/2023/05/15/OMrGoB.webp)

五次arnold置换：


![5](https://i.imgtg.com/2023/05/15/OMrQes.webp)


十次arnold置换：


![6](https://i.imgtg.com/2023/05/15/OMr03a.webp)


十五次arnold置换：


![7](https://i.imgtg.com/2023/05/15/OMrdhS.jpg)

考虑到如果采用二维arnold变换加密，结果与平移算法比较，像素点打乱更随机，但是仍然保留了每个像素点的颜色信息

改进方法采用三维Arnold变换矩阵，对每个像素点的RGB值进行三维Arnold变换，最终加密的图像足够混乱，且发现变换次数越多，加密效果越好，但是一般一定次数之后，像素点颜色的随机性就已经趋于稳定了



## 五、总结与展望
---


本次实验先进行文献阅读，然后利用 `MATLAB` 复现文献中的`Arnold`变换，并成功实现二维和三维升级的变换

平移像素点的方法一定程度上可以对原图进行加密，但是仍然保留了原图色彩的特征

而arnold转置法对每个像素点的RGB值进行转置，进而对图片加密效果更好，计算量也更大，需要对每个像素点进行N次计算，其中每个像素点的计算包含对RGB三个值的变换

通过对所学到的理论知识进行相应的应用，对`MATLAB`的应用也更加的熟练，最后期待自己未来更好的发展，`心想事成、万事胜意、未来可期`




