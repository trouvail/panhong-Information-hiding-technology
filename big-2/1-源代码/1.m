% 读取音频文件
[y, fs] = audioread('origin.wav');

% 将信息转换为二进制形式 2013921是我的学号
msg = '2013921';
msg_bin = dec2bin(msg, 8);

% 将二进制信息嵌入音频文件中
bit_idx = 1;
for i = 1:length(y)
    if bit_idx > length(msg_bin(:))
        break;
    end
    
    % 将音频文件样本转换为二进制形式
    y_bin = dec2bin(round(y(i)*32767), 16);
    
    % 将信息嵌入音频文件样本中
    y_bin(end) = msg_bin(bit_idx);
    bit_idx = bit_idx + 1;
    
    % 将修改后的二进制样本转换回音频文件样本
    y(i) = bin2dec(y_bin)/32767;
end

% 将带有隐藏信息的音频文件保存
audiowrite('stego.wav', y, fs);