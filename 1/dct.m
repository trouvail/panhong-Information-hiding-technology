wav_name = 'tada.wav';
[wav,fs] = audioread(wav_name); % 获得语音信号
len = length(wav); % 语音信号大小
wav_vec = zeros(len,1); % 预分配内存

for i = 1 : len % 语音信号转向量
    wav_vec(i) = wav(i);
end

da = dct(wav_vec); % dct
wav0 = idct(da); % 逆 dct
figure
subplot(3,1,1),plot(wav);
subplot(3,1,2),plot(da); % dct
subplot(3,1,3),plot(wav0); % 重构
axes_handle = get(gcf, 'children');
axes(axes_handle(3)); title('(1) wav original');
axes(axes_handle(2)); title('(2) wav dct');
axes(axes_handle(1)); title('(3) wav recover');