clear all;
close all;
clc

N = 2000; % Number of samples in signal (note: script written only for even N)
n = 0:N-1; % Index vector

% Generate sampled sinusoidal signal s[n]
A = 3; % Amplitude
f = 500; % Frequency in Hz
fs = 1000; % Sampling frequency in Hz
phase = 0; % Phase in degrees
s = A*cos(2*pi*(f/fs)*n + phase*(pi/180)); % Pure sinusoidal signal s[n] with normalized frequency, see eq. 4.2&4.3 in book

Ts = 1/fs; % Sampling time
Tf = 1/f; % Period time for s[n]
tn = 0:Ts:5*Tf; % Time vector with relevant length for plotting first 5 periods

% Generate oversampled s[n] to approximate "continuous-time" reference signal r(t)
Tr = 1/(40*fs); % Sampling time for reference signal (chosen to satisfy sampling theorem, 40x faster than selected sampling frequency)
t = 0:Tr:5*Tf; % Create time vector for 5 periods of signal
r = A*cos(2*pi*f*t + phase*(pi/180)); % Reference signal with unwrapped frequency

% Test for aliasing
if (2*pi*(f/fs) < pi) % No aliasing
    rec = r;
elseif (2*pi*(f/fs) == pi) % Aliasing at folding point (special case)
    Amp = A*cos(phase*(pi/180));
    rec = Amp*cos(2*pi*f*t);
else % Aliasing
    l = round((2*pi*(f/fs))/(2*pi)); % Calculate how many multiples of 2*pi to remove
    omega = (2*pi*(f/fs) - 2*pi*l)*fs; % Calculate aliased frequency in radians
    rec = A*cos(omega*t + phase*(pi/180)); % Generate ideally reconstructed signal with aliased frequency rec(t)
end

% Plot s[n], r(t) and rec(t) together
figure
stem(tn, s(1:length(tn))); % Plot samples of sampled signal s[n]
hold on
plot(t, r, 'r') % Plot reference signal r(t)
plot(t, rec, '--k') % Plot reconstructed signal rec(t)
hold off
xlabel('Time [s]')
ylabel('Amplitude')
title('Pure sine signal')
legend('Samples s[n]', 'Reference r(t)', 'Reconstructed rec(t)')

% Calculate spectrum with FFT. NOTE! In this lab just to see frequency content
% in s[n]. More about FFT when we cover chapter 8.
S = abs(fft(s)); % NOTE: we're looking for frequency, so magnitude spectrum is sufficient. FFT performed on entire N-sample signal.
S = S(1:N/2+1)/N; % Real data gives symmetric spectrum, so half is enough. Division by N for correct amplitude and +1 to get point at pi,fs/2.

% Plot with normalized f on x-axis and continuous curve
figure
plot(n(1:N/2+1)/N, S)
xlabel('Normalized frequency f/fs')
ylabel('Magnitude')
title('Spectrum of the sampled signal s[n]')

% Plot with f in Hz on x-axis and stem plot showing specific values
figure
stem(n(1:N/2+1)*(fs/(N)), S)
xlabel('Frequency [Hz]')
ylabel('Magnitude')
title('Spectrum of the sampled signal s[n]')
