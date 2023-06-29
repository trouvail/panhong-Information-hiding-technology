wav_name = 'tada.wav';
[wav,fs] = audioread(wav_name); % 获得语音信号
len = length(wav); % 语音信号大小
wav_vec = zeros(len,1); % 预分配内存

for i = 1 : len % 语音信号转向量
    wav_vec(i) = wav(i);
end

[c,l] = wavedec(wav_vec,3,'db4'); % 小波基选用 Daubechies-4 小波
ca3 = appcoef(c,l,'db4',3); % 三级分解近似分量
cd3 = detcoef(c,l,3); % 三级分解细节分量
cd2 = detcoef(c,l,2); % 三级分解细节分量
cd1 = detcoef(c,l,1); % 三级分解细节分量
wav0 = waverec(c,l,'db4'); % 逆 dwt
figure
subplot(3,2,1),plot(wav);
subplot(3,2,2),plot(ca3); % 三级分解细节分量
subplot(3,2,3),plot(cd1); % 一级分解近似分量
subplot(3,2,4),plot(cd2); % 二级分解近似分量
subplot(3,2,5),plot(cd3); % 三级分解近似分量
subplot(3,2,6),plot(wav0); % 三级重构
axes_handle = get(gcf, 'children');
axes(axes_handle(6)); title('(1) wav original');
axes(axes_handle(5)); title('(2) 3 detail component');
axes(axes_handle(4)); title('(3) 1 approximation');
axes(axes_handle(3)); title('(4) 2 approximation');
axes(axes_handle(2)); title('(5) 3 approximation');
axes(axes_handle(1)); title('(6) wav recover');s