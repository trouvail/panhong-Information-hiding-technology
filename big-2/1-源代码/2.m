% 读取带有隐藏信息的音频文件
[y, fs] = audioread('stego.wav');

% 从音频文件中提取隐藏的信息
msg_bin = '';
bit_idx = 1;
for i = 1:length(y)
    if bit_idx > 8*length('2013921')
        break;
    end
    
    % 将音频文件样本转换为二进制形式
    y_bin = dec2bin(round(y(i)*32767), 16);
    
    % 从音频文件样本中提取信息
    msg_bin = strcat(msg_bin, y_bin(end));
    bit_idx = bit_idx + 1;
end

% 将二进制信息转换为字符形式
msg = char(bin2dec(reshape(msg_bin, 8, []).'));

% 显示提取的信息 正确的结果应该是2013921
disp(msg);