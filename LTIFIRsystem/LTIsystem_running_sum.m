close all
clear
clc

b = ones(1,11)/11; % bk coefficients for LTI FIR system (in this example it's a running average filter)

N = 512; % Number of samples, choose even number
omega = -pi:(2*pi/512):pi; % Create vector with sampled frequency axis between -pi and pi with N samples
H = freqz(b, 1, omega); % Calculate frequency response H for FIR filter (complex)
absH = abs(H); % Magnitude of FIR filter
argH = angle(H); % Phase of FIR filter in radians

% Plot Magnitude
subplot(2,1,1)
plot(omega, absH)
axis([-pi pi 0 max(absH)])
xlabel('Frequency [rad]')
ylabel('Magnitude')

% Plot Phase
subplot(2,1,2)
plot(omega, argH)
axis([-pi pi -pi pi])
xlabel('Frequency [rad]')
ylabel('Phase [rad]')

% Test signal
n = 0:N-1; % Index vector
A = 2; % Amplitude
l = 258; % Sample position
w = omega(l); % Select test signal frequency from sampled omega vector (for N=512, positive omega starts from sample 257)
phase = 0; % Phase in degrees
s = A*cos(w*n + phase*(pi/180)); % Signal with one frequency component

y = conv(s, b, 'full'); % Convolution of signal with system
figure
plot(n, y(1:end-length(b)+1))
hold on

% Pre-calculated using eq. 6.6 in textbook chapter 6-2
y2 = absH(l)*A*cos(w*n + phase*(pi/180) + argH(l));
plot(n, y2, '--k')
hold off
xlabel('Time [s]')
ylabel('Amplitude')
legend('Convolved', 'Calculated')
