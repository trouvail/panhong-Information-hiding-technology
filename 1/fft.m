wav_name = 'tada.wav';
wav = audioread(wav_name);
% plot(wav);
f_wav = fft(wav);
plot(abs(fftshift(f_wav)));
% plot(fftshift(f_wav));