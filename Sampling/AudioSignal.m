% Demo of how to record audio data using computer's microphone directly into MATLAB
% Should work for both PC and Mac
clear
close all
clc

% Parameters
Fs = 200000; % Sampling frequency in Hz (1000 to 200000 in Josef's computer)
nBits = 24;  % Number of bits to select (8, 16, and 24)
nChannels = 2; % Number of channels, one channel per microphone
RecTime = 10; % Recording time in seconds

myVoice = audiorecorder(Fs, nBits, nChannels);

% Create output in Command Window to mark when recording starts and stops
myVoice.StartFcn = 'disp(''Start speaking'')';
myVoice.StopFcn = 'disp(''End of recording'')';

record(myVoice, RecTime); % Start audio recording

pause(RecTime+1); % Pause until recording is complete (necessary)
% play(myVoice); % Play back the recorded data

% Extract recorded data from the myVoice object
data = getaudiodata(myVoice); % When selecting multiple channels we get a matrix
audio = data(:,1); % Take data from first channel

% sound() and soundsc() are two other functions that can be used to
% play audio. If you want to use either of these, comment out play()
% on line 23. You can choose other options for Fs and nBits to
% manipulate the recording.

% sound(audio,Fs,nBits);
soundsc(audio,Fs,nBits);

t = 0:1/Fs:RecTime-1/Fs; % Time vector
% Plot audio time signal
figure(1)
plot(t,audio);
xlabel('Time (secs)');
ylabel('Amplitude')

% Plot frequency content (requires Signal Processing Toolbox)
% More on this later in the course when we cover chapter 8
% Included here just to provide some insight into the frequency content
figure(2)
spectrogram(audio,'yaxis')
