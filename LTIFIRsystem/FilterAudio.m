clear
close all
clc

% Load data with impulse responses for the different LTI FIR filters
load filters

% If experiencing problems with recording, run the following command:
% audiodevreset;

% Parameters
Fs = 48000; % Sampling frequency in Hz (1000 to 200000 in Josef's computer)
nBits = 24;  % Number of bits to select (8, 16, and 24)
nChannels = 1; % Number of channels, one channel per microphone
RecTime = 1; % Recording time in seconds

myVoice = audiorecorder(Fs, nBits, nChannels);

% Create output in Command Window to mark when recording starts
% and ends.
disp('Start speaking.'); % Recording starts shortly after this appears in command window
recordblocking(myVoice, RecTime); % Starts audio recording and pauses script
disp('End of recording.');

% Extract recorded data from the myVoice object
audio = getaudiodata(myVoice); % When selecting multiple channels we get a matrix

soundsc(audio, Fs, nBits);
pause(RecTime + 1);

h = h7; % Select one of the filters
y = filter(h, 1, audio); % Filtering of the recorded data
soundsc(audio, Fs, nBits);
pause(RecTime + 1);

% Plot filter coefficients
figure
stem(0:34, h)
title('System impulse response h[n]/filter b_k coefficients')
xlabel('n')
ylabel('Amplitude')

% Plot system frequency response
figure
freqz(h, 1, [], Fs) % LTI FIR system frequency response, magnitude in dB i.e. 20*log10(abs(H))

% Plot frequency content (requires Signal Processing Toolbox)
% More on this later in the course when we cover chapter 8
% Included here just to provide some insight into the frequency content
figure
spectrogram(audio, Fs/4, Fs/8, [], Fs, 'yaxis')
figure
spectrogram(y, Fs/4, Fs/8, [], Fs, 'yaxis')
