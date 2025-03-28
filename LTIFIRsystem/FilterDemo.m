% The script demonstrates how to filter out noise from an audio signal
close all
clear
clc

% Load data into Workspace
load sounddata 

y = filter(h, 1, sound); % Filter the sound signal with system h (compare with conv() command)

soundsc(audio, fs); % Play original audio file (for comparison)
pause(11)

soundsc(sound, fs); % Signal with added random noise in higher frequency band
pause(11)

soundsc(y, fs); % Audio after noise reduction through filtering with LTI FIR system h
pause(11)

% Plot filter coefficients
figure
stem(0:34, h)
title('System impulse response h[n]/filter b_k coefficients')
xlabel('n')
ylabel('Amplitude')

% Plot system frequency response
figure
freqz(h, 1, [], fs) % LTI FIR system frequency response, magnitude in dB i.e. 20*log10(abs(H)))

% Plot frequency content (requires Signal Processing Toolbox)
% More on this later in the course when we cover chapter 8
% Included here just to provide some insight into the frequency content
figure
spectrogram(audio, fs/4, fs/8, [], fs, 'yaxis')
title('Original audio')

figure
spectrogram(sound, fs/4, fs/8, [], fs, 'yaxis')
title('Added noise')

figure
spectrogram(y, fs/4, fs/8, [], fs, 'yaxis')
title('After filtering')
