wav_name = 'tada.wav';
[wav,fs] = audioread(wav_name); % 获得语音信号
len = length(wav); % 语音信号大小
wav_vec = zeros(len,1); % 预分配内存

for i = 1 : len % 语音信号转向量
    wav_vec(i) = wav(i);
end

[ca1,cd1] = dwt(wav_vec,'db4'); % 小波基选用 Daubechies-4 小波
wav0 = idwt(ca1,cd1,'db4',len); % 逆 dwt
% wav0 = waverec(ca1,cd1,'db4'); % 逆 wavedec
figure
subplot(2,2,1),plot(wav);
subplot(2,2,2),plot(cd1); % 细节分量
subplot(2,2,3),plot(ca1); % 近似分量
subplot(2,2,4),plot(wav0);
axes_handle = get(gcf, 'children');
axes(axes_handle(4)); title('(1) wav original');
axes(axes_handle(3)); title('(2) detail component');
axes(axes_handle(2)); title('(3) approximation');
axes(axes_handle(1)); title('(4) wav recover');