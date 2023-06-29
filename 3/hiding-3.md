# 信息隐藏技术第三次实验 —— `图像的位平面实验`

> **学号：2013921  
姓名：周延霖  
专业：信息安全**

## 一、实验内容
---

***图像的位平面实验内容:***

1. 实现对 `1～8` 任意位平面的提取并显示
2. 实现对 `1～n` 低位平面的图像显示和 `8～(n+1)` 高位平面的图像显示
3. 实现去掉 `1～n` 位平面后的图像的显示





## 二、位平面




- 官方解释：


对一幅用多个比特表示其灰度值的图象来说,其中的每个比特可看作表示了1个二值的平面,也称位面。



- 通俗解释：


用图像作为底面,用表示像素亮度大小的8位二进制数作为高度,可形成一个立体直方图,各像素位置相同的位形成了一个平面,称为“位平面”







## 三、提取位平面


> 本次实验使用的图像为：

![](https://i.imgtg.com/2023/03/29/25c8B.png)


首先我们将每一层位平面都进行提取，位平面提取的代码如下：


```MATLAB
image = imread('lena.bmp');
% [m, n] = size(image);
m = 512;
n = 512;

figure;

for layer = 1:8
	layer_image = zeros(m, n);
	for i = 1:m
		for j = 1:n
			layer_image(i, j) = bitget(image(i, j), layer);
		end
	end
	subplot(2, 4, layer);
	imshow(layer_image);
	title(layer);
end
```





经过提取之后，可以得到每一层位平面的图像为:

![](https://i.imgtg.com/2023/03/29/25Gwb.png)


可以看出，越低位的位图越不规则，越高位的位图越体现出原图的特征。尤其是最低位的位图，看上去非常像一个随机的分布图。这是由于二进制数中，越低位的 bit 越容易改变，越高位的 bit 越难改变，从神经网络角度来看，高位平面保存了相对高维、整体的特征



## 四、显示部分位平面


在这一部分实验中，进行低位和高位的部分显示，相关代码如下：


```MATLAB
image = imread('lena.bmp');
% [m, n] = size(image);
m = 512;
n = 512;
temp_image = image;
zero_image = zeros(m, n);

for layer = 1:8
	for i = 1:m
		for j = 1:n

			zero_image(i, j) = bitset(zero_image(i, j), layer, bitget(image(i, j), layer));
			
			temp_image(i, j) = bitset(temp_image(i, j), layer, 0);
		end
	end

	figure;

	subplot(1, 2, 1); 
	imshow(zero_image, []); 
	title(['pre-', num2str(layer), '-layer-img']);

	subplot(1, 2, 2); 
	imshow(temp_image, []); 
	title(['without-', num2str(layer), '-layer-img']);

end
```

由于有8部分，其中的图片都在文件包`2`中，这里只展示其中两张：

> 1-3层与4-8层


![](https://i.imgtg.com/2023/03/29/250Dg.png)



> 1-5层与6-8层


![](https://i.imgtg.com/2023/03/29/25Snl.png)



可以看见在去除较低层的时候从观感上来说对原图没有特别大的影响，当去除了1-5层之后，在原图中才能看出有比较明显的模糊感，所以再次验证上文的说法




## 五、去除部分位平面



在本部分实验中，进行去除低层位平面图的实验，相关代码如下：


```MATLAB
image = imread('lena.bmp');
% [m, n] = size(image);
m = 512;
n = 512;
temp_image = image;

figure;
for layer = 1:8
    for i = 1:m
        for j = 1:n
            temp_image(i, j) = bitset(temp_image(i, j), layer, 0);
        end
    end
    subplot (2, 4, layer); 
    imshow(temp_image); 
    title(['without-', num2str(layer), '-layer']);
end
```



实验结果如下：


![](https://i.imgtg.com/2023/03/29/25ESP.png)


从实验结果来看，可以印证之前观察到的规律：

- 高位平面图保存了相对更多的特征。因此，可以看见前几幅图在去掉低位的位平面图时对整体图像的观感影响不大






## 六、总结与展望
---


本次实验我尝试进行了图像的位平面实验，我了解到了一张灰度图像具有的8个位平面各自的作用效果。由于处于低位的位平面含有的图像信息较少，并且对原图的影响相对较少，所以可以使用之前学过的 `shamir` 门限方式，将少量的子密钥图像存放到低位平面中，并且从观感上来看对原本的图像是没有什么影响的。或者可以直接将其他图像隐藏到较低的位平面中。本次实验中将8隐藏到了1的第一位平面中，从原图上并看不出来任何区别，隐藏效果还是不错的。



通过对所学到的理论知识进行相应的应用，对`MATLAB`的应用也更加的熟练，最后期待自己未来更好的发展，`心想事成、万事胜意、未来可期`




