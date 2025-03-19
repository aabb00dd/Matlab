clear all;
close all;
clc
load signal.mat


N=fs*2; % Number of samples in the signal (note! the script is written only for N with even integers)
n=0:10*N; % vector with indices

% the signal
A=2; % Amplitude
k=50; % Coefficient
fas=0; % Phase given in degrees
s=A*cos((2*pi/N)*k*n+fas*(pi/180)); % pure signal
figure
plot(n,s);
xlabel('Sample n')
ylabel('Amplitude')
title('Pure sine signal')

N1=N;
% calculate spectrum
tic; % start timer
S=abs(fft(s,N1)); % Note, we are looking for the frequency, hence the magnitude of the spectrum is fully sufficient. FFT is performed on the entire signal which is N samples long.
elapsedTime=toc; % Stop timer and display the time in seconds in the Workspace and save in parameter elapsedTime.
S=S(1:N1/2+1)/N1; % Real data gives symmetric spectrum, half is enough. Division by N to get the correct amplitude

% plot with coefficient k on the x-axis
figure
stem(0:N1/2,S)
xlabel('Coefficient k')
ylabel('Magnitude')
title('Spectrum of the observed signal')

% plot with radians on the x-axis
figure
stem((0:N1/2)*(2*pi/N1),S)
xlabel('Frequency [rad]')
ylabel('Magnitude')
title('Spectrum of the observed signal')

% signal1
A1=5; % Amplitude
k1=50; % Coefficient
fas1=0; % Phase given in degrees
s1=A1*cos((2*pi/N)*k1*n+fas1*(pi/180)); % pure signal
% signal2
A2=3; % Amplitude
k2=75; % Coefficient
fas2=45; % Phase given in degrees
s2=A2*cos((2*pi/N)*k2*n+fas2*(pi/180)); % pure signal
% signal3
A3=2; % Amplitude
k3=200; % Coefficient
fas3=90; % Phase given in degrees
s3=A3*cos((2*pi/N)*k3*n+fas3*(pi/180)); % pure signal

s=s1+s2+s3; % signal s now contains 3 frequency components with their own amplitude, frequency, and phase.
figure
plot(n,s);
xlabel('Sample')
ylabel('Amplitude')
title('Signal with multiple components')

% calculate spectrum
S=abs(fft(signal,N1)); % Note, we are looking for the frequency, hence the magnitude of the spectrum is fully sufficient
S=S(1:N1/2+1)/N1; % Real data gives symmetric spectrum, half is enough. Division by N to get the correct amplitude

% plot with coefficient k on the x-axis
figure
stem((0:N1/2),S)
xlabel('Coefficient k')
ylabel('Magnitude')
title('Spectrum of the observed signal')

% plot with radians on the x-axis
figure
stem((0:N1/2)*(2*pi/N1),S)
xlabel('Frequency [rad]')
ylabel('Magnitude')
title('Spectrum of the observed signal')
